package gov.mads.invent.ive.modelo;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.vista.Insertar_5_OE;
import gov.mads.invent.ive.vista.Eliminar_5_OE;
import gov.mads.invent.ive.vista.Actualizar_5_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_5_OE;

/**
 *
 * @author Ivan Chacon
 */
public interface IAdjuntoDAO { 

	ObjetoSalida insertar(Insertar_5_OE insertarOE);
	ObjetoSalida eliminar(Eliminar_5_OE eliminarOE);
	ObjetoSalida actualizar(Actualizar_5_OE actualizarOE);
	ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_5_OE consultarPorFiltroOE);

}
