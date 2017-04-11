package gov.mads.invent.ive.modelo;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.vista.ListarAutoridades_1_OE;
import gov.mads.invent.ive.vista.ListarDivipolaDepto_1_OE;
import gov.mads.invent.ive.vista.ListarDivipolaMcpio_1_OE;
import gov.mads.invent.ive.vista.ListarParametricas_1_OE;

/**
 *
 * @author Ivan Chacon
 */
public interface IUtlListadosDAO { 

	ObjetoSalida listarAutoridades(ListarAutoridades_1_OE listarAutoridadesOE);
	ObjetoSalida listarDivipolaDepto(ListarDivipolaDepto_1_OE listarDivipolaDeptoOE);
	ObjetoSalida listarDivipolaMcpio(ListarDivipolaMcpio_1_OE listarDivipolaMcpioOE);
	ObjetoSalida listarParametricas(ListarParametricas_1_OE listarParametricasOE);

}
