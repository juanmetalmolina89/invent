package gov.mads.invent.adm.vista;

import gov.mads.invent.comun.entidad.IvetT002Usuario;
import gov.mads.invent.comun.vista.ObjetoEntrada;

public class UsuarioOE extends ObjetoEntrada {

    private IvetT002Usuario usuario;

    public IvetT002Usuario getUsuario() {

        return usuario;
    }

    public void setUsuario(IvetT002Usuario usuario) {

        this.usuario = usuario;
    }
}