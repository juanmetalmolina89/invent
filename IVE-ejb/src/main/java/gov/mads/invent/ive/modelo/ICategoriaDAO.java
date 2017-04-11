/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package gov.mads.invent.ive.modelo;

import gov.mads.invent.comun.vista.BusquedaOE;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.vista.CategoriaOE;
import gov.mads.invent.ive.vista.ContaminanteOE;

/**
 * @author carlosivan.rivera
 */
public interface ICategoriaDAO {

    ObjetoSalida registrarCategoria(CategoriaOE objetoEntrada);

    ObjetoSalida consultarCategoriaId(CategoriaOE objetoEntrada);

    ObjetoSalida actualizarCategoria(CategoriaOE objetoEntrada);

    ObjetoSalida listarCategoria(BusquedaOE objetoEntrada);

    ObjetoSalida consultarGrillaCat(BusquedaOE objetoEntrada);

    ObjetoSalida registrarContaminante(ContaminanteOE objetoEntrada);

    ObjetoSalida actualizarContaminante(ContaminanteOE objetoEntrada);

    ObjetoSalida consultarContaminanteId(ContaminanteOE objetoEntrada);

    ObjetoSalida consultarGrillaCon(BusquedaOE objetoEntrada);

    ObjetoSalida registrarCategoriaCombustible(Integer codigoCategoria, Integer codigoCombustible, Integer idUsuario);

    ObjetoSalida registrarCategoriaCIIU(Integer codigoCategoria, Integer codigoCIIU, Integer idUsuario);

    ObjetoSalida consultarCategoriaCodigoCIIU(CategoriaOE objetoEntrada);

    ObjetoSalida consultarCategoriaTipoCombustible(CategoriaOE objetoEntrada);

    ObjetoSalida eliminarCategoriaTipoCombustible(Integer codigoCombustible, Integer idUsuario);

    ObjetoSalida eliminarCategoriaCodigoCIIU(Integer codigoCIIU, Integer idUsuario);

    ObjetoSalida eliminarCategoria(CategoriaOE objetoEntrada);

    ObjetoSalida eliminarContaminante(ContaminanteOE objetoEntrada);
}
