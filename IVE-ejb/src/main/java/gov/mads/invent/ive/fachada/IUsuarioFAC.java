package gov.mads.invent.ive.fachada;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.vista.Insertar_15_OE;
import gov.mads.invent.ive.vista.Eliminar_15_OE;
import gov.mads.invent.ive.vista.Actualizar_15_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_15_OE;

/**
 *
 * @author Ivan Chacon
 */
public interface IUsuarioFAC { 

	public ObjetoSalida insertar(Insertar_15_OE insertarOE);
	public ObjetoSalida eliminar(Eliminar_15_OE eliminarOE);
	public ObjetoSalida actualizar(Actualizar_15_OE actualizarOE);
	public ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_15_OE consultarPorFiltroOE);

}
