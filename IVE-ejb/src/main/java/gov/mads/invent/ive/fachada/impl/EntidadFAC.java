package gov.mads.invent.ive.fachada.impl;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.fachada.IEntidadFAC;
import gov.mads.invent.ive.modelo.impl.EntidadDAO;
import gov.mads.invent.ive.vista.Insertar_16_OE;
import gov.mads.invent.ive.vista.Eliminar_16_OE;
import gov.mads.invent.ive.vista.Actualizar_16_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_16_OE;

/**
 *
 * @author Ivan Chacon
 */
public class EntidadFAC implements IEntidadFAC { 

	private final EntidadDAO entidadDAO = new EntidadDAO();

	public ObjetoSalida insertar(Insertar_16_OE objetoEntrada) {
		return entidadDAO.insertar(objetoEntrada);
	}

	public ObjetoSalida eliminar(Eliminar_16_OE objetoEntrada) {
		return entidadDAO.eliminar(objetoEntrada);
	}

	public ObjetoSalida actualizar(Actualizar_16_OE objetoEntrada) {
		return entidadDAO.actualizar(objetoEntrada);
	}

	public ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_16_OE objetoEntrada) {
		return entidadDAO.consultarPorFiltro(objetoEntrada);
	}

}
