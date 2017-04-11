/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package gov.mads.invent.ive.modelo.impl;

import gov.mads.invent.comun.modelo.GenericoDAO;
import gov.mads.invent.comun.modelo.SentenciaDAO;
import gov.mads.invent.comun.modelo.SentenciaParametroDAO;
import gov.mads.invent.comun.modelo.SentenciaTipoParametroDAO;
import gov.mads.invent.comun.vista.BusquedaOE;
import gov.mads.invent.comun.vista.CodError;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.modelo.ICategoriaDAO;
import gov.mads.invent.ive.vista.CategoriaOE;
import gov.mads.invent.ive.vista.ContaminanteOE;
import oracle.jdbc.OracleTypes;

import java.util.ArrayList;
import java.util.List;

/**
 * @author carlosivan.rivera
 */
public class CategoriaDAO extends GenericoDAO implements ICategoriaDAO {

    @Override
    public ObjetoSalida registrarCategoria(CategoriaOE objetoEntrada) {

        ObjetoSalida objetoSalida = new ObjetoSalida();
        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_CATEGORIA.Pr_RegistrarCategoria", objetoEntrada.getIdUsuario());
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("P_A009NOMCATEMISION", objetoEntrada.getCategoria().getA009nomcatemision(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("P_A009DESCCATEMISION", objetoEntrada.getCategoria().getA009desccatemision(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("P_A009IDTIPOCATEMISION", objetoEntrada.getCategoria().getA009idtipocatemision().getA102codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("P_A009IDINVENTARIO", objetoEntrada.getCategoria().getA009idinventario().getA003codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("P_A009IDTIPOCOMBUSTIBLE", 1, SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));//TODO Eliminar Parametro
            parametros.add(new SentenciaParametroDAO("P_A009CILINDRAJE", objetoEntrada.getCategoria().getA009cilindraje(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("P_A009ANIOMODELO", objetoEntrada.getCategoria().getA009aniomodelo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("P_A009NROFUENTES", objetoEntrada.getCategoria().getA009nrofuentes(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("P_A009DETMETODFUENTES", objetoEntrada.getCategoria().getA009detmetodfuentes(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("P_A009IDMETODOEMISION", objetoEntrada.getCategoria().getA009idmetodoemision().getA008codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("P_A009OBSERVACION", objetoEntrada.getCategoria().getA009observacion(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));

            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida consultarCategoriaId(CategoriaOE objetoEntrada) {

        ObjetoSalida objetoSalida = new ObjetoSalida();
        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_CATEGORIA.Pr_ConsultarCategoriaId", objetoEntrada.getIdUsuario());
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A009CODIGO", objetoEntrada.getCategoria().getA009codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));

            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;

    }

    @Override
    public ObjetoSalida actualizarCategoria(CategoriaOE objetoEntrada) {

        ObjetoSalida objetoSalida = new ObjetoSalida();
        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_CATEGORIA.Pr_ActualizarCategoria", objetoEntrada.getIdUsuario());
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();

            parametros.add(new SentenciaParametroDAO("P_A009CODIGO", objetoEntrada.getCategoria().getA009codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("P_A009NOMCATEMISION", objetoEntrada.getCategoria().getA009nomcatemision(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("P_A009DESCCATEMISION", objetoEntrada.getCategoria().getA009desccatemision(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("P_A009IDTIPOCATEMISION", objetoEntrada.getCategoria().getA009idtipocatemision().getA102codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("P_A009IDINVENTARIO", objetoEntrada.getCategoria().getA009idinventario().getA003codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("P_A009IDTIPOCOMBUSTIBLE", 1, SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));//TODO Eliminar Parametro
            parametros.add(new SentenciaParametroDAO("P_A009CILINDRAJE", objetoEntrada.getCategoria().getA009cilindraje(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("P_A009ANIOMODELO", objetoEntrada.getCategoria().getA009aniomodelo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("P_A009NROFUENTES", objetoEntrada.getCategoria().getA009nrofuentes(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("P_A009DETMETODFUENTES", objetoEntrada.getCategoria().getA009detmetodfuentes(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("P_A009IDMETODOEMISION", objetoEntrada.getCategoria().getA009idmetodoemision().getA008codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("P_A009OBSERVACION", objetoEntrada.getCategoria().getA009observacion(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));

            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);


        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida listarCategoria(BusquedaOE objetoEntrada) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_CATEGORIA.Pr_ListarCategoria", objetoEntrada.getIdUsuario());
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_Filtro", objetoEntrada.getPalabraClave(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida consultarGrillaCat(BusquedaOE objetoEntrada) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_CATEGORIA.Pr_ConsultarGrillaCat", objetoEntrada.getIdUsuario());
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
    public ObjetoSalida registrarContaminante(ContaminanteOE objetoEntrada) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_CATEGORIA.Pr_RegistrarContaminante", objetoEntrada.getIdUsuario());
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A013IDCATEGORIAEMISION", objetoEntrada.getContaminante().getA013idcategoriaemision().getA009codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A013IDCONTAMINANTE", objetoEntrada.getContaminante().getA013idcontaminante().getA005codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A013VALORCONTAMINANTE", objetoEntrada.getContaminante().getA013valorcontaminante(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A013FACTORACTIVIDAD", objetoEntrada.getContaminante().getA013factoractividad(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A013UNDMEDFACTORACTIV", objetoEntrada.getContaminante().getA013undmedfactoractiv().getA011codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A013FTEMETDFACTORACTIV", objetoEntrada.getContaminante().getA013ftemetdfactoractiv(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_A013FACTOREMISION", objetoEntrada.getContaminante().getA013factoremision(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A013UNDMEDFACTOREMIS", objetoEntrada.getContaminante().getA013undmedfactoremis().getA012codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A013FTEMETDFACTOREMIS", objetoEntrada.getContaminante().getA013ftemetdfactoremis(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida actualizarContaminante(ContaminanteOE objetoEntrada) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_CATEGORIA.Pr_ActualizarContaminante", objetoEntrada.getIdUsuario());
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A013CODIGO", objetoEntrada.getContaminante().getA013codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A013IDCATEGORIAEMISION", objetoEntrada.getContaminante().getA013idcategoriaemision().getA009codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A013IDCONTAMINANTE", objetoEntrada.getContaminante().getA013idcontaminante().getA005codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A013VALORCONTAMINANTE", objetoEntrada.getContaminante().getA013valorcontaminante(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A013FACTORACTIVIDAD", objetoEntrada.getContaminante().getA013factoractividad(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A013UNDMEDFACTORACTIV", objetoEntrada.getContaminante().getA013undmedfactoractiv().getA011codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A013FTEMETDFACTORACTIV", objetoEntrada.getContaminante().getA013ftemetdfactoractiv(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_A013FACTOREMISION", objetoEntrada.getContaminante().getA013factoremision(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A013UNDMEDFACTOREMIS", objetoEntrada.getContaminante().getA013undmedfactoremis().getA012codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A013FTEMETDFACTOREMIS", objetoEntrada.getContaminante().getA013ftemetdfactoremis(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.VARCHAR));
            parametros.add(new SentenciaParametroDAO("p_A013EMISIONTOTAL", objetoEntrada.getContaminante().getA013emisiontotal(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida consultarContaminanteId(ContaminanteOE objetoEntrada) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_CATEGORIA.Pr_ConsultarContaminanteId", objetoEntrada.getIdUsuario());
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A013IDCATEGORIAEMISION", objetoEntrada.getContaminante().getA013idcategoriaemision().getA009codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida consultarGrillaCon(BusquedaOE objetoEntrada) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_CATEGORIA.Pr_ConsultarGrillaCon", objetoEntrada.getIdUsuario());
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
    public ObjetoSalida registrarCategoriaCombustible(Integer codigoCategoria, Integer codigoCombustible, Integer idUsuario) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_CATEGORIA.Pr_RegistrarCatCombustible", idUsuario);
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A010CODCATEMISION", codigoCategoria, SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A010IDTIPOCOMBUSTIBLE", codigoCombustible, SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida registrarCategoriaCIIU(Integer codigoCategoria, Integer codigoCIIU, Integer idUsuario) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_CATEGORIA.Pr_RegistrarCatCIIU", idUsuario);
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A017CODCATEMISION", codigoCategoria, SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            parametros.add(new SentenciaParametroDAO("p_A017IDCODCIIU", codigoCIIU, SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida consultarCategoriaCodigoCIIU(CategoriaOE objetoEntrada) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {
            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_CATEGORIA.Pr_ConsultarCIIU", objetoEntrada.getIdUsuario());
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A017CODCATEMISION", objetoEntrada.getCategoria().getA009codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida consultarCategoriaTipoCombustible(CategoriaOE objetoEntrada) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {
            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_CATEGORIA.Pr_ConsultarCatCombustible", objetoEntrada.getIdUsuario());
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A010CODCATEMISION", objetoEntrada.getCategoria().getA009codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida eliminarCategoriaTipoCombustible(Integer codigoCombustible, Integer idUsuario) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_CATEGORIA.Pr_EliminarCatCombustible", idUsuario);
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A010CODIGO", codigoCombustible, SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida eliminarCategoriaCodigoCIIU(Integer codigoCIIU, Integer idUsuario) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_CATEGORIA.Pr_EliminarCatCIIU", idUsuario);
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A017CODIGO", codigoCIIU, SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));
            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida eliminarCategoria(CategoriaOE objetoEntrada) {

        ObjetoSalida objetoSalida = new ObjetoSalida();
        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_CATEGORIA.Pr_EliminarCategoria", objetoEntrada.getIdUsuario());
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A009CODIGO", objetoEntrada.getCategoria().getA009codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));

            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida eliminarContaminante(ContaminanteOE objetoEntrada) {

        ObjetoSalida objetoSalida = new ObjetoSalida();
        try {

            SentenciaDAO sentencia = new SentenciaDAO("PK_IVE_CATEGORIA.Pr_EliminarContaminante", objetoEntrada.getIdUsuario());
            List<SentenciaParametroDAO> parametros = new ArrayList<SentenciaParametroDAO>();
            parametros.add(new SentenciaParametroDAO("p_A013CODIGO", objetoEntrada.getContaminante().getA013codigo(), SentenciaTipoParametroDAO.ENTRADA, OracleTypes.NUMBER));

            sentencia.setParametros(parametros);
            objetoSalida = this.ejecutar(sentencia, objetoSalida);

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }
}
