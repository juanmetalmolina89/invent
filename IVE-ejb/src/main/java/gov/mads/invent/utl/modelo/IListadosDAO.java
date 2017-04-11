package gov.mads.invent.utl.modelo;

import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.utl.vista.ListaOE;

public interface IListadosDAO {

    ObjetoSalida listarParametricas(ListaOE objetoEntrada);

    ObjetoSalida listarAutoridades(ListaOE objetoEntrada);

    ObjetoSalida listarDivipolaDepto(ListaOE objetoEntrada);

    ObjetoSalida listarDivipolaMcpio(ListaOE objetoEntrada);

    ObjetoSalida listarContaminantes(ListaOE objetoEntrada);

    ObjetoSalida listarFuentes(ListaOE objetoEntrada);

    ObjetoSalida listarCodigoCIIU(ListaOE objetoEntrada);

    ObjetoSalida listarMetodoEmision(ListaOE objetoEntrada);

    ObjetoSalida listarUnidadMedidaFactorActividad(ListaOE objetoEntrada);

    ObjetoSalida listarUnidadMedidaFactorEmision(ListaOE objetoEntrada);
}
