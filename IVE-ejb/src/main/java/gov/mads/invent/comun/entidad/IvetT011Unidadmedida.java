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
@Table(name = "IVET_T011_UNIDADMEDIDA")
@NamedQueries({@NamedQuery(name = "IvetT011Unidadmedida.findAll", query = "SELECT i FROM IvetT011Unidadmedida i")})
public class IvetT011Unidadmedida implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "A011CODIGO")
    private Integer a011codigo;
    @Column(name = "A011UNIDADMEDIDA")
    private String a011unidadmedida;
    @Basic(optional = false)
    @Column(name = "A011ESTADOREGISTRO")
    private Character a011estadoregistro;
    @Column(name = "A011FECHACREACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a011fechacreacion;
    @Column(name = "A011FECHAMODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a011fechamodificacion;
    @Basic(optional = false)
    @Column(name = "A011USUARIOCREACION")
    private int a011usuariocreacion;
    @Column(name = "A011USUARIOMODIFICACION")
    private Integer a011usuariomodificacion;
    @OneToMany(mappedBy = "a013undmedfactoractiv")
    private List<IvetT013Categcontamina> ivetT013CategcontaminaList;

    public IvetT011Unidadmedida() {

    }

    public IvetT011Unidadmedida(Integer a011codigo) {

        this.a011codigo = a011codigo;
    }

    public IvetT011Unidadmedida(Integer a011codigo, Character a011estadoregistro, int a011usuariocreacion) {

        this.a011codigo = a011codigo;
        this.a011estadoregistro = a011estadoregistro;
        this.a011usuariocreacion = a011usuariocreacion;
    }

    public Integer getA011codigo() {

        return a011codigo;
    }

    public void setA011codigo(Integer a011codigo) {

        this.a011codigo = a011codigo;
    }

    public String getA011unidadmedida() {

        return a011unidadmedida;
    }

    public void setA011unidadmedida(String a011unidadmedida) {

        this.a011unidadmedida = a011unidadmedida;
    }

    public Character getA011estadoregistro() {

        return a011estadoregistro;
    }

    public void setA011estadoregistro(Character a011estadoregistro) {

        this.a011estadoregistro = a011estadoregistro;
    }

    public Date getA011fechacreacion() {

        return a011fechacreacion;
    }

    public void setA011fechacreacion(Date a011fechacreacion) {

        this.a011fechacreacion = a011fechacreacion;
    }

    public Date getA011fechamodificacion() {

        return a011fechamodificacion;
    }

    public void setA011fechamodificacion(Date a011fechamodificacion) {

        this.a011fechamodificacion = a011fechamodificacion;
    }

    public int getA011usuariocreacion() {

        return a011usuariocreacion;
    }

    public void setA011usuariocreacion(int a011usuariocreacion) {

        this.a011usuariocreacion = a011usuariocreacion;
    }

    public Integer getA011usuariomodificacion() {

        return a011usuariomodificacion;
    }

    public void setA011usuariomodificacion(Integer a011usuariomodificacion) {

        this.a011usuariomodificacion = a011usuariomodificacion;
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
        hash += (a011codigo != null ? a011codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof IvetT011Unidadmedida)) {
            return false;
        }
        IvetT011Unidadmedida other = (IvetT011Unidadmedida) object;
        if ((this.a011codigo == null && other.a011codigo != null) || (this.a011codigo != null && !this.a011codigo.equals(other.a011codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {

        return "gov.mads.invent.comun.entidad.IvetT011Unidadmedida[ a011codigo=" + a011codigo + " ]";
    }

}
