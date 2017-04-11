package gov.mads.invent.ive.fachada.impl;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.fachada.IGeometriaFAC;
import gov.mads.invent.ive.modelo.impl.GeometriaDAO;
import gov.mads.invent.ive.vista.Insertar_13_OE;
import gov.mads.invent.ive.vista.Eliminar_13_OE;
import gov.mads.invent.ive.vista.Actualizar_13_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_13_OE;

/**
 *
 * @author Ivan Chacon
 */
public class GeometriaFAC implements IGeometriaFAC { 

	private final GeometriaDAO geometriaDAO = new GeometriaDAO();

	public ObjetoSalida insertar(Insertar_13_OE objetoEntrada) {
		return geometriaDAO.insertar(objetoEntrada);
	}

	public ObjetoSalida eliminar(Eliminar_13_OE objetoEntrada) {
		return geometriaDAO.eliminar(objetoEntrada);
	}

	public ObjetoSalida actualizar(Actualizar_13_OE objetoEntrada) {
		return geometriaDAO.actualizar(objetoEntrada);
	}

	public ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_13_OE objetoEntrada) {
		return geometriaDAO.consultarPorFiltro(objetoEntrada);
	}

}
