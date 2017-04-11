package gov.mads.invent.ive.servicio;

import gov.mads.invent.comun.servicio.API;
import gov.mads.invent.comun.servicio.jwt.JWT;
import gov.mads.invent.comun.vista.BusquedaOE;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.fachada.ICategoriaFAC;
import gov.mads.invent.ive.fachada.impl.CategoriaFAC;
import gov.mads.invent.ive.vista.CategoriaOE;
import gov.mads.invent.ive.vista.ContaminanteOE;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/categoria")
public class CategoriaSERV {

    private ICategoriaFAC fachada;

    //region Categoria

    @POST
    @Path("/registrarCategoria")
    @Consumes({MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_JSON})
    @JWT
    public Response registrarCategoria(CategoriaOE categoriaOE) {

        fachada = new CategoriaFAC();
        ObjetoSalida objetoSalida = fachada.registrarCategoria(categoriaOE);
        return API.retornarRespuesta(objetoSalida);
    }

    @POST
    @Path("/actualizarCategoria")
    @Consumes({MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_JSON})
    @JWT
    public Response actualizarCategoria(CategoriaOE categoriaOE) {

        fachada = new CategoriaFAC();
        ObjetoSalida objetoSalida = fachada.actualizarCategoria(categoriaOE);
        return API.retornarRespuesta(objetoSalida);
    }

    @POST
    @Path("/consultarCategoriaId")
    @Consumes({MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_JSON})
    @JWT
    public Response consultarCategoriaId(CategoriaOE categoriaOE) {

        fachada = new CategoriaFAC();
        ObjetoSalida objetoSalida = fachada.consultarCategoriaId(categoriaOE);
        return API.retornarRespuesta(objetoSalida);
    }

    @POST
    @Path("/listarCategoria")
    @Consumes({MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_JSON})
    @JWT
    public Response listarCategoria(BusquedaOE busquedaOE) {

        fachada = new CategoriaFAC();
        ObjetoSalida objetoSalida = fachada.listarCategoria(busquedaOE);
        return API.retornarRespuesta(objetoSalida);
    }

    @POST
    @Path("/consultarGrillaCat")
    @Consumes({MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_JSON})
    @JWT
    public Response consultarGrillaCat(BusquedaOE busquedaOE) {

        fachada = new CategoriaFAC();
        ObjetoSalida objetoSalida = fachada.consultarGrillaCat(busquedaOE);
        return API.retornarRespuesta(objetoSalida);
    }

    @POST
    @Path("/consultarcategoriacodigociiu")
    @Consumes({MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_JSON})
    @JWT
    public Response consultarCategoriaCodigoCIIU(CategoriaOE categoriaOE) {

        fachada = new CategoriaFAC();
        ObjetoSalida objetoSalida = fachada.consultarCategoriaCodigoCIIU(categoriaOE);
        return API.retornarRespuesta(objetoSalida);
    }

    @POST
    @Path("/consultarcategoriatipocombustible")
    @Consumes({MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_JSON})
    @JWT
    public Response consultarCategoriaTipoCombustible(CategoriaOE categoriaOE) {

        fachada = new CategoriaFAC();
        ObjetoSalida objetoSalida = fachada.consultarCategoriaTipoCombustible(categoriaOE);
        return API.retornarRespuesta(objetoSalida);
    }

    @POST
    @Path("/eliminarcategoria")
    @Consumes({MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_JSON})
    @JWT
    public Response eliminarCategoria(CategoriaOE categoriaOE) {

        fachada = new CategoriaFAC();
        ObjetoSalida objetoSalida = fachada.eliminarCategoria(categoriaOE);
        return API.retornarRespuesta(objetoSalida);
    }

    //endregion Categoria

    //region Contaminante

    @POST
    @Path("/registrarContaminante")
    @Consumes({MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_JSON})
    @JWT
    public Response registrarContaminante(ContaminanteOE contaminanteOE) {

        fachada = new CategoriaFAC();
        ObjetoSalida objetoSalida = fachada.registrarContaminante(contaminanteOE);
        return API.retornarRespuesta(objetoSalida);
    }

    @POST
    @Path("/actualizarContaminante")
    @Consumes({MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_JSON})
    @JWT
    public Response actualizarContaminante(ContaminanteOE contaminanteOE) {

        fachada = new CategoriaFAC();
        ObjetoSalida objetoSalida = fachada.actualizarContaminante(contaminanteOE);
        return API.retornarRespuesta(objetoSalida);
    }

    @POST
    @Path("/consultarContaminanteId")
    @Consumes({MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_JSON})
    @JWT
    public Response consultarContaminanteId(ContaminanteOE contaminanteOE) {

        fachada = new CategoriaFAC();
        ObjetoSalida objetoSalida = fachada.consultarContaminanteId(contaminanteOE);
        return API.retornarRespuesta(objetoSalida);
    }

    @POST
    @Path("/consultarGrillaCon")
    @Consumes({MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_JSON})
    @JWT
    public Response consultarGrillaCon(BusquedaOE busquedaOE) {

        fachada = new CategoriaFAC();
        ObjetoSalida objetoSalida = fachada.consultarGrillaCon(busquedaOE);
        return API.retornarRespuesta(objetoSalida);
    }

    @POST
    @Path("/eliminarcontaminante")
    @Consumes({MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_JSON})
    @JWT
    public Response eliminarContaminante(ContaminanteOE contaminanteOE) {

        fachada = new CategoriaFAC();
        ObjetoSalida objetoSalida = fachada.eliminarContaminante(contaminanteOE);
        return API.retornarRespuesta(objetoSalida);
    }

    //endregion Contaminante
}
