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
@Table(name = "IVET_T004_GEOMETRIA")
@NamedQueries({@NamedQuery(name = "IvetT004Geometria.findAll", query = "SELECT i FROM IvetT004Geometria i")})
public class IvetT004Geometria implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "A004CODIGO")
    private Integer a004codigo;
    @Lob
    @Column(name = "A004GEOMETRIA")
    private String a004geometria;
    @Basic(optional = false)
    @Column(name = "A004ESTADOREGISTRO")
    private Character a004estadoregistro;
    @Column(name = "A004FECHACREACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a004fechacreacion;
    @Column(name = "A004FECHAMODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a004fechamodificacion;
    @Basic(optional = false)
    @Column(name = "A004USUARIOCREACION")
    private int a004usuariocreacion;
    @Column(name = "A004USUARIOMODIFICACION")
    private Integer a004usuariomodificacion;
    @JoinColumn(name = "A004IDINVENTARIO", referencedColumnName = "A003CODIGO")
    @ManyToOne(optional = false)
    private IvetT003Inventario a004idinventario;

    public IvetT004Geometria() {

    }

    public IvetT004Geometria(Integer a004codigo) {

        this.a004codigo = a004codigo;
    }

    public IvetT004Geometria(Integer a004codigo, Character a004estadoregistro, int a004usuariocreacion) {

        this.a004codigo = a004codigo;
        this.a004estadoregistro = a004estadoregistro;
        this.a004usuariocreacion = a004usuariocreacion;
    }

    public Integer getA004codigo() {

        return a004codigo;
    }

    public void setA004codigo(Integer a004codigo) {

        this.a004codigo = a004codigo;
    }

    public String getA004geometria() {

        return a004geometria;
    }

    public void setA004geometria(String a004geometria) {

        this.a004geometria = a004geometria;
    }

    public Character getA004estadoregistro() {

        return a004estadoregistro;
    }

    public void setA004estadoregistro(Character a004estadoregistro) {

        this.a004estadoregistro = a004estadoregistro;
    }

    public Date getA004fechacreacion() {

        return a004fechacreacion;
    }

    public void setA004fechacreacion(Date a004fechacreacion) {

        this.a004fechacreacion = a004fechacreacion;
    }

    public Date getA004fechamodificacion() {

        return a004fechamodificacion;
    }

    public void setA004fechamodificacion(Date a004fechamodificacion) {

        this.a004fechamodificacion = a004fechamodificacion;
    }

    public int getA004usuariocreacion() {

        return a004usuariocreacion;
    }

    public void setA004usuariocreacion(int a004usuariocreacion) {

        this.a004usuariocreacion = a004usuariocreacion;
    }

    public Integer getA004usuariomodificacion() {

        return a004usuariomodificacion;
    }

    public void setA004usuariomodificacion(Integer a004usuariomodificacion) {

        this.a004usuariomodificacion = a004usuariomodificacion;
    }

    public IvetT003Inventario getA004idinventario() {

        return a004idinventario;
    }

    public void setA004idinventario(IvetT003Inventario a004idinventario) {

        this.a004idinventario = a004idinventario;
    }

    @Override
    public int hashCode() {

        int hash = 0;
        hash += (a004codigo != null ? a004codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof IvetT004Geometria)) {
            return false;
        }
        IvetT004Geometria other = (IvetT004Geometria) object;
        if ((this.a004codigo == null && other.a004codigo != null) || (this.a004codigo != null && !this.a004codigo.equals(other.a004codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {

        return "gov.mads.invent.comun.entidad.IvetT004Geometria[ a004codigo=" + a004codigo + " ]";
    }

}
