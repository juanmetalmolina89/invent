package gov.mads.invent.ive.modelo.impl;
import gov.mads.invent.comun.modelo.GenericoDAO;
import gov.mads.invent.comun.modelo.SentenciaDAO;
import gov.mads.invent.comun.modelo.SentenciaParametroDAO;
import gov.mads.invent.comun.modelo.SentenciaTipoParametroDAO;
import gov.mads.invent.comun.vista.CodError;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.vista.Actualizar_6_OE;
import gov.mads.invent.ive.vista.ContaminanteOE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_6_OE;
import gov.mads.invent.ive.vista.Eliminar_6_OE;
import oracle.jdbc.OracleTypes;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ivan Chacon
 */
public class CateContaminaDAO extends GenericoDAO { 

	public ObjetoSalida insertar(ContaminanteOE objetoEntrada) {

		ObjetoSalida objetoSalida = new ObjetoSalida();
		try {
			SentenciaDAO sentencia = new SentenciaDAO("PK_T013_CATEGCONTAMINA.Pr_Insertar", objetoEntrada.getIdUsuario());
			List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
			parametros.add(new SentenciaParametroDAO("p_A013IDCATEGORIAEMISION", objetoEntrada.getContaminante().getA013idcategoriaemision().getA009codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A013IDCONTAMINANTE", objetoEntrada.getContaminante().getA013idcontaminante().getA005codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A013VALORCONTAMINANTE", objetoEntrada.getContaminante().getA013valorcontaminante().intValue(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A013FACTORACTIVIDAD", objetoEntrada.getContaminante().getA013factoractividad(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A013UNDMEDFACTORACTIV", objetoEntrada.getContaminante().getA013undmedfactoractiv().getA011codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A013FTEMETDFACTORACTIV", objetoEntrada.getContaminante().getA013ftemetdfactoractiv(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A013FACTOREMISION", objetoEntrada.getContaminante().getA013factoremision().intValue(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A013UNDMEDFACTOREMIS", objetoEntrada.getContaminante().getA013undmedfactoremis().getA012codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A013FTEMETDFACTOREMIS", objetoEntrada.getContaminante().getA013ftemetdfactoremis(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A013EMISIONTOTAL", objetoEntrada.getContaminante().getA013emisiontotal().intValue(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_idUsuario", objetoEntrada.getIdUsuario(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			sentencia.setParametros(parametros);
			objetoSalida = this.ejecutar(sentencia, objetoSalida);
		} catch (Exception e) {
			objetoSalida.setCodError(CodError.ERROR_INTERNO);
			objetoSalida.setMsgError(e.getMessage());
		}

		return objetoSalida;

	}

	public ObjetoSalida eliminar(Eliminar_6_OE objetoEntrada) {

		ObjetoSalida objetoSalida = new ObjetoSalida();
		try {
			SentenciaDAO sentencia = new SentenciaDAO("PK_T013_CATEGCONTAMINA.Pr_Eliminar", objetoEntrada.getIdUsuario());
			List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
			parametros.add(new SentenciaParametroDAO("p_A013CODIGO", objetoEntrada.getIvetT013Categcontamina().getA013codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_idUsuario", objetoEntrada.getidUsuario(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			sentencia.setParametros(parametros);
			objetoSalida = this.ejecutar(sentencia, objetoSalida);
		} catch (Exception e) {
			objetoSalida.setCodError(CodError.ERROR_INTERNO);
			objetoSalida.setMsgError(e.getMessage());
		}

		return objetoSalida;

	}

	public ObjetoSalida actualizar(Actualizar_6_OE objetoEntrada) {

		ObjetoSalida objetoSalida = new ObjetoSalida();
		try {
			SentenciaDAO sentencia = new SentenciaDAO("PK_T013_CATEGCONTAMINA.Pr_Actualizar", objetoEntrada.getIdUsuario());
			List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
			parametros.add(new SentenciaParametroDAO("p_A013CODIGO", objetoEntrada.getIvetT013Categcontamina().getA013codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A013IDCATEGORIAEMISION", objetoEntrada.getIvetT013Categcontamina().getA013idcategoriaemision().getA009codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A013IDCONTAMINANTE", objetoEntrada.getIvetT013Categcontamina().getA013idcontaminante().getA005codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A013VALORCONTAMINANTE", objetoEntrada.getIvetT013Categcontamina().getA013valorcontaminante().intValue(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A013FACTORACTIVIDAD", objetoEntrada.getIvetT013Categcontamina().getA013factoractividad(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A013UNDMEDFACTORACTIV", objetoEntrada.getIvetT013Categcontamina().getA013undmedfactoractiv().getA011codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A013FTEMETDFACTORACTIV", objetoEntrada.getIvetT013Categcontamina().getA013ftemetdfactoractiv(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A013FACTOREMISION", objetoEntrada.getIvetT013Categcontamina().getA013factoremision().intValue(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A013UNDMEDFACTOREMIS", objetoEntrada.getIvetT013Categcontamina().getA013undmedfactoremis().getA012codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A013FTEMETDFACTOREMIS", objetoEntrada.getIvetT013Categcontamina().getA013ftemetdfactoremis(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A013EMISIONTOTAL", objetoEntrada.getIvetT013Categcontamina().getA013emisiontotal().intValue(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_idUsuario", objetoEntrada.getidUsuario(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			sentencia.setParametros(parametros);
			objetoSalida = this.ejecutar(sentencia, objetoSalida);
		} catch (Exception e) {
			objetoSalida.setCodError(CodError.ERROR_INTERNO);
			objetoSalida.setMsgError(e.getMessage());
		}

		return objetoSalida;

	}

	public ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_6_OE objetoEntrada) {

		ObjetoSalida objetoSalida = new ObjetoSalida();
		try {
			SentenciaDAO sentencia = new SentenciaDAO("PK_T013_CATEGCONTAMINA.Pr_ConsultarPorFiltro", objetoEntrada.getIdUsuario());
			List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
			parametros.add(new SentenciaParametroDAO("p_Filtro", objetoEntrada.getFiltro(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
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
