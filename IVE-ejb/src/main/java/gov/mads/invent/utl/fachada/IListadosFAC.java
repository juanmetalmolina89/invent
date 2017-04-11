package gov.mads.invent.utl.fachada;

import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.utl.vista.ListaOE;

import java.util.HashMap;
import java.util.List;

public interface IListadosFAC {

    String obtenerParametro(Integer idUsuario, String nombreParametro) throws Exception;

    List<HashMap<String, Object>> obtenerParametroLista(Integer idUsuario, String nombreParametro) throws Exception;

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
