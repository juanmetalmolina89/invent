package gov.mads.invent.adm.modelo.impl;

import gov.mads.invent.adm.modelo.IUsuarioDAO;
import gov.mads.invent.adm.vista.UsuarioOE;
import gov.mads.invent.comun.modelo.GenericoDAO;
import gov.mads.invent.comun.modelo.SentenciaDAO;
import gov.mads.invent.comun.modelo.SentenciaParametroDAO;
import gov.mads.invent.comun.modelo.SentenciaTipoParametroDAO;
import gov.mads.invent.comun.vista.BusquedaOE;
import gov.mads.invent.comun.vista.CodError;
import gov.mads.invent.comun.vista.ObjetoSalida;
import oracle.jdbc.OracleTypes;

import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO extends GenericoDAO implements IUsuarioDAO {

    public ObjetoSalida validarUsuario(UsuarioOE objetoEntrada) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_ADM_USUARIO.Pr_ValidarUsuario", objetoEntrada.getIdUsuario());
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A002USUARIO", objetoEntrada.getUsuario().getA002usuario(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_A002CONTRASENA", objetoEntrada.getUsuario().getA002contrasena(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    public ObjetoSalida registrarUsuario(UsuarioOE objetoEntrada) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_ADM_USUARIO.Pr_RegistrarUsuario", objetoEntrada.getIdUsuario());
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();

            parametros.add(new SentenciaParametroDAO("p_A002NOMBRE", objetoEntrada.getUsuario().getA002nombre(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_A002APELLIDO", objetoEntrada.getUsuario().getA002apellido(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_A002IDTIPODOCUMENTO", objetoEntrada.getUsuario().getA002idtipodocumento().getA102codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A002DOCUMENTO", objetoEntrada.getUsuario().getA002documento(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("P_A002LGEXPEDIDODOC", objetoEntrada.getUsuario().getA002expedidoen(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_A002DIRECCIONCORRESP", objetoEntrada.getUsuario().getA002direccioncorresp(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_A002LOCALIZACION", objetoEntrada.getUsuario().getA002localizacion().getA105codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A002CORREOELECTRONICO", objetoEntrada.getUsuario().getA002correoelectronico(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_A002TELEFONO", objetoEntrada.getUsuario().getA002telefono(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_A002CELULAR", objetoEntrada.getUsuario().getA002celular(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_A002USUARIO", objetoEntrada.getUsuario().getA002usuario(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_A002CONTRASENA", objetoEntrada.getUsuario().getA002contrasena(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_A002TIPOUSUARIO", objetoEntrada.getUsuario().getA002tipousuario().getA102codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A002AUTORIDADAMBIENTAL", objetoEntrada.getUsuario().getA002autoridadambiental().getA001codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));

            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    public ObjetoSalida consultarUsuario(UsuarioOE objetoEntrada) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_ADM_USUARIO.Pr_ConsultarUsuario", objetoEntrada.getIdUsuario());
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A002CODIGO", objetoEntrada.getUsuario().getA002codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    public ObjetoSalida consultarGrilla(BusquedaOE objetoEntrada) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_ADM_USUARIO.Pr_ConsultarGrilla", objetoEntrada.getIdUsuario());
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

    public ObjetoSalida actualizarUsuario(UsuarioOE objetoEntrada) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_ADM_USUARIO.Pr_ActualizarUsuario", objetoEntrada.getIdUsuario());
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();

            parametros.add(new SentenciaParametroDAO("p_A002CODIGO", objetoEntrada.getUsuario().getA002codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A002NOMBRE", objetoEntrada.getUsuario().getA002nombre(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_A002APELLIDO", objetoEntrada.getUsuario().getA002apellido(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_A002IDTIPODOCUMENTO", objetoEntrada.getUsuario().getA002idtipodocumento().getA102codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A002DOCUMENTO", objetoEntrada.getUsuario().getA002documento(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("P_A002LGEXPEDIDODOC", objetoEntrada.getUsuario().getA002expedidoen(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_A002DIRECCIONCORRESP", objetoEntrada.getUsuario().getA002direccioncorresp(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_A002LOCALIZACION", objetoEntrada.getUsuario().getA002localizacion().getA105codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A002CORREOELECTRONICO", objetoEntrada.getUsuario().getA002correoelectronico(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_A002TELEFONO", objetoEntrada.getUsuario().getA002telefono(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_A002CELULAR", objetoEntrada.getUsuario().getA002celular(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_A002USUARIO", objetoEntrada.getUsuario().getA002usuario(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_A002CONTRASENA", objetoEntrada.getUsuario().getA002contrasena(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_A002TIPOUSUARIO", objetoEntrada.getUsuario().getA002tipousuario().getA102codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A002AUTORIDADAMBIENTAL", objetoEntrada.getUsuario().getA002autoridadambiental().getA001codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A002ESTADOUSUARIO", objetoEntrada.getUsuario().getA002estadousuario().toString(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));

            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    public ObjetoSalida eliminarUsuario(UsuarioOE objetoEntrada) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_ADM_USUARIO.Pr_EliminarUsuario", objetoEntrada.getIdUsuario());
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A002CODIGO", objetoEntrada.getUsuario().getA002codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }
    
    public ObjetoSalida validarUsuarioVital(UsuarioOE objetoEntrada) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_ADM_USUARIO.Pr_ValidarUsuarioVital", objetoEntrada.getIdUsuario());
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A002USUARIO", objetoEntrada.getUsuario().getA002usuario(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }
}