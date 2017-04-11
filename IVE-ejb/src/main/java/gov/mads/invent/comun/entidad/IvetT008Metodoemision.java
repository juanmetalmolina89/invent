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
@Table(name = "IVET_T008_METODOEMISION")
@NamedQueries({@NamedQuery(name = "IvetT008Metodoemision.findAll", query = "SELECT i FROM IvetT008Metodoemision i")})
public class IvetT008Metodoemision implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "A008CODIGO")
    private Integer a008codigo;
    @Basic(optional = false)
    @Column(name = "A008METODODETEMISION")
    private String a008metododetemision;
    @Basic(optional = false)
    @Column(name = "A008ESTADOREGISTRO")
    private Character a008estadoregistro;
    @Column(name = "A008FECHACREACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a008fechacreacion;
    @Column(name = "A008FECHAMODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a008fechamodificacion;
    @Basic(optional = false)
    @Column(name = "A008USUARIOCREACION")
    private int a008usuariocreacion;
    @Column(name = "A008USUARIOMODIFICACION")
    private Integer a008usuariomodificacion;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a009idmetodoemision")
    private List<IvetT009Categemision> ivetT009CategemisionList;

    public IvetT008Metodoemision() {

    }

    public IvetT008Metodoemision(Integer a008codigo) {

        this.a008codigo = a008codigo;
    }

    public IvetT008Metodoemision(Integer a008codigo, String a008metododetemision, Character a008estadoregistro, int a008usuariocreacion) {

        this.a008codigo = a008codigo;
        this.a008metododetemision = a008metododetemision;
        this.a008estadoregistro = a008estadoregistro;
        this.a008usuariocreacion = a008usuariocreacion;
    }

    public Integer getA008codigo() {

        return a008codigo;
    }

    public void setA008codigo(Integer a008codigo) {

        this.a008codigo = a008codigo;
    }

    public String getA008metododetemision() {

        return a008metododetemision;
    }

    public void setA008metododetemision(String a008metododetemision) {

        this.a008metododetemision = a008metododetemision;
    }

    public Character getA008estadoregistro() {

        return a008estadoregistro;
    }

    public void setA008estadoregistro(Character a008estadoregistro) {

        this.a008estadoregistro = a008estadoregistro;
    }

    public Date getA008fechacreacion() {

        return a008fechacreacion;
    }

    public void setA008fechacreacion(Date a008fechacreacion) {

        this.a008fechacreacion = a008fechacreacion;
    }

    public Date getA008fechamodificacion() {

        return a008fechamodificacion;
    }

    public void setA008fechamodificacion(Date a008fechamodificacion) {

        this.a008fechamodificacion = a008fechamodificacion;
    }

    public int getA008usuariocreacion() {

        return a008usuariocreacion;
    }

    public void setA008usuariocreacion(int a008usuariocreacion) {

        this.a008usuariocreacion = a008usuariocreacion;
    }

    public Integer getA008usuariomodificacion() {

        return a008usuariomodificacion;
    }

    public void setA008usuariomodificacion(Integer a008usuariomodificacion) {

        this.a008usuariomodificacion = a008usuariomodificacion;
    }

    public List<IvetT009Categemision> getIvetT009CategemisionList() {

        return ivetT009CategemisionList;
    }

    public void setIvetT009CategemisionList(List<IvetT009Categemision> ivetT009CategemisionList) {

        this.ivetT009CategemisionList = ivetT009CategemisionList;
    }

    @Override
    public int hashCode() {

        int hash = 0;
        hash += (a008codigo != null ? a008codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof IvetT008Metodoemision)) {
            return false;
        }
        IvetT008Metodoemision other = (IvetT008Metodoemision) object;
        if ((this.a008codigo == null && other.a008codigo != null) || (this.a008codigo != null && !this.a008codigo.equals(other.a008codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {

        return "gov.mads.invent.comun.entidad.IvetT008Metodoemision[ a008codigo=" + a008codigo + " ]";
    }

}
