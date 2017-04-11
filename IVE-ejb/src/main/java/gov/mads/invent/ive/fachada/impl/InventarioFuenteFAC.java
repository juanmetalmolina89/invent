package gov.mads.invent.ive.fachada.impl;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.fachada.IInventarioFuenteFAC;
import gov.mads.invent.ive.modelo.impl.InventarioFuenteDAO;
import gov.mads.invent.ive.vista.Insertar_11_OE;
import gov.mads.invent.ive.vista.Eliminar_11_OE;
import gov.mads.invent.ive.vista.Actualizar_11_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_11_OE;

/**
 *
 * @author Ivan Chacon
 */
public class InventarioFuenteFAC implements IInventarioFuenteFAC { 

	private final InventarioFuenteDAO inventarioFuenteDAO = new InventarioFuenteDAO();

	public ObjetoSalida insertar(Insertar_11_OE objetoEntrada) {
		return inventarioFuenteDAO.insertar(objetoEntrada);
	}

	public ObjetoSalida eliminar(Eliminar_11_OE objetoEntrada) {
		return inventarioFuenteDAO.eliminar(objetoEntrada);
	}

	public ObjetoSalida actualizar(Actualizar_11_OE objetoEntrada) {
		return inventarioFuenteDAO.actualizar(objetoEntrada);
	}

	public ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_11_OE objetoEntrada) {
		return inventarioFuenteDAO.consultarPorFiltro(objetoEntrada);
	}

}
