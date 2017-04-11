package gov.mads.invent.utl.fachada.impl;

import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.utl.fachada.IListadosFAC;
import gov.mads.invent.utl.modelo.IListadosDAO;
import gov.mads.invent.utl.modelo.impl.ListadosDAO;
import gov.mads.invent.utl.vista.ListaOE;

import java.util.HashMap;
import java.util.List;

public class ListadosFAC implements IListadosFAC {

    private IListadosDAO accesoDatos;

    @Override
    public String obtenerParametro(Integer idUsuario, String nombreParametro) throws Exception {

        IListadosFAC fachadaListados = new ListadosFAC();
        ListaOE listaOE = new ListaOE();
        listaOE.setIdUsuario(idUsuario);
        listaOE.setCategoria(nombreParametro);
        ObjetoSalida objetoSalidaParametrica = fachadaListados.listarParametricas(listaOE);
        if (!objetoSalidaParametrica.esRespuestaOperacionCorrecta()) {
            throw new Exception(nombreParametro + ":No se encuentra parametrizado");
        }
        return objetoSalidaParametrica.getRespuesta().get(0).get("VALORITEM").toString();
    }

    @Override
    public List<HashMap<String, Object>> obtenerParametroLista(Integer idUsuario, String nombreParametro) throws Exception {

        IListadosFAC fachadaListados = new ListadosFAC();
        ListaOE listaOE = new ListaOE();
        listaOE.setIdUsuario(idUsuario);
        listaOE.setCategoria(nombreParametro);
        ObjetoSalida objetoSalidaParametrica = fachadaListados.listarParametricas(listaOE);
        if (!objetoSalidaParametrica.esRespuestaOperacionCorrecta()) {
            throw new Exception(nombreParametro + ":No se encuentra parametrizado");
        }
        return objetoSalidaParametrica.getRespuesta();
    }

    @Override
    public ObjetoSalida listarParametricas(ListaOE objetoEntrada) {

        accesoDatos = new ListadosDAO();
        return accesoDatos.listarParametricas(objetoEntrada);
    }

    @Override
    public ObjetoSalida listarAutoridades(ListaOE objetoEntrada) {

        accesoDatos = new ListadosDAO();
        return accesoDatos.listarAutoridades(objetoEntrada);
    }

    @Override
    public ObjetoSalida listarDivipolaDepto(ListaOE objetoEntrada) {

        accesoDatos = new ListadosDAO();
        return accesoDatos.listarDivipolaDepto(objetoEntrada);
    }

    @Override
    public ObjetoSalida listarDivipolaMcpio(ListaOE objetoEntrada) {

        accesoDatos = new ListadosDAO();
        return accesoDatos.listarDivipolaMcpio(objetoEntrada);
    }

    @Override
    public ObjetoSalida listarContaminantes(ListaOE objetoEntrada) {

        accesoDatos = new ListadosDAO();
        return accesoDatos.listarContaminantes(objetoEntrada);
    }

    @Override
    public ObjetoSalida listarFuentes(ListaOE objetoEntrada) {

        accesoDatos = new ListadosDAO();
        return accesoDatos.listarFuentes(objetoEntrada);
    }

    @Override
    public ObjetoSalida listarCodigoCIIU(ListaOE objetoEntrada) {

        accesoDatos = new ListadosDAO();
        return accesoDatos.listarCodigoCIIU(objetoEntrada);
    }

    @Override
    public ObjetoSalida listarMetodoEmision(ListaOE objetoEntrada) {

        accesoDatos = new ListadosDAO();
        return accesoDatos.listarMetodoEmision(objetoEntrada);
    }

    @Override
    public ObjetoSalida listarUnidadMedidaFactorActividad(ListaOE objetoEntrada) {

        accesoDatos = new ListadosDAO();
        return accesoDatos.listarUnidadMedidaFactorActividad(objetoEntrada);
    }

    @Override
    public ObjetoSalida listarUnidadMedidaFactorEmision(ListaOE objetoEntrada) {

        accesoDatos = new ListadosDAO();
        return accesoDatos.listarUnidadMedidaFactorEmision(objetoEntrada);
    }
}