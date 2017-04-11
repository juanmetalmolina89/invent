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
@Table(name = "IVET_T005_CONTAMINANTE")
@NamedQueries({@NamedQuery(name = "IvetT005Contaminante.findAll", query = "SELECT i FROM IvetT005Contaminante i")})
public class IvetT005Contaminante implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "A005CODIGO")
    private Integer a005codigo;
    @Basic(optional = false)
    @Column(name = "A005CONTAMINANTE")
    private String a005contaminante;
    @Basic(optional = false)
    @Column(name = "A005SIGLACONTAMINANTE")
    private String a005siglacontaminante;
    @Basic(optional = false)
    @Column(name = "A005ESTADOREGISTRO")
    private Character a005estadoregistro;
    @Column(name = "A005FECHACREACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a005fechacreacion;
    @Column(name = "A005FECHAMODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a005fechamodificacion;
    @Basic(optional = false)
    @Column(name = "A005USUARIOCREACION")
    private int a005usuariocreacion;
    @Column(name = "A005USUARIOMODIFICACION")
    private Integer a005usuariomodificacion;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a013idcontaminante")
    private List<IvetT013Categcontamina> ivetT013CategcontaminaList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a016idcontaminante")
    private List<IvetT016Inventcontamina> ivetT016InventcontaminaList;

    public IvetT005Contaminante() {

    }

    public IvetT005Contaminante(Integer a005codigo) {

        this.a005codigo = a005codigo;
    }

    public IvetT005Contaminante(Integer a005codigo, String a005contaminante, String a005siglacontaminante, Character a005estadoregistro, int a005usuariocreacion) {

        this.a005codigo = a005codigo;
        this.a005contaminante = a005contaminante;
        this.a005siglacontaminante = a005siglacontaminante;
        this.a005estadoregistro = a005estadoregistro;
        this.a005usuariocreacion = a005usuariocreacion;
    }

    public Integer getA005codigo() {

        return a005codigo;
    }

    public void setA005codigo(Integer a005codigo) {

        this.a005codigo = a005codigo;
    }

    public String getA005contaminante() {

        return a005contaminante;
    }

    public void setA005contaminante(String a005contaminante) {

        this.a005contaminante = a005contaminante;
    }

    public String getA005siglacontaminante() {

        return a005siglacontaminante;
    }

    public void setA005siglacontaminante(String a005siglacontaminante) {

        this.a005siglacontaminante = a005siglacontaminante;
    }

    public Character getA005estadoregistro() {

        return a005estadoregistro;
    }

    public void setA005estadoregistro(Character a005estadoregistro) {

        this.a005estadoregistro = a005estadoregistro;
    }

    public Date getA005fechacreacion() {

        return a005fechacreacion;
    }

    public void setA005fechacreacion(Date a005fechacreacion) {

        this.a005fechacreacion = a005fechacreacion;
    }

    public Date getA005fechamodificacion() {

        return a005fechamodificacion;
    }

    public void setA005fechamodificacion(Date a005fechamodificacion) {

        this.a005fechamodificacion = a005fechamodificacion;
    }

    public int getA005usuariocreacion() {

        return a005usuariocreacion;
    }

    public void setA005usuariocreacion(int a005usuariocreacion) {

        this.a005usuariocreacion = a005usuariocreacion;
    }

    public Integer getA005usuariomodificacion() {

        return a005usuariomodificacion;
    }

    public void setA005usuariomodificacion(Integer a005usuariomodificacion) {

        this.a005usuariomodificacion = a005usuariomodificacion;
    }

    public List<IvetT013Categcontamina> getIvetT013CategcontaminaList() {

        return ivetT013CategcontaminaList;
    }

    public void setIvetT013CategcontaminaList(List<IvetT013Categcontamina> ivetT013CategcontaminaList) {

        this.ivetT013CategcontaminaList = ivetT013CategcontaminaList;
    }

    public List<IvetT016Inventcontamina> getIvetT016InventcontaminaList() {

        return ivetT016InventcontaminaList;
    }

    public void setIvetT016InventcontaminaList(List<IvetT016Inventcontamina> ivetT016InventcontaminaList) {

        this.ivetT016InventcontaminaList = ivetT016InventcontaminaList;
    }

    @Override
    public int hashCode() {

        int hash = 0;
        hash += (a005codigo != null ? a005codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof IvetT005Contaminante)) {
            return false;
        }
        IvetT005Contaminante other = (IvetT005Contaminante) object;
        if ((this.a005codigo == null && other.a005codigo != null) || (this.a005codigo != null && !this.a005codigo.equals(other.a005codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {

        return "gov.mads.invent.comun.entidad.IvetT005Contaminante[ a005codigo=" + a005codigo + " ]";
    }

}
