package gov.mads.invent.adm.servicio;

import gov.mads.invent.adm.fachada.IUsuarioFAC;
import gov.mads.invent.adm.fachada.impl.UsuarioFAC;
import gov.mads.invent.adm.vista.OE_Autenticar;
import gov.mads.invent.adm.vista.OE_ConsultarFuncionarios;
import gov.mads.invent.adm.vista.OS_Autenticar;
import gov.mads.invent.adm.vista.OS_ConsultarFuncionarios;
import gov.mads.invent.adm.vista.UsuarioOE;
import gov.mads.invent.comun.servicio.API;
import gov.mads.invent.comun.servicio.jwt.JWT;
import gov.mads.invent.comun.servicio.jwt.JWTFiltro;
import gov.mads.invent.comun.vista.BusquedaOE;
import gov.mads.invent.comun.vista.ObjetoSalida;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import static gov.mads.invent.comun.servicio.jwt.JWTFiltro.JWT_HEADER_TOKEN;
import java.net.URISyntaxException;
import javax.jws.WebMethod;
import javax.jws.WebResult;
import javax.ws.rs.FormParam;

@Path("/admusuario")
public class UsuarioSERV {

    private IUsuarioFAC fachada;

    @POST
    @Path("/validarusuario")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public Response validarUsuario(UsuarioOE usuarioOE) throws Exception {

        fachada = new UsuarioFAC();
        ObjetoSalida objetoSalida = fachada.validarUsuario(usuarioOE);

        if (objetoSalida.getRespuesta() == null || objetoSalida.getRespuesta().isEmpty())
            return Response.status(Response.Status.UNAUTHORIZED).entity(objetoSalida).build();
        else
            return Response.status(Response.Status.OK).entity(objetoSalida).header(JWT_HEADER_TOKEN, JWTFiltro.contruirToken(JWTFiltro.obtenerUsuario(objetoSalida.getRespuesta()))).build();
    }

    @POST
    @Path("/registrarusuario")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @JWT
    public Response registrarUsuario(UsuarioOE usuarioOE) {

        fachada = new UsuarioFAC();
        ObjetoSalida objetoSalida = fachada.registrarUsuario(usuarioOE);
        return API.retornarRespuesta(objetoSalida);
    }

    @POST
    @Path("/consultarusuario")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @JWT
    public Response consultarUsuario(UsuarioOE usuarioOE) {

        fachada = new UsuarioFAC();
        ObjetoSalida objetoSalida = fachada.consultarUsuario(usuarioOE);
        return API.retornarRespuesta(objetoSalida);
    }

    @POST
    @Path("/consultargrilla")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @JWT
    public Response consultarGrilla(BusquedaOE busquedaOE) {

        fachada = new UsuarioFAC();
        ObjetoSalida objetoSalida = fachada.consultarGrilla(busquedaOE);
        return API.retornarRespuesta(objetoSalida);
    }

    @POST
    @Path("/actualizarusuario")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @JWT
    public Response actualizarUsuario(UsuarioOE usuarioOE) {

        fachada = new UsuarioFAC();
        ObjetoSalida objetoSalida = fachada.actualizarUsuario(usuarioOE);
        return API.retornarRespuesta(objetoSalida);
    }

    @POST
    @Path("/eliminarusuario")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @JWT
    public Response eliminarUsuario(UsuarioOE usuarioOE) {

        fachada = new UsuarioFAC();
        ObjetoSalida objetoSalida = fachada.eliminarUsuario(usuarioOE);
        return API.retornarRespuesta(objetoSalida);
    }
    
    @POST
    @Path("/validarUsuarioVital")
    @Consumes(MediaType.TEXT_XML)
    @Produces("application/json")
    @WebMethod(operationName = "Autenticar")
    @WebResult(name = "autenticar")
    public Response autenticarVital(OE_Autenticar OE) throws Exception {
        
        fachada = new UsuarioFAC();
        ObjetoSalida objetoSalida = fachada.registrarUsuarioVital(OE);
        OS_Autenticar OS = new OS_Autenticar();
        OS.setCodigoError(objetoSalida.getCodError().getValor());
        OS.setMensajeError(objetoSalida.getMsgError());
        
        if (objetoSalida.getRespuesta() == null || objetoSalida.getRespuesta().isEmpty()){
            return Response.status(Response.Status.UNAUTHORIZED).entity(objetoSalida).build();
        }else{
            return Response.status(Response.Status.OK).entity(OS).header(JWT_HEADER_TOKEN, JWTFiltro.contruirToken(JWTFiltro.obtenerUsuario(objetoSalida.getRespuesta()))).build();
        }
    }
    
    @POST
    @Path("/consultarUsuariosxentidad")
    @Consumes(MediaType.TEXT_XML)
    @Produces("application/json")
    @WebMethod(operationName = "consultarFuncionarios")
    @WebResult(name = "consultarFuncionarios")
    public Response consultarVital(OE_ConsultarFuncionarios OE) {
        
        fachada = new UsuarioFAC();
        OS_ConsultarFuncionarios objetoSalida = fachada.listarUsuarioVital(OE);
        return API.retornarRespuestaVital(objetoSalida);
    }
    
    @POST
    @Path("/redireccionarVital")
    @Consumes({ MediaType.APPLICATION_FORM_URLENCODED})//MediaType.TEXT_PLAIN,MediaType.APPLICATION_XML,MediaType.TEXT_XML,MediaType.APPLICATION_XHTML_XML})
    @Produces({ MediaType.APPLICATION_JSON})
    public Response redireccionarVital(@FormParam("datos")String OE) throws URISyntaxException, Exception{//UsuarioVitalOE OE) throws URISyntaxException, Exception {

        UsuarioFAC fac = new UsuarioFAC();
        ObjetoSalida objetoSalida = fac.validar(OE);
        if (objetoSalida.getRespuesta() == null || objetoSalida.getRespuesta().isEmpty()){
           java.net.URI ubicacion = new java.net.URI("../#/ingresarSistema");
            return Response.seeOther(ubicacion).entity(objetoSalida).build();//.status(Response.Status.OK).entity(objetoSalida).header(JWT_HEADER_TOKEN, JWTFiltro.contruirToken(JWTFiltro.obtenerUsuario(objetoSalida.getRespuesta()))).build();
        }
        else{
            java.net.URI ubicacion = new java.net.URI("../#/ive/token/"+ JWTFiltro.contruirToken(JWTFiltro.obtenerUsuario(objetoSalida.getRespuesta())));
            return Response.seeOther(ubicacion).build();//.entity(objetoSalida).header(JWT_HEADER_TOKEN, JWTFiltro.contruirToken(JWTFiltro.obtenerUsuario(objetoSalida.getRespuesta()))).build();//.status(Response.Status.OK).entity(objetoSalida).header(JWT_HEADER_TOKEN, JWTFiltro.contruirToken(JWTFiltro.obtenerUsuario(objetoSalida.getRespuesta()))).build();
        }
        
    }
}
