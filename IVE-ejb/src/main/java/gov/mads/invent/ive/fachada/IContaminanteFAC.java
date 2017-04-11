package gov.mads.invent.ive.fachada;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.vista.Insertar_12_OE;
import gov.mads.invent.ive.vista.Eliminar_12_OE;
import gov.mads.invent.ive.vista.Actualizar_12_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_12_OE;

/**
 *
 * @author Ivan Chacon
 */
public interface IContaminanteFAC { 

	public ObjetoSalida insertar(Insertar_12_OE insertarOE);
	public ObjetoSalida eliminar(Eliminar_12_OE eliminarOE);
	public ObjetoSalida actualizar(Actualizar_12_OE actualizarOE);
	public ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_12_OE consultarPorFiltroOE);

}
