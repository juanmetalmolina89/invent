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
@Table(name = "SIST_T998_EXCEPCION")
@NamedQueries({@NamedQuery(name = "SistT998Excepcion.findAll", query = "SELECT s FROM SistT998Excepcion s")})
public class SistT998Excepcion implements Serializable {

    private static final long serialVersionUID = 1L;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Id
    @Basic(optional = false)
    @Column(name = "A998CODIGO")
    private BigDecimal a998codigo;
    @Column(name = "A998FECHAEXCEPCION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a998fechaexcepcion;
    @Column(name = "A998USUARIO")
    private BigInteger a998usuario;
    @Column(name = "A998PAQUETE")
    private String a998paquete;
    @Column(name = "A998PROCEDIMIENTO")
    private String a998procedimiento;
    @Column(name = "A998CODERROR")
    private BigInteger a998coderror;
    @Column(name = "A998MSJERROR")
    private String a998msjerror;
    @Column(name = "A998FECHACREACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a998fechacreacion;
    @Column(name = "A998FECHAMODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a998fechamodificacion;
    @Column(name = "A998USUARIOCREACION")
    private BigInteger a998usuariocreacion;
    @Column(name = "A998USUARIOMODIFICACION")
    private BigInteger a998usuariomodificacion;

    public SistT998Excepcion() {

    }

    public SistT998Excepcion(BigDecimal a998codigo) {

        this.a998codigo = a998codigo;
    }

    public BigDecimal getA998codigo() {

        return a998codigo;
    }

    public void setA998codigo(BigDecimal a998codigo) {

        this.a998codigo = a998codigo;
    }

    public Date getA998fechaexcepcion() {

        return a998fechaexcepcion;
    }

    public void setA998fechaexcepcion(Date a998fechaexcepcion) {

        this.a998fechaexcepcion = a998fechaexcepcion;
    }

    public BigInteger getA998usuario() {

        return a998usuario;
    }

    public void setA998usuario(BigInteger a998usuario) {

        this.a998usuario = a998usuario;
    }

    public String getA998paquete() {

        return a998paquete;
    }

    public void setA998paquete(String a998paquete) {

        this.a998paquete = a998paquete;
    }

    public String getA998procedimiento() {

        return a998procedimiento;
    }

    public void setA998procedimiento(String a998procedimiento) {

        this.a998procedimiento = a998procedimiento;
    }

    public BigInteger getA998coderror() {

        return a998coderror;
    }

    public void setA998coderror(BigInteger a998coderror) {

        this.a998coderror = a998coderror;
    }

    public String getA998msjerror() {

        return a998msjerror;
    }

    public void setA998msjerror(String a998msjerror) {

        this.a998msjerror = a998msjerror;
    }

    public Date getA998fechacreacion() {

        return a998fechacreacion;
    }

    public void setA998fechacreacion(Date a998fechacreacion) {

        this.a998fechacreacion = a998fechacreacion;
    }

    public Date getA998fechamodificacion() {

        return a998fechamodificacion;
    }

    public void setA998fechamodificacion(Date a998fechamodificacion) {

        this.a998fechamodificacion = a998fechamodificacion;
    }

    public BigInteger getA998usuariocreacion() {

        return a998usuariocreacion;
    }

    public void setA998usuariocreacion(BigInteger a998usuariocreacion) {

        this.a998usuariocreacion = a998usuariocreacion;
    }

    public BigInteger getA998usuariomodificacion() {

        return a998usuariomodificacion;
    }

    public void setA998usuariomodificacion(BigInteger a998usuariomodificacion) {

        this.a998usuariomodificacion = a998usuariomodificacion;
    }

    @Override
    public int hashCode() {

        int hash = 0;
        hash += (a998codigo != null ? a998codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof SistT998Excepcion)) {
            return false;
        }
        SistT998Excepcion other = (SistT998Excepcion) object;
        if ((this.a998codigo == null && other.a998codigo != null) || (this.a998codigo != null && !this.a998codigo.equals(other.a998codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {

        return "gov.mads.invent.comun.entidad.SistT998Excepcion[ a998codigo=" + a998codigo + " ]";
    }

}
