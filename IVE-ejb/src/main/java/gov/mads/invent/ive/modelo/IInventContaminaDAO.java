package gov.mads.invent.ive.modelo;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.vista.Insertar_4_OE;
import gov.mads.invent.ive.vista.Eliminar_4_OE;
import gov.mads.invent.ive.vista.Actualizar_4_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_4_OE;

/**
 *
 * @author Ivan Chacon
 */
public interface IInventContaminaDAO { 

	ObjetoSalida insertar(Insertar_4_OE insertarOE);
	ObjetoSalida eliminar(Eliminar_4_OE eliminarOE);
	ObjetoSalida actualizar(Actualizar_4_OE actualizarOE);
	ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_4_OE consultarPorFiltroOE);

}
