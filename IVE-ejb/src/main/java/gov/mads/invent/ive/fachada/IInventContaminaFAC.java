package gov.mads.invent.ive.fachada;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.vista.Insertar_4_OE;
import gov.mads.invent.ive.vista.Eliminar_4_OE;
import gov.mads.invent.ive.vista.Actualizar_4_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_4_OE;

/**
 *
 * @author Ivan Chacon
 */
public interface IInventContaminaFAC { 

	public ObjetoSalida insertar(Insertar_4_OE insertarOE);
	public ObjetoSalida eliminar(Eliminar_4_OE eliminarOE);
	public ObjetoSalida actualizar(Actualizar_4_OE actualizarOE);
	public ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_4_OE consultarPorFiltroOE);

}
