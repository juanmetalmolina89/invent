package gov.mads.invent.ive.fachada;

import java.io.File;
import java.util.List;

public interface IReporteFAC {

    File generarReporteInventario(Integer idReporte, List<Long> objetoEntrada, Integer idUsuario) throws Exception;
}
