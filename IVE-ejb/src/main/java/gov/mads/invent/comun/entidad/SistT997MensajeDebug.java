/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package gov.mads.invent.comun.entidad;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;

/**
 * @author Jorge
 */
@Entity
@Table(name = "SIST_T997_MENSAJE_DEBUG")
@NamedQueries({@NamedQuery(name = "SistT997MensajeDebug.findAll", query = "SELECT s FROM SistT997MensajeDebug s")})
public class SistT997MensajeDebug implements Serializable {

    private static final long serialVersionUID = 1L;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Id
    @Basic(optional = false)
    @Column(name = "A997CODIGO")
    private BigDecimal a997codigo;
    @Column(name = "A997FECHAOPERACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a997fechaoperacion;
    @Column(name = "A997USUARIO")
    private BigInteger a997usuario;
    @Column(name = "A997PAQUETE")
    private String a997paquete;
    @Column(name = "A997PROCEDIMIENTO")
    private String a997procedimiento;
    @Column(name = "A997DESCRIPCION")
    private String a997descripcion;
    @Column(name = "A997NIVEL")
    private BigInteger a997nivel;

    public SistT997MensajeDebug() {

    }

    public SistT997MensajeDebug(BigDecimal a997codigo) {

        this.a997codigo = a997codigo;
    }

    public BigDecimal getA997codigo() {

        return a997codigo;
    }

    public void setA997codigo(BigDecimal a997codigo) {

        this.a997codigo = a997codigo;
    }

    public Date getA997fechaoperacion() {

        return a997fechaoperacion;
    }

    public void setA997fechaoperacion(Date a997fechaoperacion) {

        this.a997fechaoperacion = a997fechaoperacion;
    }

    public BigInteger getA997usuario() {

        return a997usuario;
    }

    public void setA997usuario(BigInteger a997usuario) {

        this.a997usuario = a997usuario;
    }

    public String getA997paquete() {

        return a997paquete;
    }

    public void setA997paquete(String a997paquete) {

        this.a997paquete = a997paquete;
    }

    public String getA997procedimiento() {

        return a997procedimiento;
    }

    public void setA997procedimiento(String a997procedimiento) {

        this.a997procedimiento = a997procedimiento;
    }

    public String getA997descripcion() {

        return a997descripcion;
    }

    public void setA997descripcion(String a997descripcion) {

        this.a997descripcion = a997descripcion;
    }

    public BigInteger getA997nivel() {

        return a997nivel;
    }

    public void setA997nivel(BigInteger a997nivel) {

        this.a997nivel = a997nivel;
    }

    @Override
    public int hashCode() {

        int hash = 0;
        hash += (a997codigo != null ? a997codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof SistT997MensajeDebug)) {
            return false;
        }
        SistT997MensajeDebug other = (SistT997MensajeDebug) object;
        if ((this.a997codigo == null && other.a997codigo != null) || (this.a997codigo != null && !this.a997codigo.equals(other.a997codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {

        return "gov.mads.invent.comun.entidad.SistT997MensajeDebug[ a997codigo=" + a997codigo + " ]";
    }

}
