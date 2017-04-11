package gov.mads.invent.ive.modelo.impl;

import gov.mads.invent.comun.modelo.GenericoDAO;
import gov.mads.invent.comun.modelo.SentenciaDAO;
import gov.mads.invent.comun.modelo.SentenciaParametroDAO;
import gov.mads.invent.comun.modelo.SentenciaTipoParametroDAO;
import gov.mads.invent.comun.vista.BusquedaOE;
import gov.mads.invent.comun.vista.CodError;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.modelo.IInventarioDAO;
import gov.mads.invent.ive.vista.InventarioOE;
import oracle.jdbc.OracleTypes;
import org.jose4j.json.internal.json_simple.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class InventarioDAO extends GenericoDAO implements IInventarioDAO {

    @Override
    public ObjetoSalida registrarInventario(InventarioOE objetoEntrada) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_INVENTARIO.Pr_RegistrarInventario", objetoEntrada.getIdUsuario());
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A003OBJETO", objetoEntrada.getInventario().getA003objeto(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_A003FECHA_INICIAL", new java.sql.Date(objetoEntrada.getInventario().getA003fechaInicial().getTime()), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.DATE));
            parametros.add(new SentenciaParametroDAO("p_A003FECHA_FINAL", new java.sql.Date(objetoEntrada.getInventario().getA003fechaFinal().getTime()), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.DATE));
            parametros.add(new SentenciaParametroDAO("p_A003IDDIVIPOLA", objetoEntrada.getInventario().getA003iddivipola().getA105codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A003DESCRIPCION_TERRITORIO", objetoEntrada.getInventario().getA003descripcionTerritorio(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida consultarInventario(InventarioOE objetoEntrada) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_INVENTARIO.Pr_ConsultarInventarioId", objetoEntrada.getIdUsuario());
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A003CODIGO", objetoEntrada.getInventario().getA003codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida consultarGrilla(BusquedaOE objetoEntrada) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_INVENTARIO.Pr_ConsultarGrillaInv", objetoEntrada.getIdUsuario());
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_PalabraClave", objetoEntrada.getPalabraClave(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida actualizarInventario(InventarioOE objetoEntrada) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_INVENTARIO.Pr_ActualizarInventario", objetoEntrada.getIdUsuario());
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A003CODIGO", objetoEntrada.getInventario().getA003codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A003OBJETO", objetoEntrada.getInventario().getA003objeto(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_A003FECHA_INICIAL", new java.sql.Date(objetoEntrada.getInventario().getA003fechaInicial().getTime()), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.DATE));
            parametros.add(new SentenciaParametroDAO("p_A003FECHA_FINAL", new java.sql.Date(objetoEntrada.getInventario().getA003fechaFinal().getTime()), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.DATE));
            parametros.add(new SentenciaParametroDAO("p_A003ESTADO_INVENTARIO", objetoEntrada.getInventario().getA003estadoInventario().getA102codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A003IDDIVIPOLA", objetoEntrada.getInventario().getA003iddivipola().getA105codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A003DESCRIPCION_TERRITORIO", objetoEntrada.getInventario().getA003descripcionTerritorio(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida eliminarInventarioContaminante(Integer codigoContaminante, Integer idUsuario) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_INVENTARIO.Pr_EliminarInvContamina", idUsuario);
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A016CODIGO", codigoContaminante, SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida registrarInventarioContaminante(Integer codigoInventario, Integer codigoContaminante, Integer idUsuario) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_INVENTARIO.Pr_RegistrarInvContamina", idUsuario);
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A016IDINVENTARIO", codigoInventario, SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A016IDCONTAMINANTE", codigoContaminante, SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida eliminarInventarioFuente(Integer codigoFuente, Integer idUsuario) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_INVENTARIO.Pr_EliminarInvFuente", idUsuario);
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A007CODIGO", codigoFuente, SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida registrarInventarioFuente(Integer codigoInventario, Integer codigoFuente, Integer idUsuario) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_INVENTARIO.Pr_RegistrarInvFuente", idUsuario);
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A007IDINVENTARIO", codigoInventario, SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A007IDFUENTE", codigoFuente, SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida registrarGeometria(Integer codigoInventario, JSONObject geometria, Integer idUsuario) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_INVENTARIO.Pr_RegistrarGometria", idUsuario);
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A004GEOMETRIA", geometria.toJSONString(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.CLOB));
            parametros.add(new SentenciaParametroDAO("p_A007IDINVENTARIO", codigoInventario, SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida registrarAdjunto(Integer codigoInventario, String nombreAdjunto, String rutaAdjunto, Integer idUsuario) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_INVENTARIO.Pr_RegistrarAdjunto", idUsuario);
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A014NOMBREADJUNTO", nombreAdjunto, SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_A014RUTAADJUNTO", rutaAdjunto, SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_A014IDINVENTARIO", codigoInventario, SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida consultarGeometria(InventarioOE objetoEntrada) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {
            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_INVENTARIO.Pr_ConsultarGometriaId", objetoEntrada.getIdUsuario());
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A004IDINVENTARIO", objetoEntrada.getInventario().getA003codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida actualizarGeometria(Integer codigoGeometria, Integer codigoInventario, JSONObject geometria, Integer idUsuario) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_INVENTARIO.Pr_ActualizarGeometria", idUsuario);
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A004CODIGO", codigoGeometria, SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A004GEOMETRIA", geometria.toJSONString(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.CLOB));
            parametros.add(new SentenciaParametroDAO("p_A004IDINVENTARIO", codigoInventario, SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida consultarInventarioFuente(InventarioOE objetoEntrada) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {
            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_INVENTARIO.Pr_ConsultarInvFuente", objetoEntrada.getIdUsuario());
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A007IDINVENTARIO", objetoEntrada.getInventario().getA003codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida consultarInventarioContaminante(InventarioOE objetoEntrada) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {
            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_INVENTARIO.Pr_ConsultarInvContamina", objetoEntrada.getIdUsuario());
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A016IDINVENTARIO", objetoEntrada.getInventario().getA003codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida actualizarAdjunto(Integer codigoAdjunto, Integer codigoInventario, String nombreAdjunto, String rutaAdjunto, Integer idUsuario) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_INVENTARIO.Pr_ActualizarAdjunto", idUsuario);
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A014CODIGO", codigoAdjunto, SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A014NOMBREADJUNTO", nombreAdjunto, SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_A014RUTAADJUNTO", rutaAdjunto, SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_A014IDINVENTARIO", codigoInventario, SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida consultarAdjunto(Integer codigoInventario, Integer idUsuario) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_INVENTARIO.Pr_ConsultarAdjuntoId", idUsuario);
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A014IDINVENTARIO", codigoInventario, SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida cambiarEstadoInventario(InventarioOE objetoEntrada) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_INVENTARIO.Pr_CambioEstadoInv", objetoEntrada.getIdUsuario());
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A003CODIGO", objetoEntrada.getInventario().getA003codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A003OBS_RECHAZO", objetoEntrada.getInventario().getA003obsRechazo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_estpasa", objetoEntrada.getInventario().getA003estadoInventario().getA102codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }
}