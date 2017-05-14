package gov.mads.invent.ive.modelo;

import gov.mads.invent.comun.vista.BusquedaOE;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.vista.ConsultarInventariosFechaOE;
import gov.mads.invent.ive.vista.InventarioOE;
import org.jose4j.json.internal.json_simple.JSONObject;

public interface IInventarioDAO {

    ObjetoSalida registrarInventario(InventarioOE objetoEntrada);

    ObjetoSalida consultarInventario(InventarioOE objetoEntrada);

    ObjetoSalida consultarGrilla(BusquedaOE objetoEntrada);

    ObjetoSalida actualizarInventario(InventarioOE objetoEntrada);

    ObjetoSalida eliminarInventarioContaminante(Integer codigoContaminante, Integer idUsuario);

    ObjetoSalida registrarInventarioContaminante(Integer codigoInventario, Integer codigoContaminante, Integer idUsuario);

    ObjetoSalida eliminarInventarioFuente(Integer codigoFuente, Integer idUsuario);

    ObjetoSalida registrarInventarioFuente(Integer codigoInventario, Integer codigoFuente, Integer idUsuario);

    ObjetoSalida registrarGeometria(Integer codigoInventario, JSONObject geometria, Integer idUsuario);

    ObjetoSalida registrarAdjunto(Integer codigoInventario, String nombreAdjunto, String rutaAdjunto, Integer idUsuario);

    ObjetoSalida consultarGeometria(InventarioOE objetoEntrada);

    ObjetoSalida actualizarGeometria(Integer codigoGeometria, Integer codigoInventario, JSONObject geometria, Integer idUsuario);

    ObjetoSalida consultarInventarioFuente(InventarioOE objetoEntrada);

    ObjetoSalida consultarInventarioContaminante(InventarioOE objetoEntrada);

    ObjetoSalida actualizarAdjunto(Integer codigoAdjunto, Integer codigoInventario, String nombreAdjunto, String rutaAdjunto, Integer idUsuario);

    ObjetoSalida consultarAdjunto(Integer codigoInventario, Integer idUsuario);

    ObjetoSalida cambiarEstadoInventario(InventarioOE objetoEntrada);
    
    ObjetoSalida consultarInventarioFecha(ConsultarInventariosFechaOE objetoEntrada);
}
