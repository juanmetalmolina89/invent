package gov.mads.invent.ive.servicio;

import gov.mads.invent.comun.servicio.API;
import gov.mads.invent.comun.servicio.jwt.JWT;
import gov.mads.invent.comun.vista.BusquedaOE;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.fachada.IInventarioFAC;
import gov.mads.invent.ive.fachada.impl.InventarioFAC;
import gov.mads.invent.ive.vista.InventarioOE;
import org.jboss.resteasy.plugins.providers.multipart.MultipartFormDataInput;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.io.File;
import java.io.IOException;

@Path("/inventario")
public class InventarioSERV {

    private IInventarioFAC fachada;

    @POST
    @Path("/registrarinventario")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @JWT
    public Response registrarInventario(InventarioOE objetoEntrada) {

        fachada = new InventarioFAC();
        ObjetoSalida objetoSalida = fachada.registrarInventario(objetoEntrada);
        return API.retornarRespuesta(objetoSalida);
    }

    @POST
    @Path("/registraradjunto")
    @Consumes({MediaType.MULTIPART_FORM_DATA})
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @JWT
    public Response registrarAdjunto(MultipartFormDataInput objetoEntrada) throws IOException {

        fachada = new InventarioFAC();
        ObjetoSalida objetoSalida = fachada.registrarAdjunto(objetoEntrada);
        return API.retornarRespuesta(objetoSalida);
    }

    @POST
    @Path("/consultarinventario")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @JWT
    public Response consultarInventario(InventarioOE objetoEntrada) {

        fachada = new InventarioFAC();
        ObjetoSalida objetoSalida = fachada.consultarInventario(objetoEntrada);
        return API.retornarRespuesta(objetoSalida);
    }

    @POST
    @Path("/consultarinventariofuente")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @JWT
    public Response consultarInventarioFuente(InventarioOE objetoEntrada) {

        fachada = new InventarioFAC();
        ObjetoSalida objetoSalida = fachada.consultarInventarioFuente(objetoEntrada);
        return API.retornarRespuesta(objetoSalida);
    }

    @POST
    @Path("/consultarinventariocontaminante")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @JWT
    public Response consultarInventarioContaminante(InventarioOE objetoEntrada) {

        fachada = new InventarioFAC();
        ObjetoSalida objetoSalida = fachada.consultarInventarioContaminante(objetoEntrada);
        return API.retornarRespuesta(objetoSalida);
    }

    @POST
    @Path("/consultargeometria")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @JWT
    public Response consultarGeometria(InventarioOE objetoEntrada) {

        fachada = new InventarioFAC();
        ObjetoSalida objetoSalida = fachada.consultarGeometria(objetoEntrada);
        return API.retornarRespuesta(objetoSalida);
    }

    @GET
    @Path("/consultaradjunto")
    @Produces("application/pdf")
    public Response consultarAdjunto(@QueryParam("codigoInventario") Integer codigoInventario, @QueryParam("idUsuario") Integer idUsuario) throws Exception {

        try {
            fachada = new InventarioFAC();
            File adjunto = fachada.consultarAdjunto(codigoInventario, idUsuario);
            if (adjunto != null && adjunto.exists()) {
                Response.ResponseBuilder response = Response.ok(adjunto);
                response.header("Content-Disposition", "attachment; filename=" + adjunto.getName());
                return response.build();
            }
            else {
                return Response.status(Response.Status.FORBIDDEN).build();
            }
        } catch (Exception e) {
            return Response.status(Response.Status.FORBIDDEN).build();
        }
    }

    @POST
    @Path("/consultargrilla")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @JWT
    public Response consultarGrilla(BusquedaOE objetoEntrada) {

        fachada = new InventarioFAC();
        ObjetoSalida objetoSalida = fachada.consultarGrilla(objetoEntrada);
        return API.retornarRespuesta(objetoSalida);
    }

    @POST
    @Path("/actualizarinventario")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @JWT
    public Response actualizarInventario(InventarioOE objetoEntrada) {

        fachada = new InventarioFAC();
        ObjetoSalida objetoSalida = fachada.actualizarInventario(objetoEntrada);
        return API.retornarRespuesta(objetoSalida);
    }

    @POST
    @Path("/cambiarestadoinventario")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @JWT
    public Response cambiarEstadoInventario(InventarioOE objetoEntrada) {

        fachada = new InventarioFAC();
        ObjetoSalida objetoSalida = fachada.cambiarEstadoInventario(objetoEntrada);
        return API.retornarRespuesta(objetoSalida);
    }
}
