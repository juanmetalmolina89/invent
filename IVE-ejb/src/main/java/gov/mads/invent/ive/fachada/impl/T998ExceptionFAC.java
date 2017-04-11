package gov.mads.invent.ive.fachada.impl;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.fachada.IT998ExceptionFAC;
import gov.mads.invent.ive.modelo.impl.T998ExceptionDAO;
import gov.mads.invent.ive.vista.Insertar_2_OE;

/**
 *
 * @author Ivan Chacon
 */
public class T998ExceptionFAC implements IT998ExceptionFAC { 

	private final T998ExceptionDAO t998ExceptionDAO = new T998ExceptionDAO();

	public ObjetoSalida insertar(Insertar_2_OE objetoEntrada) {
		return t998ExceptionDAO.insertar(objetoEntrada);
	}

}
