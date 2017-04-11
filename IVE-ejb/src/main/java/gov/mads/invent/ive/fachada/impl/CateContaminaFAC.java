package gov.mads.invent.ive.fachada.impl;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.fachada.ICateContaminaFAC;
import gov.mads.invent.ive.modelo.impl.CateContaminaDAO;
import gov.mads.invent.ive.vista.ContaminanteOE;
import gov.mads.invent.ive.vista.Eliminar_6_OE;
import gov.mads.invent.ive.vista.Actualizar_6_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_6_OE;

/**
 *
 * @author Ivan Chacon
 */
public class CateContaminaFAC implements ICateContaminaFAC { 

	private final CateContaminaDAO cateContaminaDAO = new CateContaminaDAO();

	public ObjetoSalida insertar(ContaminanteOE objetoEntrada) {
		return cateContaminaDAO.insertar(objetoEntrada);
	}

	public ObjetoSalida eliminar(Eliminar_6_OE objetoEntrada) {
		return cateContaminaDAO.eliminar(objetoEntrada);
	}

	public ObjetoSalida actualizar(Actualizar_6_OE objetoEntrada) {
		return cateContaminaDAO.actualizar(objetoEntrada);
	}

	public ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_6_OE objetoEntrada) {
		return cateContaminaDAO.consultarPorFiltro(objetoEntrada);
	}

}
