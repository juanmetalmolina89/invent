package gov.mads.invent.ive.modelo;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.vista.Insertar_16_OE;
import gov.mads.invent.ive.vista.Eliminar_16_OE;
import gov.mads.invent.ive.vista.Actualizar_16_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_16_OE;

/**
 *
 * @author Ivan Chacon
 */
public interface IEntidadDAO { 

	ObjetoSalida insertar(Insertar_16_OE insertarOE);
	ObjetoSalida eliminar(Eliminar_16_OE eliminarOE);
	ObjetoSalida actualizar(Actualizar_16_OE actualizarOE);
	ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_16_OE consultarPorFiltroOE);

}
