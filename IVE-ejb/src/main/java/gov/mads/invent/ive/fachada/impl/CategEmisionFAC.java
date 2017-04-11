package gov.mads.invent.ive.fachada.impl;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.fachada.ICategEmisionFAC;
import gov.mads.invent.ive.modelo.impl.CategEmisionDAO;
import gov.mads.invent.ive.vista.Insertar_7_OE;
import gov.mads.invent.ive.vista.Eliminar_7_OE;
import gov.mads.invent.ive.vista.Actualizar_7_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_7_OE;

/**
 *
 * @author Ivan Chacon
 */
public class CategEmisionFAC implements ICategEmisionFAC { 

	private final CategEmisionDAO categEmisionDAO = new CategEmisionDAO();

	public ObjetoSalida insertar(Insertar_7_OE objetoEntrada) {
		return categEmisionDAO.insertar(objetoEntrada);
	}

	public ObjetoSalida eliminar(Eliminar_7_OE objetoEntrada) {
		return categEmisionDAO.eliminar(objetoEntrada);
	}

	public ObjetoSalida actualizar(Actualizar_7_OE objetoEntrada) {
		return categEmisionDAO.actualizar(objetoEntrada);
	}

	public ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_7_OE objetoEntrada) {
		return categEmisionDAO.consultarPorFiltro(objetoEntrada);
	}

}
