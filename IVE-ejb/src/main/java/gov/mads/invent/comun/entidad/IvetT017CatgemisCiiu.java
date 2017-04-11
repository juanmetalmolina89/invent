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
@Table(name = "IVET_T017_CATGEMIS_CIIU")
@NamedQueries({@NamedQuery(name = "IvetT017CatgemisCiiu.findAll", query = "SELECT i FROM IvetT017CatgemisCiiu i")})
public class IvetT017CatgemisCiiu implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "A017CODIGO")
    private Integer a017codigo;
    @Basic(optional = false)
    @Column(name = "A017ESTADOREGISTRO")
    private Character a017estadoregistro;
    @Column(name = "A017FECHACREACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a017fechacreacion;
    @Column(name = "A017FECHAMODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a017fechamodificacion;
    @Basic(optional = false)
    @Column(name = "A017USUARIOCREACION")
    private int a017usuariocreacion;
    @Column(name = "A017USUARIOMODIFICACION")
    private Integer a017usuariomodificacion;
    @JoinColumn(name = "A017CODCATEMISION", referencedColumnName = "A009CODIGO")
    @ManyToOne(optional = false)
    private IvetT009Categemision a017codcatemision;
    @JoinColumn(name = "A017IDCODCIIU", referencedColumnName = "A108CODIGO")
    @ManyToOne(optional = false)
    private PartT108Codigociiu a017idcodciiu;

    public IvetT017CatgemisCiiu() {

    }

    public IvetT017CatgemisCiiu(Integer a017codigo) {

        this.a017codigo = a017codigo;
    }

    public IvetT017CatgemisCiiu(Integer a017codigo, Character a017estadoregistro, int a017usuariocreacion) {

        this.a017codigo = a017codigo;
        this.a017estadoregistro = a017estadoregistro;
        this.a017usuariocreacion = a017usuariocreacion;
    }

    public Integer getA017codigo() {

        return a017codigo;
    }

    public void setA017codigo(Integer a017codigo) {

        this.a017codigo = a017codigo;
    }

    public Character getA017estadoregistro() {

        return a017estadoregistro;
    }

    public void setA017estadoregistro(Character a017estadoregistro) {

        this.a017estadoregistro = a017estadoregistro;
    }

    public Date getA017fechacreacion() {

        return a017fechacreacion;
    }

    public void setA017fechacreacion(Date a017fechacreacion) {

        this.a017fechacreacion = a017fechacreacion;
    }

    public Date getA017fechamodificacion() {

        return a017fechamodificacion;
    }

    public void setA017fechamodificacion(Date a017fechamodificacion) {

        this.a017fechamodificacion = a017fechamodificacion;
    }

    public int getA017usuariocreacion() {

        return a017usuariocreacion;
    }

    public void setA017usuariocreacion(int a017usuariocreacion) {

        this.a017usuariocreacion = a017usuariocreacion;
    }

    public Integer getA017usuariomodificacion() {

        return a017usuariomodificacion;
    }

    public void setA017usuariomodificacion(Integer a017usuariomodificacion) {

        this.a017usuariomodificacion = a017usuariomodificacion;
    }

    public IvetT009Categemision getA017codcatemision() {

        return a017codcatemision;
    }

    public void setA017codcatemision(IvetT009Categemision a017codcatemision) {

        this.a017codcatemision = a017codcatemision;
    }

    public PartT108Codigociiu getA017idcodciiu() {

        return a017idcodciiu;
    }

    public void setA017idcodciiu(PartT108Codigociiu a017idcodciiu) {

        this.a017idcodciiu = a017idcodciiu;
    }

    @Override
    public int hashCode() {

        int hash = 0;
        hash += (a017codigo != null ? a017codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof IvetT017CatgemisCiiu)) {
            return false;
        }
        IvetT017CatgemisCiiu other = (IvetT017CatgemisCiiu) object;
        if ((this.a017codigo == null && other.a017codigo != null) || (this.a017codigo != null && !this.a017codigo.equals(other.a017codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {

        return "gov.mads.invent.comun.entidad.IvetT017CatgemisCiiu[ a017codigo=" + a017codigo + " ]";
    }

}
