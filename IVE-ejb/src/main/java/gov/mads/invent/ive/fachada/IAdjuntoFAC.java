package gov.mads.invent.ive.fachada;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.vista.Insertar_5_OE;
import gov.mads.invent.ive.vista.Eliminar_5_OE;
import gov.mads.invent.ive.vista.Actualizar_5_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_5_OE;

/**
 *
 * @author Ivan Chacon
 */
public interface IAdjuntoFAC { 

	public ObjetoSalida insertar(Insertar_5_OE insertarOE);
	public ObjetoSalida eliminar(Eliminar_5_OE eliminarOE);
	public ObjetoSalida actualizar(Actualizar_5_OE actualizarOE);
	public ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_5_OE consultarPorFiltroOE);

}
