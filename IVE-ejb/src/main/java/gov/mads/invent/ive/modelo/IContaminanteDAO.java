package gov.mads.invent.ive.modelo;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.vista.Insertar_12_OE;
import gov.mads.invent.ive.vista.Eliminar_12_OE;
import gov.mads.invent.ive.vista.Actualizar_12_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_12_OE;

/**
 *
 * @author Ivan Chacon
 */
public interface IContaminanteDAO { 

	ObjetoSalida insertar(Insertar_12_OE insertarOE);
	ObjetoSalida eliminar(Eliminar_12_OE eliminarOE);
	ObjetoSalida actualizar(Actualizar_12_OE actualizarOE);
	ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_12_OE consultarPorFiltroOE);

}
