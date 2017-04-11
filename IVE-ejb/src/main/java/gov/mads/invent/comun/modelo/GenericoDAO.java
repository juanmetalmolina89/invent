package gov.mads.invent.comun.modelo;

import gov.mads.invent.comun.vista.CodError;
import gov.mads.invent.comun.vista.ObjetoSalida;
import oracle.jdbc.OracleTypes;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class GenericoDAO {

    public ObjetoSalida ejecutar(SentenciaDAO sentencia, ObjetoSalida objetoSalida) throws Exception {

        Connection conx = conectar();
        try (CallableStatement callableStatement = conx.prepareCall(obtenerSQL(sentencia))) {

            for (SentenciaParametroDAO parametro : sentencia.getParametros()) {
                if (parametro.getTipoParametro() == SentenciaTipoParametroDAO.ENTRADA) {
                    if (parametro.getTipoDato() == OracleTypes.CLOB) {
                        Clob clob = conx.createClob();
                        clob.setString(1, parametro.getValor().toString());
                        callableStatement.setObject(parametro.getNombre(), clob, parametro.getTipoDato());
                    }
                    else {
                        callableStatement.setObject(parametro.getNombre(), parametro.getValor(), parametro.getTipoDato());
                    }
                }
                else if (parametro.getTipoParametro() == SentenciaTipoParametroDAO.SALIDA) {
                    callableStatement.registerOutParameter(parametro.getNombre(), parametro.getTipoDato());
                }
            }

            callableStatement.setInt("p_IdUsuario", sentencia.getIdUsuario());
            callableStatement.registerOutParameter("p_Respuesta", OracleTypes.CURSOR);
            callableStatement.registerOutParameter("p_codError", OracleTypes.NUMBER);
            callableStatement.registerOutParameter("p_msjError", OracleTypes.VARCHAR);

            callableStatement.execute();

            objetoSalida.setCodError(CodError.forValue(callableStatement.getInt("p_codError")));
            objetoSalida.setMsgError(callableStatement.getString("p_msjError"));

            if (objetoSalida.getCodError() == CodError.OPERACION_CORRECTA) {

                try (ResultSet datos = ((ResultSet) callableStatement.getObject("p_Respuesta"))) {

                    ResultSetMetaData infoResultado = datos.getMetaData();
                    Integer columnas = infoResultado.getColumnCount();
                    List<HashMap<String, Object>> respuesta = new ArrayList<HashMap<String, Object>>();

                    while (datos.next()) {
                        HashMap<String, Object> registro = new HashMap<String, Object>(columnas);
                        for (Integer i = 1; i <= columnas; ++i) {
                            if (infoResultado.getColumnType(i) == OracleTypes.CLOB) {
                                Clob clob = datos.getClob(i);
                                registro.put(infoResultado.getColumnName(i), (clob == null) ? datos.getObject(i) : clob.getSubString(1, (int) clob.length()));
                            }
                            else {
                                registro.put(infoResultado.getColumnName(i), datos.getObject(i));
                            }
                        }
                        respuesta.add(registro);
                    }

                    objetoSalida.setRespuesta(respuesta);

                } catch (Exception e) {
                    throw new Exception(e);
                }
            }

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.toString());
        } finally {
            Conexion.desconectar(conx);
        }
        return objetoSalida;
    }

    public Connection conectar() throws Exception {

        return Conexion.obtenerInstancia();
    }

    private String obtenerSQL(SentenciaDAO sentencia) {

        String parametrosAdicioanles = "";
        for (SentenciaParametroDAO parametro : sentencia.getParametros()) {
            parametrosAdicioanles += ":" + parametro.getNombre() + ",";
        }

        return "{call " + sentencia.getNombre() + " (" + parametrosAdicioanles + ":p_IdUsuario,:p_Respuesta,:p_codError,:p_msjError)}";
    }
}
