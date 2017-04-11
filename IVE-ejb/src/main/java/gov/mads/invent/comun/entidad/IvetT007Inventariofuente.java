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
@Table(name = "IVET_T007_INVENTARIOFUENTE")
@NamedQueries({@NamedQuery(name = "IvetT007Inventariofuente.findAll", query = "SELECT i FROM IvetT007Inventariofuente i")})
public class IvetT007Inventariofuente implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "A007CODIGO")
    private Integer a007codigo;
    @Basic(optional = false)
    @Column(name = "A007ESTADOREGISTRO")
    private Character a007estadoregistro;
    @Column(name = "A007FECHACREACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a007fechacreacion;
    @Column(name = "A007FECHAMODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a007fechamodificacion;
    @Basic(optional = false)
    @Column(name = "A007USUARIOCREACION")
    private int a007usuariocreacion;
    @Column(name = "A007USUARIOMODIFICACION")
    private Integer a007usuariomodificacion;
    @JoinColumn(name = "A007IDINVENTARIO", referencedColumnName = "A003CODIGO")
    @ManyToOne(optional = false)
    private IvetT003Inventario a007idinventario;
    @JoinColumn(name = "A007IDFUENTE", referencedColumnName = "A006CODIGO")
    @ManyToOne(optional = false)
    private IvetT006Fuente a007idfuente;

    public IvetT007Inventariofuente() {

    }

    public IvetT007Inventariofuente(Integer a007codigo) {

        this.a007codigo = a007codigo;
    }

    public IvetT007Inventariofuente(Integer a007codigo, Character a007estadoregistro, int a007usuariocreacion) {

        this.a007codigo = a007codigo;
        this.a007estadoregistro = a007estadoregistro;
        this.a007usuariocreacion = a007usuariocreacion;
    }

    public Integer getA007codigo() {

        return a007codigo;
    }

    public void setA007codigo(Integer a007codigo) {

        this.a007codigo = a007codigo;
    }

    public Character getA007estadoregistro() {

        return a007estadoregistro;
    }

    public void setA007estadoregistro(Character a007estadoregistro) {

        this.a007estadoregistro = a007estadoregistro;
    }

    public Date getA007fechacreacion() {

        return a007fechacreacion;
    }

    public void setA007fechacreacion(Date a007fechacreacion) {

        this.a007fechacreacion = a007fechacreacion;
    }

    public Date getA007fechamodificacion() {

        return a007fechamodificacion;
    }

    public void setA007fechamodificacion(Date a007fechamodificacion) {

        this.a007fechamodificacion = a007fechamodificacion;
    }

    public int getA007usuariocreacion() {

        return a007usuariocreacion;
    }

    public void setA007usuariocreacion(int a007usuariocreacion) {

        this.a007usuariocreacion = a007usuariocreacion;
    }

    public Integer getA007usuariomodificacion() {

        return a007usuariomodificacion;
    }

    public void setA007usuariomodificacion(Integer a007usuariomodificacion) {

        this.a007usuariomodificacion = a007usuariomodificacion;
    }

    public IvetT003Inventario getA007idinventario() {

        return a007idinventario;
    }

    public void setA007idinventario(IvetT003Inventario a007idinventario) {

        this.a007idinventario = a007idinventario;
    }

    public IvetT006Fuente getA007idfuente() {

        return a007idfuente;
    }

    public void setA007idfuente(IvetT006Fuente a007idfuente) {

        this.a007idfuente = a007idfuente;
    }

    @Override
    public int hashCode() {

        int hash = 0;
        hash += (a007codigo != null ? a007codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof IvetT007Inventariofuente)) {
            return false;
        }
        IvetT007Inventariofuente other = (IvetT007Inventariofuente) object;
        if ((this.a007codigo == null && other.a007codigo != null) || (this.a007codigo != null && !this.a007codigo.equals(other.a007codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {

        return "gov.mads.invent.comun.entidad.IvetT007Inventariofuente[ a007codigo=" + a007codigo + " ]";
    }

}
