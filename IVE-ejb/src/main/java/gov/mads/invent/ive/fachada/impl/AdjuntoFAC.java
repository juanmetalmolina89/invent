package gov.mads.invent.ive.fachada.impl;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.fachada.IAdjuntoFAC;
import gov.mads.invent.ive.modelo.impl.AdjuntoDAO;
import gov.mads.invent.ive.vista.Insertar_5_OE;
import gov.mads.invent.ive.vista.Eliminar_5_OE;
import gov.mads.invent.ive.vista.Actualizar_5_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_5_OE;

/**
 *
 * @author Ivan Chacon
 */
public class AdjuntoFAC implements IAdjuntoFAC { 

	private final AdjuntoDAO adjuntoDAO = new AdjuntoDAO();

	public ObjetoSalida insertar(Insertar_5_OE objetoEntrada) {
		return adjuntoDAO.insertar(objetoEntrada);
	}

	public ObjetoSalida eliminar(Eliminar_5_OE objetoEntrada) {
		return adjuntoDAO.eliminar(objetoEntrada);
	}

	public ObjetoSalida actualizar(Actualizar_5_OE objetoEntrada) {
		return adjuntoDAO.actualizar(objetoEntrada);
	}

	public ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_5_OE objetoEntrada) {
		return adjuntoDAO.consultarPorFiltro(objetoEntrada);
	}

}
