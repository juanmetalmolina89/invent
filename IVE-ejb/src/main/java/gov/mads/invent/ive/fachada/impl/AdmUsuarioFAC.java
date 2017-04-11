package gov.mads.invent.ive.fachada.impl;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.fachada.IAdmUsuarioFAC;
import gov.mads.invent.ive.modelo.impl.AdmUsuarioDAO;
import gov.mads.invent.ive.vista.RegistrarUsuario_20_OE;
import gov.mads.invent.ive.vista.ActualizarUsuario_20_OE;
import gov.mads.invent.ive.vista.EliminarUsuario_20_OE;
import gov.mads.invent.ive.vista.CambiarContrasena_20_OE;
import gov.mads.invent.ive.vista.ValidarUsuario_20_OE;
import gov.mads.invent.ive.vista.ConsultarUsuario_20_OE;
import gov.mads.invent.ive.vista.ConsultarGrilla_20_OE;

/**
 *
 * @author Ivan Chacon
 */
public class AdmUsuarioFAC implements IAdmUsuarioFAC { 

	private final AdmUsuarioDAO admUsuarioDAO = new AdmUsuarioDAO();

	public ObjetoSalida registrarUsuario(RegistrarUsuario_20_OE objetoEntrada) {
		return admUsuarioDAO.registrarUsuario(objetoEntrada);
	}

	public ObjetoSalida actualizarUsuario(ActualizarUsuario_20_OE objetoEntrada) {
		return admUsuarioDAO.actualizarUsuario(objetoEntrada);
	}

	public ObjetoSalida eliminarUsuario(EliminarUsuario_20_OE objetoEntrada) {
		return admUsuarioDAO.eliminarUsuario(objetoEntrada);
	}

	public ObjetoSalida cambiarContrasena(CambiarContrasena_20_OE objetoEntrada) {
		return admUsuarioDAO.cambiarContrasena(objetoEntrada);
	}

	public ObjetoSalida validarUsuario(ValidarUsuario_20_OE objetoEntrada) {
		return admUsuarioDAO.validarUsuario(objetoEntrada);
	}

	public ObjetoSalida consultarUsuario(ConsultarUsuario_20_OE objetoEntrada) {
		return admUsuarioDAO.consultarUsuario(objetoEntrada);
	}

	public ObjetoSalida consultarGrilla(ConsultarGrilla_20_OE objetoEntrada) {
		return admUsuarioDAO.consultarGrilla(objetoEntrada);
	}

}
