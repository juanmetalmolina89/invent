package gov.mads.invent.ive.fachada;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.vista.Insertar_16_OE;
import gov.mads.invent.ive.vista.Eliminar_16_OE;
import gov.mads.invent.ive.vista.Actualizar_16_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_16_OE;

/**
 *
 * @author Ivan Chacon
 */
public interface IEntidadFAC { 

	public ObjetoSalida insertar(Insertar_16_OE insertarOE);
	public ObjetoSalida eliminar(Eliminar_16_OE eliminarOE);
	public ObjetoSalida actualizar(Actualizar_16_OE actualizarOE);
	public ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_16_OE consultarPorFiltroOE);

}
