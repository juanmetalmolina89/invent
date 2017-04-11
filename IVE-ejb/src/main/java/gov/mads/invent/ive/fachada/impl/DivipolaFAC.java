package gov.mads.invent.ive.fachada.impl;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.fachada.IDivipolaFAC;
import gov.mads.invent.ive.modelo.impl.DivipolaDAO;
import gov.mads.invent.ive.vista.Insertar_3_OE;
import gov.mads.invent.ive.vista.Eliminar_3_OE;
import gov.mads.invent.ive.vista.Actualizar_3_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_3_OE;

/**
 *
 * @author Ivan Chacon
 */
public class DivipolaFAC implements IDivipolaFAC { 

	private final DivipolaDAO divipolaDAO = new DivipolaDAO();

	public ObjetoSalida insertar(Insertar_3_OE objetoEntrada) {
		return divipolaDAO.insertar(objetoEntrada);
	}

	public ObjetoSalida eliminar(Eliminar_3_OE objetoEntrada) {
		return divipolaDAO.eliminar(objetoEntrada);
	}

	public ObjetoSalida actualizar(Actualizar_3_OE objetoEntrada) {
		return divipolaDAO.actualizar(objetoEntrada);
	}

	public ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_3_OE objetoEntrada) {
		return divipolaDAO.consultarPorFiltro(objetoEntrada);
	}

}
