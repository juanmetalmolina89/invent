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

import gov.mads.invent.ive.vista.ListarAutoridades_1_OE;
import gov.mads.invent.ive.vista.ListarDivipolaDepto_1_OE;
import gov.mads.invent.ive.vista.ListarDivipolaMcpio_1_OE;
import gov.mads.invent.ive.vista.ListarParametricas_1_OE;

/**
 *
 * @author Ivan Chacon
 */
public class UtlListadosDAO extends GenericoDAO { 

	public ObjetoSalida listarAutoridades(ListarAutoridades_1_OE objetoEntrada) {

		ObjetoSalida objetoSalida = new ObjetoSalida();
		try {
			SentenciaDAO sentencia = new SentenciaDAO("PK_UTL_LISTADOS.Pr_ListarAutoridades", objetoEntrada.getIdUsuario());
			List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
			parametros.add(new SentenciaParametroDAO("p_idUsuario", objetoEntrada.getidUsuario(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			sentencia.setParametros(parametros);
			objetoSalida = this.ejecutar(sentencia, objetoSalida);
		} catch (Exception e) {
			objetoSalida.setCodError(CodError.ERROR_INTERNO);
			objetoSalida.setMsgError(e.getMessage());
		}

		return objetoSalida;

	}

	public ObjetoSalida listarDivipolaDepto(ListarDivipolaDepto_1_OE objetoEntrada) {

		ObjetoSalida objetoSalida = new ObjetoSalida();
		try {
			SentenciaDAO sentencia = new SentenciaDAO("PK_UTL_LISTADOS.Pr_ListarDivipolaDepto", objetoEntrada.getIdUsuario());
			List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
			parametros.add(new SentenciaParametroDAO("p_idUsuario", objetoEntrada.getidUsuario(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			sentencia.setParametros(parametros);
			objetoSalida = this.ejecutar(sentencia, objetoSalida);
		} catch (Exception e) {
			objetoSalida.setCodError(CodError.ERROR_INTERNO);
			objetoSalida.setMsgError(e.getMessage());
		}

		return objetoSalida;

	}

	public ObjetoSalida listarDivipolaMcpio(ListarDivipolaMcpio_1_OE objetoEntrada) {

		ObjetoSalida objetoSalida = new ObjetoSalida();
		try {
			SentenciaDAO sentencia = new SentenciaDAO("PK_UTL_LISTADOS.Pr_ListarDivipolaMcpio", objetoEntrada.getIdUsuario());
			List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
			parametros.add(new SentenciaParametroDAO("p_A105CODDEPARTAMENTO", objetoEntrada.getPartT105Divipola().getA105coddepartamento(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_idUsuario", objetoEntrada.getidUsuario(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			sentencia.setParametros(parametros);
			objetoSalida = this.ejecutar(sentencia, objetoSalida);
		} catch (Exception e) {
			objetoSalida.setCodError(CodError.ERROR_INTERNO);
			objetoSalida.setMsgError(e.getMessage());
		}

		return objetoSalida;

	}

	public ObjetoSalida listarParametricas(ListarParametricas_1_OE objetoEntrada) {

		ObjetoSalida objetoSalida = new ObjetoSalida();
		try {
			SentenciaDAO sentencia = new SentenciaDAO("PK_UTL_LISTADOS.Pr_ListarParametricas", objetoEntrada.getIdUsuario());
			List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
			parametros.add(new SentenciaParametroDAO("p_Categoria", objetoEntrada.getCategoria(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_idUsuario", objetoEntrada.getidUsuario(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			sentencia.setParametros(parametros);
			objetoSalida = this.ejecutar(sentencia, objetoSalida);
		} catch (Exception e) {
			objetoSalida.setCodError(CodError.ERROR_INTERNO);
			objetoSalida.setMsgError(e.getMessage());
		}

		return objetoSalida;

	}

}
