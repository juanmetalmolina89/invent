package gov.mads.invent.ive.fachada;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.vista.Insertar_7_OE;
import gov.mads.invent.ive.vista.Eliminar_7_OE;
import gov.mads.invent.ive.vista.Actualizar_7_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_7_OE;

/**
 *
 * @author Ivan Chacon
 */
public interface ICategEmisionFAC { 

	public ObjetoSalida insertar(Insertar_7_OE insertarOE);
	public ObjetoSalida eliminar(Eliminar_7_OE eliminarOE);
	public ObjetoSalida actualizar(Actualizar_7_OE actualizarOE);
	public ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_7_OE consultarPorFiltroOE);

}
