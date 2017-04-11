package gov.mads.invent.ive.fachada.impl;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.fachada.IUsuarioFAC;
import gov.mads.invent.ive.modelo.impl.UsuarioDAO;
import gov.mads.invent.ive.vista.Insertar_15_OE;
import gov.mads.invent.ive.vista.Eliminar_15_OE;
import gov.mads.invent.ive.vista.Actualizar_15_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_15_OE;

/**
 *
 * @author Ivan Chacon
 */
public class UsuarioFAC implements IUsuarioFAC { 

	private final UsuarioDAO usuarioDAO = new UsuarioDAO();

	public ObjetoSalida insertar(Insertar_15_OE objetoEntrada) {
		return usuarioDAO.insertar(objetoEntrada);
	}

	public ObjetoSalida eliminar(Eliminar_15_OE objetoEntrada) {
		return usuarioDAO.eliminar(objetoEntrada);
	}

	public ObjetoSalida actualizar(Actualizar_15_OE objetoEntrada) {
		return usuarioDAO.actualizar(objetoEntrada);
	}

	public ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_15_OE objetoEntrada) {
		return usuarioDAO.consultarPorFiltro(objetoEntrada);
	}

}
