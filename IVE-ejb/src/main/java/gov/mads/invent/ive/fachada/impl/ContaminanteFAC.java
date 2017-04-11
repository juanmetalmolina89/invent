package gov.mads.invent.ive.fachada.impl;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.fachada.IContaminanteFAC;
import gov.mads.invent.ive.modelo.impl.ContaminanteDAO;
import gov.mads.invent.ive.vista.Insertar_12_OE;
import gov.mads.invent.ive.vista.Eliminar_12_OE;
import gov.mads.invent.ive.vista.Actualizar_12_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_12_OE;

/**
 *
 * @author Ivan Chacon
 */
public class ContaminanteFAC implements IContaminanteFAC { 

	private final ContaminanteDAO contaminanteDAO = new ContaminanteDAO();

	public ObjetoSalida insertar(Insertar_12_OE objetoEntrada) {
		return contaminanteDAO.insertar(objetoEntrada);
	}

	public ObjetoSalida eliminar(Eliminar_12_OE objetoEntrada) {
		return contaminanteDAO.eliminar(objetoEntrada);
	}

	public ObjetoSalida actualizar(Actualizar_12_OE objetoEntrada) {
		return contaminanteDAO.actualizar(objetoEntrada);
	}

	public ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_12_OE objetoEntrada) {
		return contaminanteDAO.consultarPorFiltro(objetoEntrada);
	}

}
