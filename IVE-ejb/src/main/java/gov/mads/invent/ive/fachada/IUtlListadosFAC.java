package gov.mads.invent.ive.fachada;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.vista.ListarAutoridades_1_OE;
import gov.mads.invent.ive.vista.ListarDivipolaDepto_1_OE;
import gov.mads.invent.ive.vista.ListarDivipolaMcpio_1_OE;
import gov.mads.invent.ive.vista.ListarParametricas_1_OE;

/**
 *
 * @author Ivan Chacon
 */
public interface IUtlListadosFAC { 

	public ObjetoSalida listarAutoridades(ListarAutoridades_1_OE listarAutoridadesOE);
	public ObjetoSalida listarDivipolaDepto(ListarDivipolaDepto_1_OE listarDivipolaDeptoOE);
	public ObjetoSalida listarDivipolaMcpio(ListarDivipolaMcpio_1_OE listarDivipolaMcpioOE);
	public ObjetoSalida listarParametricas(ListarParametricas_1_OE listarParametricasOE);

}
