package gov.mads.invent.ive.modelo;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.vista.ContaminanteOE;
import gov.mads.invent.ive.vista.Eliminar_6_OE;
import gov.mads.invent.ive.vista.Actualizar_6_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_6_OE;

/**
 *
 * @author Ivan Chacon
 */
public interface ICateContaminaDAO { 

	ObjetoSalida insertar(ContaminanteOE insertarOE);
	ObjetoSalida eliminar(Eliminar_6_OE eliminarOE);
	ObjetoSalida actualizar(Actualizar_6_OE actualizarOE);
	ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_6_OE consultarPorFiltroOE);

}
