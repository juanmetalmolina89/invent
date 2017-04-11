/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package gov.mads.invent.ive.fachada;

import gov.mads.invent.comun.vista.BusquedaOE;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.vista.CategoriaOE;
import gov.mads.invent.ive.vista.ContaminanteOE;

/**
 * @author carlosivan.rivera
 */
public interface ICategoriaFAC {

    ObjetoSalida registrarCategoria(CategoriaOE objetoEntrada);

    ObjetoSalida consultarCategoriaId(CategoriaOE objetoEntrada);

    ObjetoSalida actualizarCategoria(CategoriaOE objetoEntrada);

    ObjetoSalida listarCategoria(BusquedaOE objetoEntrada);

    ObjetoSalida consultarGrillaCat(BusquedaOE objetoEntrada);

    ObjetoSalida registrarContaminante(ContaminanteOE objetoEntrada);

    ObjetoSalida actualizarContaminante(ContaminanteOE objetoEntrada);

    ObjetoSalida consultarContaminanteId(ContaminanteOE objetoEntrada);

    ObjetoSalida consultarGrillaCon(BusquedaOE objetoEntrada);

    ObjetoSalida consultarCategoriaCodigoCIIU(CategoriaOE objetoEntrada);

    ObjetoSalida consultarCategoriaTipoCombustible(CategoriaOE objetoEntrada);

    ObjetoSalida eliminarCategoria(CategoriaOE objetoEntrada);

    ObjetoSalida eliminarContaminante(ContaminanteOE objetoEntrada);
}
