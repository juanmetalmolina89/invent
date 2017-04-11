package gov.mads.invent.ive.modelo;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.vista.Insertar_13_OE;
import gov.mads.invent.ive.vista.Eliminar_13_OE;
import gov.mads.invent.ive.vista.Actualizar_13_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_13_OE;

/**
 *
 * @author Ivan Chacon
 */
public interface IGeometriaDAO { 

	ObjetoSalida insertar(Insertar_13_OE insertarOE);
	ObjetoSalida eliminar(Eliminar_13_OE eliminarOE);
	ObjetoSalida actualizar(Actualizar_13_OE actualizarOE);
	ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_13_OE consultarPorFiltroOE);

}
