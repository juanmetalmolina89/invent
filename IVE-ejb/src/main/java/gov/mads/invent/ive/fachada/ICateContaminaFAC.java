package gov.mads.invent.ive.fachada;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.vista.ContaminanteOE;
import gov.mads.invent.ive.vista.Eliminar_6_OE;
import gov.mads.invent.ive.vista.Actualizar_6_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_6_OE;

/**
 *
 * @author Ivan Chacon
 */
public interface ICateContaminaFAC { 

	public ObjetoSalida insertar(ContaminanteOE insertarOE);
	public ObjetoSalida eliminar(Eliminar_6_OE eliminarOE);
	public ObjetoSalida actualizar(Actualizar_6_OE actualizarOE);
	public ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_6_OE consultarPorFiltroOE);

}
