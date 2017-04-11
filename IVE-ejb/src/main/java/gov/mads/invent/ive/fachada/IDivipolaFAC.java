package gov.mads.invent.ive.fachada;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.vista.Insertar_3_OE;
import gov.mads.invent.ive.vista.Eliminar_3_OE;
import gov.mads.invent.ive.vista.Actualizar_3_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_3_OE;

/**
 *
 * @author Ivan Chacon
 */
public interface IDivipolaFAC { 

	public ObjetoSalida insertar(Insertar_3_OE insertarOE);
	public ObjetoSalida eliminar(Eliminar_3_OE eliminarOE);
	public ObjetoSalida actualizar(Actualizar_3_OE actualizarOE);
	public ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_3_OE consultarPorFiltroOE);

}
