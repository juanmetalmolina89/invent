package gov.mads.invent.ive.fachada;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.vista.Insertar_11_OE;
import gov.mads.invent.ive.vista.Eliminar_11_OE;
import gov.mads.invent.ive.vista.Actualizar_11_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_11_OE;

/**
 *
 * @author Ivan Chacon
 */
public interface IInventarioFuenteFAC { 

	public ObjetoSalida insertar(Insertar_11_OE insertarOE);
	public ObjetoSalida eliminar(Eliminar_11_OE eliminarOE);
	public ObjetoSalida actualizar(Actualizar_11_OE actualizarOE);
	public ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_11_OE consultarPorFiltroOE);

}
