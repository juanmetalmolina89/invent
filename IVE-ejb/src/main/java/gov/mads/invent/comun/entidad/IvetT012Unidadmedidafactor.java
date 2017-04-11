/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package gov.mads.invent.comun.entidad;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @author Jorge
 */
@Entity
@Table(name = "IVET_T012_UNIDADMEDIDAFACTOR")
@NamedQueries({@NamedQuery(name = "IvetT012Unidadmedidafactor.findAll", query = "SELECT i FROM IvetT012Unidadmedidafactor i")})
public class IvetT012Unidadmedidafactor implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "A012CODIGO")
    private Integer a012codigo;
    @Basic(optional = false)
    @Column(name = "A012UNIDADMEDIDA")
    private String a012unidadmedida;
    @Basic(optional = false)
    @Column(name = "A012ESTADOREGISTRO")
    private Character a012estadoregistro;
    @Column(name = "A012FECHACREACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a012fechacreacion;
    @Column(name = "A012FECHAMODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a012fechamodificacion;
    @Basic(optional = false)
    @Column(name = "A012USUARIOCREACION")
    private int a012usuariocreacion;
    @Column(name = "A012USUARIOMODIFICACION")
    private Integer a012usuariomodificacion;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a013undmedfactoremis")
    private List<IvetT013Categcontamina> ivetT013CategcontaminaList;

    public IvetT012Unidadmedidafactor() {

    }

    public IvetT012Unidadmedidafactor(Integer a012codigo) {

        this.a012codigo = a012codigo;
    }

    public IvetT012Unidadmedidafactor(Integer a012codigo, String a012unidadmedida, Character a012estadoregistro, int a012usuariocreacion) {

        this.a012codigo = a012codigo;
        this.a012unidadmedida = a012unidadmedida;
        this.a012estadoregistro = a012estadoregistro;
        this.a012usuariocreacion = a012usuariocreacion;
    }

    public Integer getA012codigo() {

        return a012codigo;
    }

    public void setA012codigo(Integer a012codigo) {

        this.a012codigo = a012codigo;
    }

    public String getA012unidadmedida() {

        return a012unidadmedida;
    }

    public void setA012unidadmedida(String a012unidadmedida) {

        this.a012unidadmedida = a012unidadmedida;
    }

    public Character getA012estadoregistro() {

        return a012estadoregistro;
    }

    public void setA012estadoregistro(Character a012estadoregistro) {

        this.a012estadoregistro = a012estadoregistro;
    }

    public Date getA012fechacreacion() {

        return a012fechacreacion;
    }

    public void setA012fechacreacion(Date a012fechacreacion) {

        this.a012fechacreacion = a012fechacreacion;
    }

    public Date getA012fechamodificacion() {

        return a012fechamodificacion;
    }

    public void setA012fechamodificacion(Date a012fechamodificacion) {

        this.a012fechamodificacion = a012fechamodificacion;
    }

    public int getA012usuariocreacion() {

        return a012usuariocreacion;
    }

    public void setA012usuariocreacion(int a012usuariocreacion) {

        this.a012usuariocreacion = a012usuariocreacion;
    }

    public Integer getA012usuariomodificacion() {

        return a012usuariomodificacion;
    }

    public void setA012usuariomodificacion(Integer a012usuariomodificacion) {

        this.a012usuariomodificacion = a012usuariomodificacion;
    }

    public List<IvetT013Categcontamina> getIvetT013CategcontaminaList() {

        return ivetT013CategcontaminaList;
    }

    public void setIvetT013CategcontaminaList(List<IvetT013Categcontamina> ivetT013CategcontaminaList) {

        this.ivetT013CategcontaminaList = ivetT013CategcontaminaList;
    }

    @Override
    public int hashCode() {

        int hash = 0;
        hash += (a012codigo != null ? a012codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof IvetT012Unidadmedidafactor)) {
            return false;
        }
        IvetT012Unidadmedidafactor other = (IvetT012Unidadmedidafactor) object;
        if ((this.a012codigo == null && other.a012codigo != null) || (this.a012codigo != null && !this.a012codigo.equals(other.a012codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {

        return "gov.mads.invent.comun.entidad.IvetT012Unidadmedidafactor[ a012codigo=" + a012codigo + " ]";
    }

}
