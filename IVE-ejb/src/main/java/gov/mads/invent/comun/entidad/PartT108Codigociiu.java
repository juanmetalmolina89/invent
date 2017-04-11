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
@Table(name = "PART_T108_CODIGOCIIU")
@NamedQueries({@NamedQuery(name = "PartT108Codigociiu.findAll", query = "SELECT p FROM PartT108Codigociiu p")})
public class PartT108Codigociiu implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "A108CODIGO")
    private Integer a108codigo;
    @Basic(optional = false)
    @Column(name = "A108CODIGOCIIU")
    private int a108codigociiu;
    @Column(name = "A108DESCRIPCIONCIIU")
    private String a108descripcionciiu;
    @Basic(optional = false)
    @Column(name = "A108ESTADOREGISTRO")
    private Character a108estadoregistro;
    @Column(name = "A108FECHACREACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a108fechacreacion;
    @Column(name = "A108FECHAMODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a108fechamodificacion;
    @Basic(optional = false)
    @Column(name = "A108USUARIOCREACION")
    private int a108usuariocreacion;
    @Column(name = "A108USUARIOMODIFICACION")
    private Integer a108usuariomodificacion;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a017idcodciiu")
    private List<IvetT017CatgemisCiiu> ivetT017CatgemisCiiuList;

    public PartT108Codigociiu() {

    }

    public PartT108Codigociiu(Integer a108codigo) {

        this.a108codigo = a108codigo;
    }

    public PartT108Codigociiu(Integer a108codigo, int a108codigociiu, Character a108estadoregistro, int a108usuariocreacion) {

        this.a108codigo = a108codigo;
        this.a108codigociiu = a108codigociiu;
        this.a108estadoregistro = a108estadoregistro;
        this.a108usuariocreacion = a108usuariocreacion;
    }

    public Integer getA108codigo() {

        return a108codigo;
    }

    public void setA108codigo(Integer a108codigo) {

        this.a108codigo = a108codigo;
    }

    public int getA108codigociiu() {

        return a108codigociiu;
    }

    public void setA108codigociiu(int a108codigociiu) {

        this.a108codigociiu = a108codigociiu;
    }

    public String getA108descripcionciiu() {

        return a108descripcionciiu;
    }

    public void setA108descripcionciiu(String a108descripcionciiu) {

        this.a108descripcionciiu = a108descripcionciiu;
    }

    public Character getA108estadoregistro() {

        return a108estadoregistro;
    }

    public void setA108estadoregistro(Character a108estadoregistro) {

        this.a108estadoregistro = a108estadoregistro;
    }

    public Date getA108fechacreacion() {

        return a108fechacreacion;
    }

    public void setA108fechacreacion(Date a108fechacreacion) {

        this.a108fechacreacion = a108fechacreacion;
    }

    public Date getA108fechamodificacion() {

        return a108fechamodificacion;
    }

    public void setA108fechamodificacion(Date a108fechamodificacion) {

        this.a108fechamodificacion = a108fechamodificacion;
    }

    public int getA108usuariocreacion() {

        return a108usuariocreacion;
    }

    public void setA108usuariocreacion(int a108usuariocreacion) {

        this.a108usuariocreacion = a108usuariocreacion;
    }

    public Integer getA108usuariomodificacion() {

        return a108usuariomodificacion;
    }

    public void setA108usuariomodificacion(Integer a108usuariomodificacion) {

        this.a108usuariomodificacion = a108usuariomodificacion;
    }

    public List<IvetT017CatgemisCiiu> getIvetT017CatgemisCiiuList() {

        return ivetT017CatgemisCiiuList;
    }

    public void setIvetT017CatgemisCiiuList(List<IvetT017CatgemisCiiu> ivetT017CatgemisCiiuList) {

        this.ivetT017CatgemisCiiuList = ivetT017CatgemisCiiuList;
    }

    @Override
    public int hashCode() {

        int hash = 0;
        hash += (a108codigo != null ? a108codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PartT108Codigociiu)) {
            return false;
        }
        PartT108Codigociiu other = (PartT108Codigociiu) object;
        if ((this.a108codigo == null && other.a108codigo != null) || (this.a108codigo != null && !this.a108codigo.equals(other.a108codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {

        return "gov.mads.invent.comun.entidad.PartT108Codigociiu[ a108codigo=" + a108codigo + " ]";
    }

}
