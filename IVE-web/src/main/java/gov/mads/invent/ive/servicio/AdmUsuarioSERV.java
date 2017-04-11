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

import gov.mads.invent.ive.fachada.impl.AdmUsuarioFAC;
import gov.mads.invent.ive.vista.RegistrarUsuario_20_OE;
import gov.mads.invent.ive.vista.ActualizarUsuario_20_OE;
import gov.mads.invent.ive.vista.EliminarUsuario_20_OE;
import gov.mads.invent.ive.vista.CambiarContrasena_20_OE;
import gov.mads.invent.ive.vista.ValidarUsuario_20_OE;
import gov.mads.invent.ive.vista.ConsultarUsuario_20_OE;
import gov.mads.invent.ive.vista.ConsultarGrilla_20_OE;
/**
 * REST Web Service
 *
 * @author Ivan Chacon
*/
@Path("/admUsuario")
public class AdmUsuarioSERV { 

	@POST
	@Path("/registrarUsuario")
	@Consumes({MediaType.APPLICATION_JSON})
	@Produces({MediaType.APPLICATION_JSON})
	@JWT
	public Response registrarUsuario(RegistrarUsuario_20_OE objetoEntrada) {
		AdmUsuarioFAC fac = new AdmUsuarioFAC();
		ObjetoSalida os = fac.registrarUsuario(objetoEntrada);
		return API.retornarRespuesta(os);
	}

	@POST
	@Path("/actualizarUsuario")
	@Consumes({MediaType.APPLICATION_JSON})
	@Produces({MediaType.APPLICATION_JSON})
	@JWT
	public Response actualizarUsuario(ActualizarUsuario_20_OE objetoEntrada) {
		AdmUsuarioFAC fac = new AdmUsuarioFAC();
		ObjetoSalida os = fac.actualizarUsuario(objetoEntrada);
		return API.retornarRespuesta(os);
	}

	@POST
	@Path("/eliminarUsuario")
	@Consumes({MediaType.APPLICATION_JSON})
	@Produces({MediaType.APPLICATION_JSON})
	@JWT
	public Response eliminarUsuario(EliminarUsuario_20_OE objetoEntrada) {
		AdmUsuarioFAC fac = new AdmUsuarioFAC();
		ObjetoSalida os = fac.eliminarUsuario(objetoEntrada);
		return API.retornarRespuesta(os);
	}

	@POST
	@Path("/cambiarContrasena")
	@Consumes({MediaType.APPLICATION_JSON})
	@Produces({MediaType.APPLICATION_JSON})
	@JWT
	public Response cambiarContrasena(CambiarContrasena_20_OE objetoEntrada) {
		AdmUsuarioFAC fac = new AdmUsuarioFAC();
		ObjetoSalida os = fac.cambiarContrasena(objetoEntrada);
		return API.retornarRespuesta(os);
	}

	@POST
	@Path("/validarUsuario")
	@Consumes({MediaType.APPLICATION_JSON})
	@Produces({MediaType.APPLICATION_JSON})
	@JWT
	public Response validarUsuario(ValidarUsuario_20_OE objetoEntrada) {
		AdmUsuarioFAC fac = new AdmUsuarioFAC();
		ObjetoSalida os = fac.validarUsuario(objetoEntrada);
		return API.retornarRespuesta(os);
	}

	@POST
	@Path("/consultarUsuario")
	@Consumes({MediaType.APPLICATION_JSON})
	@Produces({MediaType.APPLICATION_JSON})
	@JWT
	public Response consultarUsuario(ConsultarUsuario_20_OE objetoEntrada) {
		AdmUsuarioFAC fac = new AdmUsuarioFAC();
		ObjetoSalida os = fac.consultarUsuario(objetoEntrada);
		return API.retornarRespuesta(os);
	}

	@POST
	@Path("/consultarGrilla")
	@Consumes({MediaType.APPLICATION_JSON})
	@Produces({MediaType.APPLICATION_JSON})
	@JWT
	public Response consultarGrilla(ConsultarGrilla_20_OE objetoEntrada) {
		AdmUsuarioFAC fac = new AdmUsuarioFAC();
		ObjetoSalida os = fac.consultarGrilla(objetoEntrada);
		return API.retornarRespuesta(os);
	}

}
