package gov.mads.invent.ive.modelo.impl;

import gov.mads.invent.comun.modelo.GenericoDAO;
import gov.mads.invent.comun.modelo.SentenciaDAO;
import gov.mads.invent.comun.modelo.SentenciaParametroDAO;
import gov.mads.invent.comun.modelo.SentenciaTipoParametroDAO;
import gov.mads.invent.comun.vista.CodError;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.modelo.IReporteDAO;
import oracle.jdbc.OracleTypes;

import java.util.ArrayList;
import java.util.List;

public class ReporteDAO extends GenericoDAO implements IReporteDAO {

    public ObjetoSalida generarReporteInventario(Integer idReporte, String codigoInventario, Integer idUsuario) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {
            SentenciaDAO sentencia = new SentenciaDAO("PK_REPORTE.Pr_generarreporte", idUsuario);
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_CODIGOINV", codigoInventario, SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_REPORTE", idReporte, SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }
}
