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
@Table(name = "DEBT_T900_NIVEL_SISTEMA")
@NamedQueries({@NamedQuery(name = "DebtT900NivelSistema.findAll", query = "SELECT d FROM DebtT900NivelSistema d")})
public class DebtT900NivelSistema implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "A900CODIGO")
    private Integer a900codigo;
    @Column(name = "A900DESCRIPCION")
    private String a900descripcion;
    @Column(name = "A900ESTADOREGISTRO")
    private Character a900estadoregistro;
    @Column(name = "A900FECHACREACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a900fechacreacion;
    @Column(name = "A900FECHAMODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a900fechamodificacion;
    @Column(name = "A900USUARIOCREACION")
    private BigInteger a900usuariocreacion;
    @Column(name = "A900USUARIOMODIFICACION")
    private BigInteger a900usuariomodificacion;

    public DebtT900NivelSistema() {

    }

    public DebtT900NivelSistema(Integer a900codigo) {

        this.a900codigo = a900codigo;
    }

    public Integer getA900codigo() {

        return a900codigo;
    }

    public void setA900codigo(Integer a900codigo) {

        this.a900codigo = a900codigo;
    }

    public String getA900descripcion() {

        return a900descripcion;
    }

    public void setA900descripcion(String a900descripcion) {

        this.a900descripcion = a900descripcion;
    }

    public Character getA900estadoregistro() {

        return a900estadoregistro;
    }

    public void setA900estadoregistro(Character a900estadoregistro) {

        this.a900estadoregistro = a900estadoregistro;
    }

    public Date getA900fechacreacion() {

        return a900fechacreacion;
    }

    public void setA900fechacreacion(Date a900fechacreacion) {

        this.a900fechacreacion = a900fechacreacion;
    }

    public Date getA900fechamodificacion() {

        return a900fechamodificacion;
    }

    public void setA900fechamodificacion(Date a900fechamodificacion) {

        this.a900fechamodificacion = a900fechamodificacion;
    }

    public BigInteger getA900usuariocreacion() {

        return a900usuariocreacion;
    }

    public void setA900usuariocreacion(BigInteger a900usuariocreacion) {

        this.a900usuariocreacion = a900usuariocreacion;
    }

    public BigInteger getA900usuariomodificacion() {

        return a900usuariomodificacion;
    }

    public void setA900usuariomodificacion(BigInteger a900usuariomodificacion) {

        this.a900usuariomodificacion = a900usuariomodificacion;
    }

    @Override
    public int hashCode() {

        int hash = 0;
        hash += (a900codigo != null ? a900codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DebtT900NivelSistema)) {
            return false;
        }
        DebtT900NivelSistema other = (DebtT900NivelSistema) object;
        if ((this.a900codigo == null && other.a900codigo != null) || (this.a900codigo != null && !this.a900codigo.equals(other.a900codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {

        return "gov.mads.invent.comun.entidad.DebtT900NivelSistema[ a900codigo=" + a900codigo + " ]";
    }

}
