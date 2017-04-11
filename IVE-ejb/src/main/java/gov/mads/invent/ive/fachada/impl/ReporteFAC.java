package gov.mads.invent.ive.fachada.impl;

import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.fachada.IReporteFAC;
import gov.mads.invent.ive.modelo.IReporteDAO;
import gov.mads.invent.ive.modelo.impl.ReporteDAO;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class ReporteFAC implements IReporteFAC {

    private IReporteDAO accesoDatos;

    public File generarReporteInventario(Integer idReporte, List<Long> codigosInventario, Integer idUsuario) throws Exception {

        accesoDatos = new ReporteDAO();

        List<HashMap<String, Object>> dataInventarios = new ArrayList<>();
        String inventarios = "";

        for (Long codigoInventario : codigosInventario) {
            inventarios += codigoInventario + ",";
        }
        inventarios += "0";

        ObjetoSalida objetoSalida = accesoDatos.generarReporteInventario(idReporte, inventarios, idUsuario);
        if (objetoSalida.esRespuestaOperacionCorrecta()) {
            dataInventarios.addAll(objetoSalida.getRespuesta());
        }

        return generarReporte(dataInventarios);
    }

    private File generarReporte(List<HashMap<String, Object>> datosReporte) throws Exception {

        File resultado = File.createTempFile("repote", ".xlsx");

        XSSFWorkbook libro = new XSSFWorkbook();
        XSSFSheet hoja = libro.createSheet("Reporte");

        if (datosReporte != null && !datosReporte.isEmpty()) {

            Integer numFila = 0;
            Row filaTitulos = hoja.createRow(numFila++);

            Integer numColumnaEncabezado = 0;
            for (String nomColumna : datosReporte.get(0).keySet()) {
                Cell celda = filaTitulos.createCell(numColumnaEncabezado++);
                celda.setCellValue(nomColumna);
            }

            for (HashMap<String, Object> fila : datosReporte) {
                Row filaDatos = hoja.createRow(numFila++);
                Integer numColumna = 0;
                for (String nomColumna : fila.keySet()) {
                    Cell celda = filaDatos.createCell(numColumna++);
                    celda.setCellValue(fila.get(nomColumna) == null ? "" : (fila.get(nomColumna)).toString());
                }
            }
        }

        try (FileOutputStream escrituraReporte = new FileOutputStream(resultado)) {
            libro.write(escrituraReporte);
        } catch (Exception e) {
            throw new Exception(e);
        }

        return resultado;
    }
}
