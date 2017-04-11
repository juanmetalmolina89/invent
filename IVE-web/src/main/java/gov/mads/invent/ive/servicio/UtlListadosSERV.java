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

import gov.mads.invent.ive.fachada.impl.UtlListadosFAC;
import gov.mads.invent.ive.vista.ListarAutoridades_1_OE;
import gov.mads.invent.ive.vista.ListarDivipolaDepto_1_OE;
import gov.mads.invent.ive.vista.ListarDivipolaMcpio_1_OE;
import gov.mads.invent.ive.vista.ListarParametricas_1_OE;
/**
 * REST Web Service
 *
 * @author Ivan Chacon
*/
@Path("/utlListados")
public class UtlListadosSERV { 

	@POST
	@Path("/listarAutoridades")
	@Consumes({MediaType.APPLICATION_JSON})
	@Produces({MediaType.APPLICATION_JSON})
	@JWT
	public Response listarAutoridades(ListarAutoridades_1_OE objetoEntrada) {
		UtlListadosFAC fac = new UtlListadosFAC();
		ObjetoSalida os = fac.listarAutoridades(objetoEntrada);
		return API.retornarRespuesta(os);
	}

	@POST
	@Path("/listarDivipolaDepto")
	@Consumes({MediaType.APPLICATION_JSON})
	@Produces({MediaType.APPLICATION_JSON})
	@JWT
	public Response listarDivipolaDepto(ListarDivipolaDepto_1_OE objetoEntrada) {
		UtlListadosFAC fac = new UtlListadosFAC();
		ObjetoSalida os = fac.listarDivipolaDepto(objetoEntrada);
		return API.retornarRespuesta(os);
	}

	@POST
	@Path("/listarDivipolaMcpio")
	@Consumes({MediaType.APPLICATION_JSON})
	@Produces({MediaType.APPLICATION_JSON})
	@JWT
	public Response listarDivipolaMcpio(ListarDivipolaMcpio_1_OE objetoEntrada) {
		UtlListadosFAC fac = new UtlListadosFAC();
		ObjetoSalida os = fac.listarDivipolaMcpio(objetoEntrada);
		return API.retornarRespuesta(os);
	}

	@POST
	@Path("/listarParametricas")
	@Consumes({MediaType.APPLICATION_JSON})
	@Produces({MediaType.APPLICATION_JSON})
	@JWT
	public Response listarParametricas(ListarParametricas_1_OE objetoEntrada) {
		UtlListadosFAC fac = new UtlListadosFAC();
		ObjetoSalida os = fac.listarParametricas(objetoEntrada);
		return API.retornarRespuesta(os);
	}

}
