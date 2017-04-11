package gov.mads.invent.ive.servicio;


import gov.mads.invent.comun.servicio.API;
import gov.mads.invent.comun.vista.ObjetoSalida;

import gov.mads.invent.comun.servicio.jwt.JWT;
import gov.mads.invent.comun.servicio.jwt.JWTFiltro;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import gov.mads.invent.ive.fachada.impl.InventarioFuenteFAC;
import gov.mads.invent.ive.vista.Insertar_11_OE;
import gov.mads.invent.ive.vista.Eliminar_11_OE;
import gov.mads.invent.ive.vista.Actualizar_11_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_11_OE;
/**
 * REST Web Service
 *
 * @author Ivan Chacon
*/
@Path("/inventarioFuente")
public class InventarioFuenteSERV { 

	@POST
	@Path("/insertar")
	@Consumes({MediaType.APPLICATION_JSON})
	@Produces({MediaType.APPLICATION_JSON})
	@JWT
	public Response insertar(Insertar_11_OE objetoEntrada) {
		InventarioFuenteFAC fac = new InventarioFuenteFAC();
		ObjetoSalida os = fac.insertar(objetoEntrada);
		return API.retornarRespuesta(os);
	}

	@POST
	@Path("/eliminar")
	@Consumes({MediaType.APPLICATION_JSON})
	@Produces({MediaType.APPLICATION_JSON})
	@JWT
	public Response eliminar(Eliminar_11_OE objetoEntrada) {
		InventarioFuenteFAC fac = new InventarioFuenteFAC();
		ObjetoSalida os = fac.eliminar(objetoEntrada);
		return API.retornarRespuesta(os);
	}

	@POST
	@Path("/actualizar")
	@Consumes({MediaType.APPLICATION_JSON})
	@Produces({MediaType.APPLICATION_JSON})
	@JWT
	public Response actualizar(Actualizar_11_OE objetoEntrada) {
		InventarioFuenteFAC fac = new InventarioFuenteFAC();
		ObjetoSalida os = fac.actualizar(objetoEntrada);
		return API.retornarRespuesta(os);
	}

	@POST
	@Path("/consultarPorFiltro")
	@Consumes({MediaType.APPLICATION_JSON})
	@Produces({MediaType.APPLICATION_JSON})
	@JWT
	public Response consultarPorFiltro(ConsultarPorFiltro_11_OE objetoEntrada) {
		InventarioFuenteFAC fac = new InventarioFuenteFAC();
		ObjetoSalida os = fac.consultarPorFiltro(objetoEntrada);
		return API.retornarRespuesta(os);
	}

}
