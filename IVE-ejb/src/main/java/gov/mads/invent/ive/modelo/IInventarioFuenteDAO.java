package gov.mads.invent.ive.modelo;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.vista.Insertar_11_OE;
import gov.mads.invent.ive.vista.Eliminar_11_OE;
import gov.mads.invent.ive.vista.Actualizar_11_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_11_OE;

/**
 *
 * @author Ivan Chacon
 */
public interface IInventarioFuenteDAO { 

	ObjetoSalida insertar(Insertar_11_OE insertarOE);
	ObjetoSalida eliminar(Eliminar_11_OE eliminarOE);
	ObjetoSalida actualizar(Actualizar_11_OE actualizarOE);
	ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_11_OE consultarPorFiltroOE);

}
