package gov.mads.invent.ive.modelo;

import gov.mads.invent.comun.vista.ObjetoSalida;

public interface IReporteDAO {

    ObjetoSalida generarReporteInventario(Integer idReporte, String codigoInventario, Integer idUsuario);
}
