package gov.mads.invent.utl.servicio;

import gov.mads.invent.comun.servicio.API;
import gov.mads.invent.comun.servicio.jwt.JWT;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.utl.fachada.IListadosFAC;
import gov.mads.invent.utl.fachada.impl.ListadosFAC;
import gov.mads.invent.utl.vista.ListaOE;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/utllistados")
public class ListadosSERV {

    private IListadosFAC fachada;

    @POST
    @Path("/listarparametricas")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @JWT
    public Response listarParametricas(ListaOE objetoEntrada) {

        fachada = new ListadosFAC();
        ObjetoSalida objetoSalida = fachada.listarParametricas(objetoEntrada);
        return API.retornarRespuesta(objetoSalida);
    }

    @POST
    @Path("/listarautoridades")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @JWT
    public Response listarAutoridades(ListaOE objetoEntrada) {

        fachada = new ListadosFAC();
        ObjetoSalida objetoSalida = fachada.listarAutoridades(objetoEntrada);
        return API.retornarRespuesta(objetoSalida);
    }

    @POST
    @Path("/listardivipoladepto")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @JWT
    public Response listarDivipolaDepto(ListaOE objetoEntrada) {

        fachada = new ListadosFAC();
        ObjetoSalida objetoSalida = fachada.listarDivipolaDepto(objetoEntrada);
        return Response.status(Response.Status.OK).entity(objetoSalida).build();
    }

    @POST
    @Path("/listardivipolamcpio")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @JWT
    public Response listarDivipolaMcpio(ListaOE objetoEntrada) {

        fachada = new ListadosFAC();
        ObjetoSalida objetoSalida = fachada.listarDivipolaMcpio(objetoEntrada);
        return Response.status(Response.Status.OK).entity(objetoSalida).build();
    }

    @POST
    @Path("/listarcontaminantes")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @JWT
    public Response listarContaminantes(ListaOE objetoEntrada) {

        fachada = new ListadosFAC();
        ObjetoSalida objetoSalida = fachada.listarContaminantes(objetoEntrada);
        return Response.status(Response.Status.OK).entity(objetoSalida).build();
    }

    @POST
    @Path("/listarfuentes")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @JWT
    public Response listarFuentes(ListaOE objetoEntrada) {

        fachada = new ListadosFAC();
        ObjetoSalida objetoSalida = fachada.listarFuentes(objetoEntrada);
        return Response.status(Response.Status.OK).entity(objetoSalida).build();
    }

    @POST
    @Path("/listarcodigociiu")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @JWT
    public Response listarCodigoCIIU(ListaOE objetoEntrada) {

        fachada = new ListadosFAC();
        ObjetoSalida objetoSalida = fachada.listarCodigoCIIU(objetoEntrada);
        return Response.status(Response.Status.OK).entity(objetoSalida).build();
    }

    @POST
    @Path("/listarmetodoemision")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @JWT
    public Response listarMetodoEmision(ListaOE objetoEntrada) {

        fachada = new ListadosFAC();
        ObjetoSalida objetoSalida = fachada.listarMetodoEmision(objetoEntrada);
        return Response.status(Response.Status.OK).entity(objetoSalida).build();
    }

    @POST
    @Path("/listarUnidadMedidaFactorActividad")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @JWT
    public Response listarUnidadMedidaFactorActividad(ListaOE objetoEntrada) {

        fachada = new ListadosFAC();
        ObjetoSalida objetoSalida = fachada.listarUnidadMedidaFactorActividad(objetoEntrada);
        return Response.status(Response.Status.OK).entity(objetoSalida).build();
    }

    @POST
    @Path("/listarUnidadMedidaFactorEmision")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    @JWT
    public Response listarUnidadMedidaFactorEmision(ListaOE objetoEntrada) {

        fachada = new ListadosFAC();
        ObjetoSalida objetoSalida = fachada.listarUnidadMedidaFactorEmision(objetoEntrada);
        return Response.status(Response.Status.OK).entity(objetoSalida).build();
    }
}
