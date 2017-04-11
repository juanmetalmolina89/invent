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

import gov.mads.invent.ive.vista.Insertar_2_OE;

/**
 *
 * @author Ivan Chacon
 */
public class T998ExceptionDAO extends GenericoDAO { 

	public ObjetoSalida insertar(Insertar_2_OE objetoEntrada) {

		ObjetoSalida objetoSalida = new ObjetoSalida();
		try {
			SentenciaDAO sentencia = new SentenciaDAO("PK_T998_EXCEPCION.Pr_Insertar", objetoEntrada.getIdUsuario());
			List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
			parametros.add(new SentenciaParametroDAO("p_a998fechaexcepcion", objetoEntrada.getSistT998Excepcion().getA998fechaexcepcion(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.DATE));
			parametros.add(new SentenciaParametroDAO("p_a998usuario", objetoEntrada.getSistT998Excepcion().getA998usuario().intValue(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_a998paquete", objetoEntrada.getSistT998Excepcion().getA998paquete(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_a998procedimiento", objetoEntrada.getSistT998Excepcion().getA998procedimiento(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			sentencia.setParametros(parametros);
			objetoSalida = this.ejecutar(sentencia, objetoSalida);
		} catch (Exception e) {
			objetoSalida.setCodError(CodError.ERROR_INTERNO);
			objetoSalida.setMsgError(e.getMessage());
		}

		return objetoSalida;

	}

}
