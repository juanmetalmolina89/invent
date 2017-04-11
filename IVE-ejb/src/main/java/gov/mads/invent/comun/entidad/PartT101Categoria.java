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
@Table(name = "PART_T101_CATEGORIA")
@NamedQueries({@NamedQuery(name = "PartT101Categoria.findAll", query = "SELECT p FROM PartT101Categoria p")})
public class PartT101Categoria implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "A101CODIGO")
    private Integer a101codigo;
    @Basic(optional = false)
    @Column(name = "A101NOMBRE")
    private String a101nombre;
    @Basic(optional = false)
    @Column(name = "A101ESTADOREGISTRO")
    private Character a101estadoregistro;
    @Column(name = "A101FECHACREACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a101fechacreacion;
    @Column(name = "A101FECHAMODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a101fechamodificacion;
    @Basic(optional = false)
    @Column(name = "A101USUARIOCREACION")
    private int a101usuariocreacion;
    @Column(name = "A101USUARIOMODIFICACION")
    private Integer a101usuariomodificacion;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a102categoria")
    private List<PartT102Lista> partT102ListaList;

    public PartT101Categoria() {

    }

    public PartT101Categoria(Integer a101codigo) {

        this.a101codigo = a101codigo;
    }

    public PartT101Categoria(Integer a101codigo, String a101nombre, Character a101estadoregistro, int a101usuariocreacion) {

        this.a101codigo = a101codigo;
        this.a101nombre = a101nombre;
        this.a101estadoregistro = a101estadoregistro;
        this.a101usuariocreacion = a101usuariocreacion;
    }

    public Integer getA101codigo() {

        return a101codigo;
    }

    public void setA101codigo(Integer a101codigo) {

        this.a101codigo = a101codigo;
    }

    public String getA101nombre() {

        return a101nombre;
    }

    public void setA101nombre(String a101nombre) {

        this.a101nombre = a101nombre;
    }

    public Character getA101estadoregistro() {

        return a101estadoregistro;
    }

    public void setA101estadoregistro(Character a101estadoregistro) {

        this.a101estadoregistro = a101estadoregistro;
    }

    public Date getA101fechacreacion() {

        return a101fechacreacion;
    }

    public void setA101fechacreacion(Date a101fechacreacion) {

        this.a101fechacreacion = a101fechacreacion;
    }

    public Date getA101fechamodificacion() {

        return a101fechamodificacion;
    }

    public void setA101fechamodificacion(Date a101fechamodificacion) {

        this.a101fechamodificacion = a101fechamodificacion;
    }

    public int getA101usuariocreacion() {

        return a101usuariocreacion;
    }

    public void setA101usuariocreacion(int a101usuariocreacion) {

        this.a101usuariocreacion = a101usuariocreacion;
    }

    public Integer getA101usuariomodificacion() {

        return a101usuariomodificacion;
    }

    public void setA101usuariomodificacion(Integer a101usuariomodificacion) {

        this.a101usuariomodificacion = a101usuariomodificacion;
    }

    public List<PartT102Lista> getPartT102ListaList() {

        return partT102ListaList;
    }

    public void setPartT102ListaList(List<PartT102Lista> partT102ListaList) {

        this.partT102ListaList = partT102ListaList;
    }

    @Override
    public int hashCode() {

        int hash = 0;
        hash += (a101codigo != null ? a101codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PartT101Categoria)) {
            return false;
        }
        PartT101Categoria other = (PartT101Categoria) object;
        if ((this.a101codigo == null && other.a101codigo != null) || (this.a101codigo != null && !this.a101codigo.equals(other.a101codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {

        return "gov.mads.invent.comun.entidad.PartT101Categoria[ a101codigo=" + a101codigo + " ]";
    }

}
