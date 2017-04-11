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
@Table(name = "DEBT_T901_NIVEL_PROCEDIMIENTO")
@NamedQueries({@NamedQuery(name = "DebtT901NivelProcedimiento.findAll", query = "SELECT d FROM DebtT901NivelProcedimiento d")})
public class DebtT901NivelProcedimiento implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "A901CODIGO")
    private Integer a901codigo;
    @Column(name = "A901PAQUETE")
    private String a901paquete;
    @Column(name = "A901PROCEDIMIENTO")
    private String a901procedimiento;
    @Column(name = "A901ESTADOREGISTRO")
    private Character a901estadoregistro;
    @Column(name = "A901FECHACREACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a901fechacreacion;
    @Column(name = "A901FECHAMODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a901fechamodificacion;
    @Column(name = "A901USUARIOCREACION")
    private BigInteger a901usuariocreacion;
    @Column(name = "A901USUARIOMODIFICACION")
    private BigInteger a901usuariomodificacion;

    public DebtT901NivelProcedimiento() {

    }

    public DebtT901NivelProcedimiento(Integer a901codigo) {

        this.a901codigo = a901codigo;
    }

    public Integer getA901codigo() {

        return a901codigo;
    }

    public void setA901codigo(Integer a901codigo) {

        this.a901codigo = a901codigo;
    }

    public String getA901paquete() {

        return a901paquete;
    }

    public void setA901paquete(String a901paquete) {

        this.a901paquete = a901paquete;
    }

    public String getA901procedimiento() {

        return a901procedimiento;
    }

    public void setA901procedimiento(String a901procedimiento) {

        this.a901procedimiento = a901procedimiento;
    }

    public Character getA901estadoregistro() {

        return a901estadoregistro;
    }

    public void setA901estadoregistro(Character a901estadoregistro) {

        this.a901estadoregistro = a901estadoregistro;
    }

    public Date getA901fechacreacion() {

        return a901fechacreacion;
    }

    public void setA901fechacreacion(Date a901fechacreacion) {

        this.a901fechacreacion = a901fechacreacion;
    }

    public Date getA901fechamodificacion() {

        return a901fechamodificacion;
    }

    public void setA901fechamodificacion(Date a901fechamodificacion) {

        this.a901fechamodificacion = a901fechamodificacion;
    }

    public BigInteger getA901usuariocreacion() {

        return a901usuariocreacion;
    }

    public void setA901usuariocreacion(BigInteger a901usuariocreacion) {

        this.a901usuariocreacion = a901usuariocreacion;
    }

    public BigInteger getA901usuariomodificacion() {

        return a901usuariomodificacion;
    }

    public void setA901usuariomodificacion(BigInteger a901usuariomodificacion) {

        this.a901usuariomodificacion = a901usuariomodificacion;
    }

    @Override
    public int hashCode() {

        int hash = 0;
        hash += (a901codigo != null ? a901codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DebtT901NivelProcedimiento)) {
            return false;
        }
        DebtT901NivelProcedimiento other = (DebtT901NivelProcedimiento) object;
        if ((this.a901codigo == null && other.a901codigo != null) || (this.a901codigo != null && !this.a901codigo.equals(other.a901codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {

        return "gov.mads.invent.comun.entidad.DebtT901NivelProcedimiento[ a901codigo=" + a901codigo + " ]";
    }

}
