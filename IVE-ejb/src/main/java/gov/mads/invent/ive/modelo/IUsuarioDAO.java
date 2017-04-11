package gov.mads.invent.ive.modelo;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.vista.Insertar_15_OE;
import gov.mads.invent.ive.vista.Eliminar_15_OE;
import gov.mads.invent.ive.vista.Actualizar_15_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_15_OE;

/**
 *
 * @author Ivan Chacon
 */
public interface IUsuarioDAO { 

	ObjetoSalida insertar(Insertar_15_OE insertarOE);
	ObjetoSalida eliminar(Eliminar_15_OE eliminarOE);
	ObjetoSalida actualizar(Actualizar_15_OE actualizarOE);
	ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_15_OE consultarPorFiltroOE);

}
