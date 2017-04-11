package gov.mads.invent.ive.modelo.impl;
import gov.mads.invent.comun.modelo.GenericoDAO;
import gov.mads.invent.comun.modelo.SentenciaDAO;
import gov.mads.invent.comun.modelo.SentenciaParametroDAO;
import gov.mads.invent.comun.modelo.SentenciaTipoParametroDAO;
import gov.mads.invent.comun.vista.CodError;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.vista.Actualizar_7_OE;
import gov.mads.invent.ive.vista.ConsultarPorFiltro_7_OE;
import gov.mads.invent.ive.vista.Eliminar_7_OE;
import gov.mads.invent.ive.vista.Insertar_7_OE;
import oracle.jdbc.OracleTypes;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ivan Chacon
 */
public class CategEmisionDAO extends GenericoDAO { 

	public ObjetoSalida insertar(Insertar_7_OE objetoEntrada) {

		ObjetoSalida objetoSalida = new ObjetoSalida();
		try {
			SentenciaDAO sentencia = new SentenciaDAO("PK_T009_CATEGEMISION.Pr_Insertar", objetoEntrada.getIdUsuario());
			List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
			parametros.add(new SentenciaParametroDAO("p_A009NOMCATEMISION", objetoEntrada.getIvetT009Categemision().getA009nomcatemision(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A009DESCCATEMISION", objetoEntrada.getIvetT009Categemision().getA009desccatemision(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A009IDTIPOCATEMISION", objetoEntrada.getIvetT009Categemision().getA009idtipocatemision().getA102codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A009IDINVENTARIO", objetoEntrada.getIvetT009Categemision().getA009idinventario().getA003codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A009IDTIPOCOMBUSTIBLE", objetoEntrada.getIvetT009Categemision().getA009idtipocombustible().getA102codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
//			parametros.add(new SentenciaParametroDAO("p_A009CODIGOCIIU", objetoEntrada.getIvetT009Categemision().getA009codigociiu().getA108codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A009CILINDRAJE", objetoEntrada.getIvetT009Categemision().getA009cilindraje().intValue(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A009ANIOMODELO", objetoEntrada.getIvetT009Categemision().getA009aniomodelo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A009NROFUENTES", objetoEntrada.getIvetT009Categemision().getA009nrofuentes(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A009DETMETODFUENTES", objetoEntrada.getIvetT009Categemision().getA009detmetodfuentes(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A009IDMETODOEMISION", objetoEntrada.getIvetT009Categemision().getA009idmetodoemision().getA008codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A009OBSERVACION", objetoEntrada.getIvetT009Categemision().getA009observacion(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_idUsuario", objetoEntrada.getidUsuario(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			sentencia.setParametros(parametros);
			objetoSalida = this.ejecutar(sentencia, objetoSalida);
		} catch (Exception e) {
			objetoSalida.setCodError(CodError.ERROR_INTERNO);
			objetoSalida.setMsgError(e.getMessage());
		}

		return objetoSalida;

	}

	public ObjetoSalida eliminar(Eliminar_7_OE objetoEntrada) {

		ObjetoSalida objetoSalida = new ObjetoSalida();
		try {
			SentenciaDAO sentencia = new SentenciaDAO("PK_T009_CATEGEMISION.Pr_Eliminar", objetoEntrada.getIdUsuario());
			List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
			parametros.add(new SentenciaParametroDAO("p_A009CODIGO", objetoEntrada.getIvetT009Categemision().getA009codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_idUsuario", objetoEntrada.getidUsuario(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			sentencia.setParametros(parametros);
			objetoSalida = this.ejecutar(sentencia, objetoSalida);
		} catch (Exception e) {
			objetoSalida.setCodError(CodError.ERROR_INTERNO);
			objetoSalida.setMsgError(e.getMessage());
		}

		return objetoSalida;

	}

	public ObjetoSalida actualizar(Actualizar_7_OE objetoEntrada) {

		ObjetoSalida objetoSalida = new ObjetoSalida();
		try {
			SentenciaDAO sentencia = new SentenciaDAO("PK_T009_CATEGEMISION.Pr_Actualizar", objetoEntrada.getIdUsuario());
			List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
			parametros.add(new SentenciaParametroDAO("p_A009CODIGO", objetoEntrada.getIvetT009Categemision().getA009codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A009NOMCATEMISION", objetoEntrada.getIvetT009Categemision().getA009nomcatemision(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A009DESCCATEMISION", objetoEntrada.getIvetT009Categemision().getA009desccatemision(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A009IDTIPOCATEMISION", objetoEntrada.getIvetT009Categemision().getA009idtipocatemision().getA102codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A009IDINVENTARIO", objetoEntrada.getIvetT009Categemision().getA009idinventario().getA003codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A009IDTIPOCOMBUSTIBLE", objetoEntrada.getIvetT009Categemision().getA009idtipocombustible().getA102codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
//			parametros.add(new SentenciaParametroDAO("p_A009CODIGOCIIU", objetoEntrada.getIvetT009Categemision().getA009codigociiu().getA108codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A009CILINDRAJE", objetoEntrada.getIvetT009Categemision().getA009cilindraje().intValue(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A009ANIOMODELO", objetoEntrada.getIvetT009Categemision().getA009aniomodelo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A009NROFUENTES", objetoEntrada.getIvetT009Categemision().getA009nrofuentes(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A009DETMETODFUENTES", objetoEntrada.getIvetT009Categemision().getA009detmetodfuentes(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_A009IDMETODOEMISION", objetoEntrada.getIvetT009Categemision().getA009idmetodoemision().getA008codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			parametros.add(new SentenciaParametroDAO("p_A009OBSERVACION", objetoEntrada.getIvetT009Categemision().getA009observacion(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
			parametros.add(new SentenciaParametroDAO("p_idUsuario", objetoEntrada.getidUsuario(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
			sentencia.setParametros(parametros);
			objetoSalida = this.ejecutar(sentencia, objetoSalida);
		} catch (Exception e) {
			objetoSalida.setCodError(CodError.ERROR_INTERNO);
			objetoSalida.setMsgError(e.getMessage());
		}

		return objetoSalida;

	}

	public ObjetoSalida consultarPorFiltro(ConsultarPorFiltro_7_OE objetoEntrada) {

		ObjetoSalida objetoSalida = new ObjetoSalida();
		try {
			SentenciaDAO sentencia = new SentenciaDAO("PK_T009_CATEGEMISION.Pr_ConsultarPorFiltro", objetoEntrada.getIdUsuario());
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
