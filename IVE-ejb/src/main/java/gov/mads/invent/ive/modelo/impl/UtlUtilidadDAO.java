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

import gov.mads.invent.ive.vista.ConsultarLista_0_OE;

/**
 *
 * @author Ivan Chacon
 */
public class UtlUtilidadDAO extends GenericoDAO { 

	public ObjetoSalida consultarLista(ConsultarLista_0_OE objetoEntrada) {

		ObjetoSalida objetoSalida = new ObjetoSalida();
		try {
			SentenciaDAO sentencia = new SentenciaDAO("PK_UTL_UTILIDAD.Pr_ConsultarLista", objetoEntrada.getIdUsuario());
			List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
			parametros.add(new SentenciaParametroDAO("p_categoria", objetoEntrada.getcategoria(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			sentencia.setParametros(parametros);
			objetoSalida = this.ejecutar(sentencia, objetoSalida);
		} catch (Exception e) {
			objetoSalida.setCodError(CodError.ERROR_INTERNO);
			objetoSalida.setMsgError(e.getMessage());
		}

		return objetoSalida;

	}

}
