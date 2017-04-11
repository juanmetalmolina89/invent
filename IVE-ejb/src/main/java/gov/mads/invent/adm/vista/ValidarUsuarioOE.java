package gov.mads.invent.adm.vista;

import gov.mads.invent.comun.vista.ObjetoEntrada;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class ValidarUsuarioOE extends ObjetoEntrada {

    @XmlElement
    private String usuario;

    @XmlElement
    private String contrasena;

    public String getUsuario() {

        return usuario;
    }

    public void setUsuario(String usuario) {

        this.usuario = usuario;
    }

    public String getContrasena() {

        return contrasena;
    }

    public void setContrasena(String contrasena) {

        this.contrasena = contrasena;
    }
}