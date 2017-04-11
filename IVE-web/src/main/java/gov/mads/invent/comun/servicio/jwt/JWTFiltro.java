package gov.mads.invent.comun.servicio.jwt;

import gov.mads.invent.adm.fachada.impl.UsuarioFAC;
import gov.mads.invent.adm.vista.UsuarioOE;
import gov.mads.invent.comun.entidad.IvetT002Usuario;
import gov.mads.invent.comun.vista.ObjetoSalida;
import org.jose4j.jwk.RsaJsonWebKey;
import org.jose4j.jws.AlgorithmIdentifiers;
import org.jose4j.jws.JsonWebSignature;
import org.jose4j.jwt.JwtClaims;
import org.jose4j.jwt.consumer.JwtConsumer;
import org.jose4j.jwt.consumer.JwtConsumerBuilder;

import javax.annotation.Priority;
import javax.ws.rs.Priorities;
import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.container.ContainerRequestFilter;
import javax.ws.rs.container.ContainerResponseContext;
import javax.ws.rs.container.ContainerResponseFilter;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.SecurityContext;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Priority(Priorities.AUTHENTICATION)
@JWT
public class JWTFiltro implements ContainerRequestFilter, ContainerResponseFilter {

    public static final String JWT_HEADER_TOKEN = "ive_token";
    public static final String APP_NAME = "IVE";

    @Override
    public void filter(ContainerRequestContext requestContext) {

        try {
            String encabezado = requestContext.getHeaderString("Authorization");

            if (encabezado.startsWith("Bearer")) {

                final JWTUsuario usuario = validarToken(encabezado.split(" ")[1]);
                final SecurityContext contexto = requestContext.getSecurityContext();

                if (usuario != null && usuario.getCodigo() != null) {
                    requestContext.setSecurityContext(new SecurityContext() {

                        @Override
                        public Principal getUserPrincipal() {

                            return new Principal() {

                                @Override
                                public String getName() {

                                    return usuario.getCodigo();
                                }
                            };
                        }

                        @Override
                        public boolean isUserInRole(String role) {

                            return contexto.isUserInRole(role);
                        }

                        @Override
                        public boolean isSecure() {

                            return contexto.isSecure();
                        }

                        @Override
                        public String getAuthenticationScheme() {

                            return contexto.getAuthenticationScheme();
                        }
                    });
                }
                else {
                    requestContext.setProperty("auth-failed", true);
                    requestContext.abortWith(Response.status(Response.Status.UNAUTHORIZED).build());
                }
            }
            else {
                requestContext.setProperty("auth-failed", true);
                requestContext.abortWith(Response.status(Response.Status.UNAUTHORIZED).build());
            }
        } catch (Exception e) {
            requestContext.setProperty("auth-failed", true);
            requestContext.abortWith(Response.status(Response.Status.UNAUTHORIZED).build());
        }
    }

    private JWTUsuario validarToken(String jwt) throws Exception {

        RsaJsonWebKey rsaJsonWebKey = JWTLlave.obtenerInstancia();
        JwtConsumer jwtConsumer = new JwtConsumerBuilder().setRequireSubject().setVerificationKey(rsaJsonWebKey.getKey()).build();
        JwtClaims jwtClaims = jwtConsumer.processToClaims(jwt);
        String usuario = (String) jwtClaims.getClaimValue("sub");
        return obtenerUsuario(usuario);
    }

    private JWTUsuario obtenerUsuario(String name) {

        Integer idUsuario = Integer.parseInt(name);
        UsuarioOE usuarioOE = new UsuarioOE();
        IvetT002Usuario ivetT002Usuario = new IvetT002Usuario();
        ivetT002Usuario.setA002codigo(idUsuario);
        usuarioOE.setUsuario(ivetT002Usuario);
        usuarioOE.setIdUsuario(idUsuario);
        ObjetoSalida objetoSalida = new UsuarioFAC().consultarUsuario(usuarioOE);
        return obtenerUsuario(objetoSalida.getRespuesta());
    }

    public static JWTUsuario obtenerUsuario(List<HashMap<String, Object>> respuesta) {

        JWTUsuario jwtUsuario;
        try {
            jwtUsuario = new JWTUsuario();
            for (HashMap<String, Object> row : respuesta) {
                jwtUsuario.setCodigo(row.get("A002CODIGO").toString());
                jwtUsuario.setUserName(row.get("A002USUARIO").toString());
                jwtUsuario.setNombre(row.get("A002NOMBRE").toString() + " " + row.get("A002APELLIDO").toString());
                jwtUsuario.setPerfil(row.get("A002TIPOUSUARIO").toString());
                jwtUsuario.setCar(row.get("A002AUTORIDADAMBIENTAL").toString());
                jwtUsuario.setPrimeraVez(row.get("A002PRIMERINGRESO").toString());
            }
        } catch (Exception e) {
            jwtUsuario = null;
        }

        return jwtUsuario;
    }

    @Override
    public void filter(ContainerRequestContext requestContext, ContainerResponseContext responseContext) throws IOException {

        try {
            if (requestContext.getProperty("auth-failed") != null) {
                Boolean fallido = (Boolean) requestContext.getProperty("auth-failed");
                if (fallido) {
                    return;
                }
            }

            JWTUsuario jwtUsuario = obtenerUsuario(requestContext.getSecurityContext().getUserPrincipal().getName());
            List<Object> jwtToken = new ArrayList<>();
            jwtToken.add(contruirToken(jwtUsuario));
            responseContext.getHeaders().put(JWT_HEADER_TOKEN, jwtToken);

        } catch (Exception e) {
            requestContext.setProperty("auth-failed", true);
            requestContext.abortWith(Response.status(Response.Status.UNAUTHORIZED).build());
        }
    }

    public static String contruirToken(JWTUsuario jwtUsuario) throws Exception {

        RsaJsonWebKey rsaJsonWebKey = JWTLlave.obtenerInstancia();

        JwtClaims claims = new JwtClaims();
        claims.setIssuer(APP_NAME);    // who creates the token and signs it

        claims.setSubject(jwtUsuario.getCodigo().toString()); // the subject/principal is whom the token is about
        claims.setClaim("username", jwtUsuario.getUserName()); // the subject/principal is whom the token is about
        claims.setClaim("nombre", jwtUsuario.getNombre());
        claims.setClaim("perfil", jwtUsuario.getPerfil());
        claims.setClaim("car", jwtUsuario.getCar());
        claims.setClaim("primeravez", jwtUsuario.getPrimeraVez());
        claims.setExpirationTimeMinutesInTheFuture(jwtUsuario.getMinExpiracion()); // token will expire (10 minutes from now)
        claims.setClaim("tiemposesion", jwtUsuario.getTiempoSesion());
        claims.setGeneratedJwtId(); // a unique identifier for the token
        claims.setIssuedAtToNow();  // when the token was issued/created (now)

        JsonWebSignature jws = new JsonWebSignature();
        jws.setPayload(claims.toJson());
        jws.setKey(rsaJsonWebKey.getPrivateKey());
        jws.setAlgorithmHeaderValue(AlgorithmIdentifiers.RSA_USING_SHA256);

        String jwt = jws.getCompactSerialization();
        return jwt;
    }
}
