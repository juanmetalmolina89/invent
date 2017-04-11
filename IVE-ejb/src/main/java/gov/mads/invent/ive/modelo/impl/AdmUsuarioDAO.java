package gov.mads.invent.ive.modelo.impl;
import gov.mads.invent.comun.modelo.GenericoDAO;
import gov.mads.invent.comun.modelo.SentenciaDAO;
import gov.mads.invent.comun.modelo.SentenciaParametroDAO;
import gov.mads.invent.comun.modelo.SentenciaTipoParametroDAO;
import gov.mads.invent.comun.vista.CodError;
import gov.mads.invent.comun.vista.ObjetoSalida;
import oracle.jdbc.OracleTypes;
import java.util.ArrayList;
import java.util.List;

import gov.mads.invent.ive.vista.RegistrarUsuario_20_OE;
import gov.mads.invent.ive.vista.ActualizarUsuario_20_OE;
import gov.mads.invent.ive.vista.EliminarUsuario_20_OE;
import gov.mads.invent.ive.vista.CambiarContrasena_20_OE;
import gov.mads.invent.ive.vista.ValidarUsuario_20_OE;
import gov.mads.invent.ive.vista.ConsultarUsuario_20_OE;
import gov.mads.invent.ive.vista.ConsultarGrilla_20_OE;

/**
 *
 * @author Ivan Chacon
 */
public class AdmUsuarioDAO extends GenericoDAO { 

	public ObjetoSalida registrarUsuario(RegistrarUsuario_20_OE objetoEntrada) {

		ObjetoSalida objetoSalida = new ObjetoSalida();
		try {
			SentenciaDAO sentencia = new SentenciaDAO("PK_ADM_USUARIO.Pr_RegistrarUsuario", objetoEntrada.getIdUsuario());
			List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
			parametros.add(new SentenciaParametroDAO("p_A002NOMBRE", objetoEntrada.getIvetT002Usuario().getA002nombre(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A002APELLIDO", objetoEntrada.getIvetT002Usuario().getA002apellido(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A002IDTIPODOCUMENTO", objetoEntrada.getIvetT002Usuario().getA002idtipodocumento().getA102codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A002DOCUMENTO", objetoEntrada.getIvetT002Usuario().getA002documento(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
                        //NO EXISTE CAMPO EN EL ENTITY
			//parametros.add(new SentenciaParametroDAO("p_A002LGEXPEDIDODOC", objetoEntrada.getIvetT002Usuario().getA002lgexpedidodoc(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A002DIRECCIONCORRESP", objetoEntrada.getIvetT002Usuario().getA002direccioncorresp(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A002LOCALIZACION", objetoEntrada.getIvetT002Usuario().getA002localizacion().getA105codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A002CORREOELECTRONICO", objetoEntrada.getIvetT002Usuario().getA002correoelectronico(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A002TELEFONO", objetoEntrada.getIvetT002Usuario().getA002telefono(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A002CELULAR", objetoEntrada.getIvetT002Usuario().getA002celular(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A002USUARIO", objetoEntrada.getIvetT002Usuario().getA002usuario(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A002CONTRASENA", objetoEntrada.getIvetT002Usuario().getA002contrasena(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A002TIPOUSUARIO", objetoEntrada.getIvetT002Usuario().getA002tipousuario().getA102codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A002AUTORIDADAMBIENTAL", objetoEntrada.getIvetT002Usuario().getA002autoridadambiental().getA001codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			sentencia.setParametros(parametros);
			objetoSalida = this.ejecutar(sentencia, objetoSalida);
		} catch (Exception e) {
			objetoSalida.setCodError(CodError.ERROR_INTERNO);
			objetoSalida.setMsgError(e.getMessage());
		}

		return objetoSalida;

	}

	public ObjetoSalida actualizarUsuario(ActualizarUsuario_20_OE objetoEntrada) {

		ObjetoSalida objetoSalida = new ObjetoSalida();
		try {
			SentenciaDAO sentencia = new SentenciaDAO("PK_ADM_USUARIO.Pr_ActualizarUsuario", objetoEntrada.getIdUsuario());
			List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
			parametros.add(new SentenciaParametroDAO("p_A002CODIGO", objetoEntrada.getIvetT002Usuario().getA002codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A002NOMBRE", objetoEntrada.getIvetT002Usuario().getA002nombre(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A002APELLIDO", objetoEntrada.getIvetT002Usuario().getA002apellido(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A002IDTIPODOCUMENTO", objetoEntrada.getIvetT002Usuario().getA002idtipodocumento().getA102codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A002DOCUMENTO", objetoEntrada.getIvetT002Usuario().getA002documento(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
                        //NO EXISTE CAMPO EN EL ENTITY
			//parametros.add(new SentenciaParametroDAO("p_A002LGEXPEDIDODOC", objetoEntrada.getIvetT002Usuario().getA002lgexpedidodoc(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A002DIRECCIONCORRESP", objetoEntrada.getIvetT002Usuario().getA002direccioncorresp(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A002LOCALIZACION", objetoEntrada.getIvetT002Usuario().getA002localizacion().getA105codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A002CORREOELECTRONICO", objetoEntrada.getIvetT002Usuario().getA002correoelectronico(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A002TELEFONO", objetoEntrada.getIvetT002Usuario().getA002telefono(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A002CELULAR", objetoEntrada.getIvetT002Usuario().getA002celular(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A002USUARIO", objetoEntrada.getIvetT002Usuario().getA002usuario(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A002CONTRASENA", objetoEntrada.getIvetT002Usuario().getA002contrasena(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A002TIPOUSUARIO", objetoEntrada.getIvetT002Usuario().getA002tipousuario().getA102codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A002AUTORIDADAMBIENTAL", objetoEntrada.getIvetT002Usuario().getA002autoridadambiental().getA001codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A002ESTADOUSUARIO", objetoEntrada.getIvetT002Usuario().getA002estadousuario(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			sentencia.setParametros(parametros);
			objetoSalida = this.ejecutar(sentencia, objetoSalida);
		} catch (Exception e) {
			objetoSalida.setCodError(CodError.ERROR_INTERNO);
			objetoSalida.setMsgError(e.getMessage());
		}

		return objetoSalida;

	}

	public ObjetoSalida eliminarUsuario(EliminarUsuario_20_OE objetoEntrada) {

		ObjetoSalida objetoSalida = new ObjetoSalida();
		try {
			SentenciaDAO sentencia = new SentenciaDAO("PK_ADM_USUARIO.Pr_EliminarUsuario", objetoEntrada.getIdUsuario());
			List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
			parametros.add(new SentenciaParametroDAO("p_A002CODIGO", objetoEntrada.getIvetT002Usuario().getA002codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			sentencia.setParametros(parametros);
			objetoSalida = this.ejecutar(sentencia, objetoSalida);
		} catch (Exception e) {
			objetoSalida.setCodError(CodError.ERROR_INTERNO);
			objetoSalida.setMsgError(e.getMessage());
		}

		return objetoSalida;

	}

	public ObjetoSalida cambiarContrasena(CambiarContrasena_20_OE objetoEntrada) {

		ObjetoSalida objetoSalida = new ObjetoSalida();
		try {
			SentenciaDAO sentencia = new SentenciaDAO("PK_ADM_USUARIO.Pr_CambiarContrasena", objetoEntrada.getIdUsuario());
			List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
			parametros.add(new SentenciaParametroDAO("p_A002CODIGO", objetoEntrada.getIvetT002Usuario().getA002codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A002USUARIO", objetoEntrada.getIvetT002Usuario().getA002usuario(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A002CONTRASENA", objetoEntrada.getIvetT002Usuario().getA002contrasena(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			//NO EXISTE CAMPO EN EL ENTITY
                        //parametros.add(new SentenciaParametroDAO("p_A002CLAVENUEVA", objetoEntrada.getIvetT002Usuario().getA002clavenueva(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			sentencia.setParametros(parametros);
			objetoSalida = this.ejecutar(sentencia, objetoSalida);
		} catch (Exception e) {
			objetoSalida.setCodError(CodError.ERROR_INTERNO);
			objetoSalida.setMsgError(e.getMessage());
		}

		return objetoSalida;

	}

	public ObjetoSalida validarUsuario(ValidarUsuario_20_OE objetoEntrada) {

		ObjetoSalida objetoSalida = new ObjetoSalida();
		try {
			SentenciaDAO sentencia = new SentenciaDAO("PK_ADM_USUARIO.Pr_ValidarUsuario", objetoEntrada.getIdUsuario());
			List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
			parametros.add(new SentenciaParametroDAO("p_A002USUARIO", objetoEntrada.getIvetT002Usuario().getA002usuario(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A002CONTRASENA", objetoEntrada.getIvetT002Usuario().getA002contrasena(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			sentencia.setParametros(parametros);
			objetoSalida = this.ejecutar(sentencia, objetoSalida);
		} catch (Exception e) {
			objetoSalida.setCodError(CodError.ERROR_INTERNO);
			objetoSalida.setMsgError(e.getMessage());
		}

		return objetoSalida;

	}

	public ObjetoSalida consultarUsuario(ConsultarUsuario_20_OE objetoEntrada) {

		ObjetoSalida objetoSalida = new ObjetoSalida();
		try {
			SentenciaDAO sentencia = new SentenciaDAO("PK_ADM_USUARIO.Pr_ConsultarUsuario", objetoEntrada.getIdUsuario());
			List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
			parametros.add(new SentenciaParametroDAO("p_A002CODIGO", objetoEntrada.getIvetT002Usuario().getA002codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			sentencia.setParametros(parametros);
			objetoSalida = this.ejecutar(sentencia, objetoSalida);
		} catch (Exception e) {
			objetoSalida.setCodError(CodError.ERROR_INTERNO);
			objetoSalida.setMsgError(e.getMessage());
		}

		return objetoSalida;

	}

	public ObjetoSalida consultarGrilla(ConsultarGrilla_20_OE objetoEntrada) {

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

}
