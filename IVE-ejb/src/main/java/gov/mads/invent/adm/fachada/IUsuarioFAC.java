package gov.mads.invent.adm.fachada;

import gov.mads.invent.adm.vista.OE_Autenticar;
import gov.mads.invent.adm.vista.OE_ConsultarFuncionarios;
import gov.mads.invent.adm.vista.OS_ConsultarFuncionarios;
import gov.mads.invent.adm.vista.UsuarioOE;
import gov.mads.invent.comun.vista.BusquedaOE;
import gov.mads.invent.comun.vista.ObjetoSalida;

public interface IUsuarioFAC {

    ObjetoSalida validarUsuario(UsuarioOE objetoEntrada);

    ObjetoSalida registrarUsuario(UsuarioOE objetoEntrada);

    ObjetoSalida consultarUsuario(UsuarioOE objetoEntrada);

    ObjetoSalida consultarGrilla(BusquedaOE objetoEntrada);

    ObjetoSalida actualizarUsuario(UsuarioOE objetoEntrada);

    ObjetoSalida eliminarUsuario(UsuarioOE objetoEntrada);

    ObjetoSalida registrarUsuarioVital(OE_Autenticar OE);

    OS_ConsultarFuncionarios listarUsuarioVital(OE_ConsultarFuncionarios OE);

}
