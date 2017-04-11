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
@Table(name = "IVET_T006_FUENTE")
@NamedQueries({@NamedQuery(name = "IvetT006Fuente.findAll", query = "SELECT i FROM IvetT006Fuente i")})
public class IvetT006Fuente implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "A006CODIGO")
    private Integer a006codigo;
    @Basic(optional = false)
    @Column(name = "A006FUENTE")
    private String a006fuente;
    @Basic(optional = false)
    @Column(name = "A006ESTADOREGISTRO")
    private Character a006estadoregistro;
    @Column(name = "A006FECHACREACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a006fechacreacion;
    @Column(name = "A006FECHAMODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a006fechamodificacion;
    @Basic(optional = false)
    @Column(name = "A006USUARIOCREACION")
    private int a006usuariocreacion;
    @Column(name = "A006USUARIOMODIFICACION")
    private Integer a006usuariomodificacion;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a007idfuente")
    private List<IvetT007Inventariofuente> ivetT007InventariofuenteList;

    public IvetT006Fuente() {

    }

    public IvetT006Fuente(Integer a006codigo) {

        this.a006codigo = a006codigo;
    }

    public IvetT006Fuente(Integer a006codigo, String a006fuente, Character a006estadoregistro, int a006usuariocreacion) {

        this.a006codigo = a006codigo;
        this.a006fuente = a006fuente;
        this.a006estadoregistro = a006estadoregistro;
        this.a006usuariocreacion = a006usuariocreacion;
    }

    public Integer getA006codigo() {

        return a006codigo;
    }

    public void setA006codigo(Integer a006codigo) {

        this.a006codigo = a006codigo;
    }

    public String getA006fuente() {

        return a006fuente;
    }

    public void setA006fuente(String a006fuente) {

        this.a006fuente = a006fuente;
    }

    public Character getA006estadoregistro() {

        return a006estadoregistro;
    }

    public void setA006estadoregistro(Character a006estadoregistro) {

        this.a006estadoregistro = a006estadoregistro;
    }

    public Date getA006fechacreacion() {

        return a006fechacreacion;
    }

    public void setA006fechacreacion(Date a006fechacreacion) {

        this.a006fechacreacion = a006fechacreacion;
    }

    public Date getA006fechamodificacion() {

        return a006fechamodificacion;
    }

    public void setA006fechamodificacion(Date a006fechamodificacion) {

        this.a006fechamodificacion = a006fechamodificacion;
    }

    public int getA006usuariocreacion() {

        return a006usuariocreacion;
    }

    public void setA006usuariocreacion(int a006usuariocreacion) {

        this.a006usuariocreacion = a006usuariocreacion;
    }

    public Integer getA006usuariomodificacion() {

        return a006usuariomodificacion;
    }

    public void setA006usuariomodificacion(Integer a006usuariomodificacion) {

        this.a006usuariomodificacion = a006usuariomodificacion;
    }

    public List<IvetT007Inventariofuente> getIvetT007InventariofuenteList() {

        return ivetT007InventariofuenteList;
    }

    public void setIvetT007InventariofuenteList(List<IvetT007Inventariofuente> ivetT007InventariofuenteList) {

        this.ivetT007InventariofuenteList = ivetT007InventariofuenteList;
    }

    @Override
    public int hashCode() {

        int hash = 0;
        hash += (a006codigo != null ? a006codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof IvetT006Fuente)) {
            return false;
        }
        IvetT006Fuente other = (IvetT006Fuente) object;
        if ((this.a006codigo == null && other.a006codigo != null) || (this.a006codigo != null && !this.a006codigo.equals(other.a006codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {

        return "gov.mads.invent.comun.entidad.IvetT006Fuente[ a006codigo=" + a006codigo + " ]";
    }

}
