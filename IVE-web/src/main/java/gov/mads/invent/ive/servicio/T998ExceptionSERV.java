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

import gov.mads.invent.ive.fachada.impl.T998ExceptionFAC;
import gov.mads.invent.ive.vista.Insertar_2_OE;
/**
 * REST Web Service
 *
 * @author Ivan Chacon
*/
@Path("/t998Exception")
public class T998ExceptionSERV { 

	@POST
	@Path("/insertar")
	@Consumes({MediaType.APPLICATION_JSON})
	@Produces({MediaType.APPLICATION_JSON})
	@JWT
	public Response insertar(Insertar_2_OE objetoEntrada) {
		T998ExceptionFAC fac = new T998ExceptionFAC();
		ObjetoSalida os = fac.insertar(objetoEntrada);
		return API.retornarRespuesta(os);
	}

}
