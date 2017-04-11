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

import gov.mads.invent.ive.vista.Insertar_16_OE;
import gov.mads.invent.ive.vista.Eliminar_16_OE;
import gov.mads.invent.ive.vista.Actualizar_16_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_16_OE;

/**
 *
 * @author Ivan Chacon
 */
public class EntidadDAO extends GenericoDAO { 

	public ObjetoSalida insertar(Insertar_16_OE objetoEntrada) {

		ObjetoSalida objetoSalida = new ObjetoSalida();
		try {
			SentenciaDAO sentencia = new SentenciaDAO("PK_T001_ENTIDAD.Pr_Insertar", objetoEntrada.getIdUsuario());
			List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
			parametros.add(new SentenciaParametroDAO("p_A001SIGLAAUTAMB", objetoEntrada.getIvetT001Entidad().getA001siglaautamb(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A001NOMBREAUTAMB", objetoEntrada.getIvetT001Entidad().getA001nombreautamb(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A001CODDIVIPOLA", objetoEntrada.getIvetT001Entidad().getA001coddivipola().getA105codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			sentencia.setParametros(parametros);
			objetoSalida = this.ejecutar(sentencia, objetoSalida);
		} catch (Exception e) {
			objetoSalida.setCodError(CodError.ERROR_INTERNO);
			objetoSalida.setMsgError(e.getMessage());
		}

		return objetoSalida;

	}

	public ObjetoSalida eliminar(Eliminar_16_OE objetoEntrada) {

		ObjetoSalida objetoSalida = new ObjetoSalida();
		try {
			SentenciaDAO sentencia = new SentenciaDAO("PK_T001_ENTIDAD.Pr_Eliminar", objetoEntrada.getIdUsuario());
			List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
			parametros.add(new SentenciaParametroDAO("p_A001CODIGO", objetoEntrada.getIvetT001Entidad().getA001codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			sentencia.setParametros(parametros);
			objetoSalida = this.ejecutar(sentencia, objetoSalida);
		} catch (Exception e) {
			objetoSalida.setCodError(CodError.ERROR_INTERNO);
			objetoSalida.setMsgError(e.getMessage());
		}

		return objetoSalida;

	}

	public ObjetoSalida actualizar(Actualizar_16_OE objetoEntrada) {

		ObjetoSalida objetoSalida = new ObjetoSalida();
		try {
			SentenciaDAO sentencia = new SentenciaDAO("PK_T001_ENTIDAD.Pr_Actualizar", objetoEntrada.getIdUsuario());
			List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
			parametros.add(new SentenciaParametroDAO("p_A001CODIGO", objetoEntrada.getIvetT001Entidad().getA001codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A001SIGLAAUTAMB", objetoEntrada.getIvetT001Entidad().getA001siglaautamb(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A001NOMBREAUTAMB", objetoEntrada.getIvetT001Entidad().getA001nombreautamb(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			sentencia.setParametros(parametros);
			objetoSalida = this.ejecutar(sentencia, objetoSalida);
		} catch (Exception e) {
			objetoSalida.setCodError(CodError.ERROR_INTERNO);
			objetoSalida.setMsgError(e.getMessage());
		}

		return objetoSalida;

	}

	public ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_16_OE objetoEntrada) {

		ObjetoSalida objetoSalida = new ObjetoSalida();
		try {
			SentenciaDAO sentencia = new SentenciaDAO("PK_T001_ENTIDAD.Pr_ConsultarPorFiltro", objetoEntrada.getIdUsuario());
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
