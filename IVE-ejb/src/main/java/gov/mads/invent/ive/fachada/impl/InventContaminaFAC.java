package gov.mads.invent.ive.fachada.impl;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.fachada.IInventContaminaFAC;
import gov.mads.invent.ive.modelo.impl.InventContaminaDAO;
import gov.mads.invent.ive.vista.Insertar_4_OE;
import gov.mads.invent.ive.vista.Eliminar_4_OE;
import gov.mads.invent.ive.vista.Actualizar_4_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_4_OE;

/**
 *
 * @author Ivan Chacon
 */
public class InventContaminaFAC implements IInventContaminaFAC { 

	private final InventContaminaDAO inventContaminaDAO = new InventContaminaDAO();

	public ObjetoSalida insertar(Insertar_4_OE objetoEntrada) {
		return inventContaminaDAO.insertar(objetoEntrada);
	}

	public ObjetoSalida eliminar(Eliminar_4_OE objetoEntrada) {
		return inventContaminaDAO.eliminar(objetoEntrada);
	}

	public ObjetoSalida actualizar(Actualizar_4_OE objetoEntrada) {
		return inventContaminaDAO.actualizar(objetoEntrada);
	}

	public ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_4_OE objetoEntrada) {
		return inventContaminaDAO.consultarPorFiltro(objetoEntrada);
	}

}
