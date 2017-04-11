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

import gov.mads.invent.ive.fachada.impl.UtlUtilidadFAC;
import gov.mads.invent.ive.vista.ConsultarLista_0_OE;
/**
 * REST Web Service
 *
 * @author Ivan Chacon
*/
@Path("/utlUtilidad")
public class UtlUtilidadSERV { 

	@POST
	@Path("/consultarLista")
	@Consumes({MediaType.APPLICATION_JSON})
	@Produces({MediaType.APPLICATION_JSON})
	@JWT
	public Response consultarLista(ConsultarLista_0_OE objetoEntrada) {
		UtlUtilidadFAC fac = new UtlUtilidadFAC();
		ObjetoSalida os = fac.consultarLista(objetoEntrada);
		return API.retornarRespuesta(os);
	}

}
