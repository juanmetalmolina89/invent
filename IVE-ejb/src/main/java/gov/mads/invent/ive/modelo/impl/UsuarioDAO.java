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

import gov.mads.invent.ive.vista.Insertar_15_OE;
import gov.mads.invent.ive.vista.Eliminar_15_OE;
import gov.mads.invent.ive.vista.Actualizar_15_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_15_OE;

/**
 *
 * @author Ivan Chacon
 */
public class UsuarioDAO extends GenericoDAO { 

	public ObjetoSalida insertar(Insertar_15_OE objetoEntrada) {

		ObjetoSalida objetoSalida = new ObjetoSalida();
		try {
			SentenciaDAO sentencia = new SentenciaDAO("PK_T002_USUARIO.Pr_Insertar", objetoEntrada.getIdUsuario());
			List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
			parametros.add(new SentenciaParametroDAO("p_p_A002NOMBRE", objetoEntrada.getIvetT002Usuario().getA002nombre(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A002APELLIDO", objetoEntrada.getIvetT002Usuario().getA002apellido(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A002IDTIPODOCUMENTO", objetoEntrada.getIvetT002Usuario().getA002idtipodocumento().getA102codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A002DOCUMENTO", objetoEntrada.getIvetT002Usuario().getA002documento(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
                        //NO EXISTE CAMPO EN ENTITY
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

	public ObjetoSalida eliminar(Eliminar_15_OE objetoEntrada) {

		ObjetoSalida objetoSalida = new ObjetoSalida();
		try {
			SentenciaDAO sentencia = new SentenciaDAO("PK_T002_USUARIO.Pr_Eliminar", objetoEntrada.getIdUsuario());
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

	public ObjetoSalida actualizar(Actualizar_15_OE objetoEntrada) {

		ObjetoSalida objetoSalida = new ObjetoSalida();
		try {
			SentenciaDAO sentencia = new SentenciaDAO("PK_T002_USUARIO.Pr_Actualizar", objetoEntrada.getIdUsuario());
			List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
			parametros.add(new SentenciaParametroDAO("p_A002CODIGO", objetoEntrada.getIvetT002Usuario().getA002codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A002NOMBRE", objetoEntrada.getIvetT002Usuario().getA002nombre(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A002APELLIDO", objetoEntrada.getIvetT002Usuario().getA002apellido(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A002IDTIPODOCUMENTO", objetoEntrada.getIvetT002Usuario().getA002idtipodocumento().getA102codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A002DOCUMENTO", objetoEntrada.getIvetT002Usuario().getA002documento(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
                        //NO EXISTE CAMPO EN ENTITY
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

	public ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_15_OE objetoEntrada) {

		ObjetoSalida objetoSalida = new ObjetoSalida();
		try {
			SentenciaDAO sentencia = new SentenciaDAO("PK_T002_USUARIO.Pr_ConsultarPorFiltro", objetoEntrada.getIdUsuario());
			List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
			parametros.add(new SentenciaParametroDAO("p_filtro", objetoEntrada.getfiltro(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			sentencia.setParametros(parametros);
			objetoSalida = this.ejecutar(sentencia, objetoSalida);
		} catch (Exception e) {
			objetoSalida.setCodError(CodError.ERROR_INTERNO);
			objetoSalida.setMsgError(e.getMessage());
		}

		return objetoSalida;

	}

}
