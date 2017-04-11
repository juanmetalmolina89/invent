package gov.mads.invent.ive.fachada;
import gov.mads.invent.comun.vista.ObjetoSalida;
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
public interface IAdmUsuarioFAC { 

	public ObjetoSalida registrarUsuario(RegistrarUsuario_20_OE registrarUsuarioOE);
	public ObjetoSalida actualizarUsuario(ActualizarUsuario_20_OE actualizarUsuarioOE);
	public ObjetoSalida eliminarUsuario(EliminarUsuario_20_OE eliminarUsuarioOE);
	public ObjetoSalida cambiarContrasena(CambiarContrasena_20_OE cambiarContrasenaOE);
	public ObjetoSalida validarUsuario(ValidarUsuario_20_OE validarUsuarioOE);
	public ObjetoSalida consultarUsuario(ConsultarUsuario_20_OE consultarUsuarioOE);
	public ObjetoSalida consultarGrilla(ConsultarGrilla_20_OE consultarGrillaOE);

}
