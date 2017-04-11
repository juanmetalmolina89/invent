package gov.mads.invent.adm.modelo;

import gov.mads.invent.adm.vista.UsuarioOE;
import gov.mads.invent.comun.vista.BusquedaOE;
import gov.mads.invent.comun.vista.ObjetoSalida;

public interface IUsuarioDAO {

    ObjetoSalida validarUsuario(UsuarioOE objetoEntrada);

    ObjetoSalida registrarUsuario(UsuarioOE objetoEntrada);

    ObjetoSalida consultarUsuario(UsuarioOE objetoEntrada);

    ObjetoSalida consultarGrilla(BusquedaOE objetoEntrada);

    ObjetoSalida actualizarUsuario(UsuarioOE objetoEntrada);

    ObjetoSalida eliminarUsuario(UsuarioOE objetoEntrada);
    
    ObjetoSalida validarUsuarioVital(UsuarioOE objetoEntrada);
}
