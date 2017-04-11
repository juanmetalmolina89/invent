package gov.mads.invent.ive.fachada.impl;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.fachada.IUtlListadosFAC;
import gov.mads.invent.ive.modelo.impl.UtlListadosDAO;
import gov.mads.invent.ive.vista.ListarAutoridades_1_OE;
import gov.mads.invent.ive.vista.ListarDivipolaDepto_1_OE;
import gov.mads.invent.ive.vista.ListarDivipolaMcpio_1_OE;
import gov.mads.invent.ive.vista.ListarParametricas_1_OE;

/**
 *
 * @author Ivan Chacon
 */
public class UtlListadosFAC implements IUtlListadosFAC { 

	private final UtlListadosDAO utlListadosDAO = new UtlListadosDAO();

	public ObjetoSalida listarAutoridades(ListarAutoridades_1_OE objetoEntrada) {
		return utlListadosDAO.listarAutoridades(objetoEntrada);
	}

	public ObjetoSalida listarDivipolaDepto(ListarDivipolaDepto_1_OE objetoEntrada) {
		return utlListadosDAO.listarDivipolaDepto(objetoEntrada);
	}

	public ObjetoSalida listarDivipolaMcpio(ListarDivipolaMcpio_1_OE objetoEntrada) {
		return utlListadosDAO.listarDivipolaMcpio(objetoEntrada);
	}

	public ObjetoSalida listarParametricas(ListarParametricas_1_OE objetoEntrada) {
		return utlListadosDAO.listarParametricas(objetoEntrada);
	}

}
