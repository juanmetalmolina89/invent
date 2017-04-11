/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package gov.mads.invent.comun.entidad;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * @author Jorge
 */
@Entity
@Table(name = "IVET_T010_CATEGCOMBUSTIBLE")
@NamedQueries({@NamedQuery(name = "IvetT010Categcombustible.findAll", query = "SELECT i FROM IvetT010Categcombustible i")})
public class IvetT010Categcombustible implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "A010CODIGO")
    private Integer a010codigo;
    @Basic(optional = false)
    @Column(name = "A010ESTADOREGISTRO")
    private Character a010estadoregistro;
    @Column(name = "A010FECHACREACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a010fechacreacion;
    @Column(name = "A010FECHAMODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a010fechamodificacion;
    @Basic(optional = false)
    @Column(name = "A010USUARIOCREACION")
    private int a010usuariocreacion;
    @Column(name = "A010USUARIOMODIFICACION")
    private Integer a010usuariomodificacion;
    @JoinColumn(name = "A010CODCATEMISION", referencedColumnName = "A009CODIGO")
    @ManyToOne(optional = false)
    private IvetT009Categemision a010codcatemision;
    @JoinColumn(name = "A010IDTIPOCOMBUSTIBLE", referencedColumnName = "A102CODIGO")
    @ManyToOne(optional = false)
    private PartT102Lista a010idtipocombustible;

    public IvetT010Categcombustible() {

    }

    public IvetT010Categcombustible(Integer a010codigo) {

        this.a010codigo = a010codigo;
    }

    public IvetT010Categcombustible(Integer a010codigo, Character a010estadoregistro, int a010usuariocreacion) {

        this.a010codigo = a010codigo;
        this.a010estadoregistro = a010estadoregistro;
        this.a010usuariocreacion = a010usuariocreacion;
    }

    public Integer getA010codigo() {

        return a010codigo;
    }

    public void setA010codigo(Integer a010codigo) {

        this.a010codigo = a010codigo;
    }

    public Character getA010estadoregistro() {

        return a010estadoregistro;
    }

    public void setA010estadoregistro(Character a010estadoregistro) {

        this.a010estadoregistro = a010estadoregistro;
    }

    public Date getA010fechacreacion() {

        return a010fechacreacion;
    }

    public void setA010fechacreacion(Date a010fechacreacion) {

        this.a010fechacreacion = a010fechacreacion;
    }

    public Date getA010fechamodificacion() {

        return a010fechamodificacion;
    }

    public void setA010fechamodificacion(Date a010fechamodificacion) {

        this.a010fechamodificacion = a010fechamodificacion;
    }

    public int getA010usuariocreacion() {

        return a010usuariocreacion;
    }

    public void setA010usuariocreacion(int a010usuariocreacion) {

        this.a010usuariocreacion = a010usuariocreacion;
    }

    public Integer getA010usuariomodificacion() {

        return a010usuariomodificacion;
    }

    public void setA010usuariomodificacion(Integer a010usuariomodificacion) {

        this.a010usuariomodificacion = a010usuariomodificacion;
    }

    public IvetT009Categemision getA010codcatemision() {

        return a010codcatemision;
    }

    public void setA010codcatemision(IvetT009Categemision a010codcatemision) {

        this.a010codcatemision = a010codcatemision;
    }

    public PartT102Lista getA010idtipocombustible() {

        return a010idtipocombustible;
    }

    public void setA010idtipocombustible(PartT102Lista a010idtipocombustible) {

        this.a010idtipocombustible = a010idtipocombustible;
    }

    @Override
    public int hashCode() {

        int hash = 0;
        hash += (a010codigo != null ? a010codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof IvetT010Categcombustible)) {
            return false;
        }
        IvetT010Categcombustible other = (IvetT010Categcombustible) object;
        if ((this.a010codigo == null && other.a010codigo != null) || (this.a010codigo != null && !this.a010codigo.equals(other.a010codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {

        return "gov.mads.invent.comun.entidad.IvetT010Categcombustible[ a010codigo=" + a010codigo + " ]";
    }

}
