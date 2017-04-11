package gov.mads.invent.ive.fachada.impl;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.fachada.IUtlUtilidadFAC;
import gov.mads.invent.ive.modelo.impl.UtlUtilidadDAO;
import gov.mads.invent.ive.vista.ConsultarLista_0_OE;

/**
 *
 * @author Ivan Chacon
 */
public class UtlUtilidadFAC implements IUtlUtilidadFAC { 

	private final UtlUtilidadDAO utlUtilidadDAO = new UtlUtilidadDAO();

	public ObjetoSalida consultarLista(ConsultarLista_0_OE objetoEntrada) {
		return utlUtilidadDAO.consultarLista(objetoEntrada);
	}

}
