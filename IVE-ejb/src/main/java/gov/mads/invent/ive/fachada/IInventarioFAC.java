package gov.mads.invent.ive.fachada;

import gov.mads.invent.comun.vista.BusquedaOE;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.vista.InventarioOE;
import org.jboss.resteasy.plugins.providers.multipart.MultipartFormDataInput;

import java.io.File;

public interface IInventarioFAC {

    ObjetoSalida registrarInventario(InventarioOE objetoEntrada);

    ObjetoSalida consultarInventario(InventarioOE objetoEntrada);

    ObjetoSalida consultarGrilla(BusquedaOE objetoEntrada);

    ObjetoSalida actualizarInventario(InventarioOE objetoEntrada);

    ObjetoSalida registrarAdjunto(MultipartFormDataInput objetoEntrada);

    ObjetoSalida consultarGeometria(InventarioOE objetoEntrada);

    File consultarAdjunto(Integer codigoInventario, Integer idUsuario) throws Exception;

    ObjetoSalida consultarInventarioFuente(InventarioOE objetoEntrada);

    ObjetoSalida consultarInventarioContaminante(InventarioOE objetoEntrada);

    ObjetoSalida cambiarEstadoInventario(InventarioOE objetoEntrada);
}
