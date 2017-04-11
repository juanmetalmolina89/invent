package gov.mads.invent.ive.modelo;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.vista.Insertar_3_OE;
import gov.mads.invent.ive.vista.Eliminar_3_OE;
import gov.mads.invent.ive.vista.Actualizar_3_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_3_OE;

/**
 *
 * @author Ivan Chacon
 */
public interface IDivipolaDAO { 

	ObjetoSalida insertar(Insertar_3_OE insertarOE);
	ObjetoSalida eliminar(Eliminar_3_OE eliminarOE);
	ObjetoSalida actualizar(Actualizar_3_OE actualizarOE);
	ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_3_OE consultarPorFiltroOE);

}
