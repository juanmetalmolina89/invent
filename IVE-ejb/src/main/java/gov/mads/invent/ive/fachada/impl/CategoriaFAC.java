/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package gov.mads.invent.ive.fachada.impl;

import gov.mads.invent.comun.entidad.IvetT010Categcombustible;
import gov.mads.invent.comun.entidad.IvetT017CatgemisCiiu;
import gov.mads.invent.comun.vista.BusquedaOE;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.fachada.ICategoriaFAC;
import gov.mads.invent.ive.modelo.ICategoriaDAO;
import gov.mads.invent.ive.modelo.impl.CategoriaDAO;
import gov.mads.invent.ive.vista.CategoriaOE;
import gov.mads.invent.ive.vista.ContaminanteOE;

import java.math.BigDecimal;
import java.util.HashMap;

/**
 * @author carlosivan.rivera
 */
public class CategoriaFAC implements ICategoriaFAC {

    private ICategoriaDAO accesoDatos;

    @Override
    public ObjetoSalida registrarCategoria(CategoriaOE objetoEntrada) {

        accesoDatos = new CategoriaDAO();
        ObjetoSalida objetoSalida = accesoDatos.registrarCategoria(objetoEntrada);
        objetoSalida.setMsgError(objetoSalida.getMsgError());

        if (objetoSalida.esRespuestaOperacionCorrecta()) {

            Integer codigoCategoria = ((BigDecimal) objetoSalida.getRespuesta().get(0).get("A009CODIGO")).intValue();

            for (IvetT010Categcombustible item : objetoEntrada.getCategoria().getIvetT010CategcombustibleList()) {
                ObjetoSalida objetoSalidaCombustible = accesoDatos.registrarCategoriaCombustible(codigoCategoria, item.getA010codigo(), objetoEntrada.getIdUsuario());
                if (!objetoSalidaCombustible.esRespuestaOperacionCorrecta()) {
                    objetoSalida.setMsgError(objetoSalida.getMsgError() + "<br><br>" + objetoSalidaCombustible.getMsgError());
                }
            }

            for (IvetT017CatgemisCiiu item : objetoEntrada.getCategoria().getIvetT017CatgemisCiiuList()) {
                ObjetoSalida objetoSalidaCIIU = accesoDatos.registrarCategoriaCIIU(codigoCategoria, item.getA017codigo(), objetoEntrada.getIdUsuario());
                if (!objetoSalidaCIIU.esRespuestaOperacionCorrecta()) {
                    objetoSalida.setMsgError(objetoSalida.getMsgError() + "<br><br>" + objetoSalidaCIIU.getMsgError());
                }
            }
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida consultarCategoriaId(CategoriaOE objetoEntrada) {

        accesoDatos = new CategoriaDAO();
        return accesoDatos.consultarCategoriaId(objetoEntrada);
    }

    @Override
    public ObjetoSalida actualizarCategoria(CategoriaOE objetoEntrada) {

        accesoDatos = new CategoriaDAO();
        ObjetoSalida objetoSalida = accesoDatos.actualizarCategoria(objetoEntrada);
        objetoSalida.setMsgError(objetoSalida.getMsgError());

        if (objetoSalida.esRespuestaOperacionCorrecta()) {

            Integer codigoCategoria = ((BigDecimal) objetoSalida.getRespuesta().get(0).get("A009CODIGO")).intValue();

            ObjetoSalida objetoSalidaCategoriaTipoCombustible = accesoDatos.consultarCategoriaTipoCombustible(objetoEntrada);
            if (objetoSalidaCategoriaTipoCombustible.esRespuestaOperacionCorrecta()) {
                for (HashMap<String, Object> item : objetoSalidaCategoriaTipoCombustible.getRespuesta()) {
                    accesoDatos.eliminarCategoriaTipoCombustible(((BigDecimal) item.get("A010CODIGO")).intValue(), objetoEntrada.getIdUsuario());
                }
            }
            for (IvetT010Categcombustible item : objetoEntrada.getCategoria().getIvetT010CategcombustibleList()) {
                ObjetoSalida objetoSalidaCombustible = accesoDatos.registrarCategoriaCombustible(codigoCategoria, item.getA010codigo(), objetoEntrada.getIdUsuario());
                if (!objetoSalidaCombustible.esRespuestaOperacionCorrecta()) {
                    objetoSalida.setMsgError(objetoSalida.getMsgError() + "<br><br>" + objetoSalidaCombustible.getMsgError());
                }
            }

            ObjetoSalida objetoSalidaCategoriaCodigoCIIU = accesoDatos.consultarCategoriaCodigoCIIU(objetoEntrada);
            if (objetoSalidaCategoriaCodigoCIIU.esRespuestaOperacionCorrecta()) {
                for (HashMap<String, Object> item : objetoSalidaCategoriaCodigoCIIU.getRespuesta()) {
                    accesoDatos.eliminarCategoriaCodigoCIIU(((BigDecimal) item.get("A017CODIGO")).intValue(), objetoEntrada.getIdUsuario());
                }
            }
            for (IvetT017CatgemisCiiu item : objetoEntrada.getCategoria().getIvetT017CatgemisCiiuList()) {
                ObjetoSalida objetoSalidaCIIU = accesoDatos.registrarCategoriaCIIU(codigoCategoria, item.getA017codigo(), objetoEntrada.getIdUsuario());
                if (!objetoSalidaCIIU.esRespuestaOperacionCorrecta()) {
                    objetoSalida.setMsgError(objetoSalida.getMsgError() + "<br><br>" + objetoSalidaCIIU.getMsgError());
                }
            }
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida listarCategoria(BusquedaOE objetoEntrada) {

        accesoDatos = new CategoriaDAO();
        return accesoDatos.listarCategoria(objetoEntrada);
    }

    @Override
    public ObjetoSalida consultarGrillaCat(BusquedaOE objetoEntrada) {

        accesoDatos = new CategoriaDAO();
        return accesoDatos.consultarGrillaCat(objetoEntrada);
    }

    @Override
    public ObjetoSalida registrarContaminante(ContaminanteOE objetoEntrada) {

        accesoDatos = new CategoriaDAO();
        return accesoDatos.registrarContaminante(objetoEntrada);
    }

    @Override
    public ObjetoSalida actualizarContaminante(ContaminanteOE objetoEntrada) {

        accesoDatos = new CategoriaDAO();
        return accesoDatos.actualizarContaminante(objetoEntrada);
    }

    @Override
    public ObjetoSalida consultarContaminanteId(ContaminanteOE objetoEntrada) {

        accesoDatos = new CategoriaDAO();
        return accesoDatos.consultarContaminanteId(objetoEntrada);
    }

    @Override
    public ObjetoSalida consultarGrillaCon(BusquedaOE objetoEntrada) {

        accesoDatos = new CategoriaDAO();
        return accesoDatos.consultarGrillaCon(objetoEntrada);
    }

    @Override
    public ObjetoSalida consultarCategoriaCodigoCIIU(CategoriaOE objetoEntrada) {

        accesoDatos = new CategoriaDAO();
        return accesoDatos.consultarCategoriaCodigoCIIU(objetoEntrada);
    }

    @Override
    public ObjetoSalida consultarCategoriaTipoCombustible(CategoriaOE objetoEntrada) {

        accesoDatos = new CategoriaDAO();
        return accesoDatos.consultarCategoriaTipoCombustible(objetoEntrada);
    }

    @Override
    public ObjetoSalida eliminarCategoria(CategoriaOE objetoEntrada) {

        accesoDatos = new CategoriaDAO();
        return accesoDatos.eliminarCategoria(objetoEntrada);
    }

    @Override
    public ObjetoSalida eliminarContaminante(ContaminanteOE objetoEntrada) {

        accesoDatos = new CategoriaDAO();
        return accesoDatos.eliminarContaminante(objetoEntrada);
    }
}
