package gov.mads.invent.ive.modelo;
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
public interface IAdmUsuarioDAO { 

	ObjetoSalida registrarUsuario(RegistrarUsuario_20_OE registrarUsuarioOE);
	ObjetoSalida actualizarUsuario(ActualizarUsuario_20_OE actualizarUsuarioOE);
	ObjetoSalida eliminarUsuario(EliminarUsuario_20_OE eliminarUsuarioOE);
	ObjetoSalida cambiarContrasena(CambiarContrasena_20_OE cambiarContrasenaOE);
	ObjetoSalida validarUsuario(ValidarUsuario_20_OE validarUsuarioOE);
	ObjetoSalida consultarUsuario(ConsultarUsuario_20_OE consultarUsuarioOE);
	ObjetoSalida consultarGrilla(ConsultarGrilla_20_OE consultarGrillaOE);

}
