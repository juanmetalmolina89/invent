/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package gov.mads.invent.comun.entidad;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;

/**
 * @author Jorge
 */
@Entity
@Table(name = "SIST_T999_MENSAJE_RESPUESTA")
@NamedQueries({@NamedQuery(name = "SistT999MensajeRespuesta.findAll", query = "SELECT s FROM SistT999MensajeRespuesta s")})
public class SistT999MensajeRespuesta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "A999CODIGO")
    private String a999codigo;
    @Column(name = "A999MENSAJE")
    private String a999mensaje;
    @Column(name = "A999ESTADOREGISTRO")
    private Character a999estadoregistro;
    @Column(name = "A999FECHACREACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a999fechacreacion;
    @Column(name = "A999FECHAMODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a999fechamodificacion;
    @Column(name = "A999USUARIOCREACION")
    private BigInteger a999usuariocreacion;
    @Column(name = "A999USUARIOMODIFICACION")
    private BigInteger a999usuariomodificacion;

    public SistT999MensajeRespuesta() {

    }

    public SistT999MensajeRespuesta(String a999codigo) {

        this.a999codigo = a999codigo;
    }

    public String getA999codigo() {

        return a999codigo;
    }

    public void setA999codigo(String a999codigo) {

        this.a999codigo = a999codigo;
    }

    public String getA999mensaje() {

        return a999mensaje;
    }

    public void setA999mensaje(String a999mensaje) {

        this.a999mensaje = a999mensaje;
    }

    public Character getA999estadoregistro() {

        return a999estadoregistro;
    }

    public void setA999estadoregistro(Character a999estadoregistro) {

        this.a999estadoregistro = a999estadoregistro;
    }

    public Date getA999fechacreacion() {

        return a999fechacreacion;
    }

    public void setA999fechacreacion(Date a999fechacreacion) {

        this.a999fechacreacion = a999fechacreacion;
    }

    public Date getA999fechamodificacion() {

        return a999fechamodificacion;
    }

    public void setA999fechamodificacion(Date a999fechamodificacion) {

        this.a999fechamodificacion = a999fechamodificacion;
    }

    public BigInteger getA999usuariocreacion() {

        return a999usuariocreacion;
    }

    public void setA999usuariocreacion(BigInteger a999usuariocreacion) {

        this.a999usuariocreacion = a999usuariocreacion;
    }

    public BigInteger getA999usuariomodificacion() {

        return a999usuariomodificacion;
    }

    public void setA999usuariomodificacion(BigInteger a999usuariomodificacion) {

        this.a999usuariomodificacion = a999usuariomodificacion;
    }

    @Override
    public int hashCode() {

        int hash = 0;
        hash += (a999codigo != null ? a999codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof SistT999MensajeRespuesta)) {
            return false;
        }
        SistT999MensajeRespuesta other = (SistT999MensajeRespuesta) object;
        if ((this.a999codigo == null && other.a999codigo != null) || (this.a999codigo != null && !this.a999codigo.equals(other.a999codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {

        return "gov.mads.invent.comun.entidad.SistT999MensajeRespuesta[ a999codigo=" + a999codigo + " ]";
    }

}
