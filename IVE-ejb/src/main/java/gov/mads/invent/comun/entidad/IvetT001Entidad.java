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
@Table(name = "IVET_T001_ENTIDAD")
@NamedQueries({@NamedQuery(name = "IvetT001Entidad.findAll", query = "SELECT i FROM IvetT001Entidad i")})
public class IvetT001Entidad implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "A001CODIGO")
    private Integer a001codigo;
    @Basic(optional = false)
    @Column(name = "A001SIGLAAUTAMB")
    private String a001siglaautamb;
    @Basic(optional = false)
    @Column(name = "A001NOMBREAUTAMB")
    private String a001nombreautamb;
    @Basic(optional = false)
    @Column(name = "A001ESTADOREGISTRO")
    private Character a001estadoregistro;
    @Column(name = "A001FECHACREACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a001fechacreacion;
    @Column(name = "A001FECHAMODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a001fechamodificacion;
    @Basic(optional = false)
    @Column(name = "A001USUARIOCREACION")
    private int a001usuariocreacion;
    @Column(name = "A001USUARIOMODIFICACION")
    private Integer a001usuariomodificacion;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a003idusuarioregistro")
    private List<Ivev002Inventario> ivev002InventarioList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a002autoridadambiental")
    private List<IvetT002Usuario> ivetT002UsuarioList;
    @JoinColumn(name = "A001CODDIVIPOLA", referencedColumnName = "A105CODIGO")
    @ManyToOne(optional = false)
    private PartT105Divipola a001coddivipola;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a002autoridadambiental")
    private List<Ivev001Usuario> ivev001UsuarioList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a003idusuarioregistro")
    private List<IvetT003Inventario> ivetT003InventarioList;

    public IvetT001Entidad() {

    }

    public IvetT001Entidad(Integer a001codigo) {

        this.a001codigo = a001codigo;
    }

    public IvetT001Entidad(Integer a001codigo, String a001siglaautamb, String a001nombreautamb, Character a001estadoregistro, int a001usuariocreacion) {

        this.a001codigo = a001codigo;
        this.a001siglaautamb = a001siglaautamb;
        this.a001nombreautamb = a001nombreautamb;
        this.a001estadoregistro = a001estadoregistro;
        this.a001usuariocreacion = a001usuariocreacion;
    }

    public Integer getA001codigo() {

        return a001codigo;
    }

    public void setA001codigo(Integer a001codigo) {

        this.a001codigo = a001codigo;
    }

    public String getA001siglaautamb() {

        return a001siglaautamb;
    }

    public void setA001siglaautamb(String a001siglaautamb) {

        this.a001siglaautamb = a001siglaautamb;
    }

    public String getA001nombreautamb() {

        return a001nombreautamb;
    }

    public void setA001nombreautamb(String a001nombreautamb) {

        this.a001nombreautamb = a001nombreautamb;
    }

    public Character getA001estadoregistro() {

        return a001estadoregistro;
    }

    public void setA001estadoregistro(Character a001estadoregistro) {

        this.a001estadoregistro = a001estadoregistro;
    }

    public Date getA001fechacreacion() {

        return a001fechacreacion;
    }

    public void setA001fechacreacion(Date a001fechacreacion) {

        this.a001fechacreacion = a001fechacreacion;
    }

    public Date getA001fechamodificacion() {

        return a001fechamodificacion;
    }

    public void setA001fechamodificacion(Date a001fechamodificacion) {

        this.a001fechamodificacion = a001fechamodificacion;
    }

    public int getA001usuariocreacion() {

        return a001usuariocreacion;
    }

    public void setA001usuariocreacion(int a001usuariocreacion) {

        this.a001usuariocreacion = a001usuariocreacion;
    }

    public Integer getA001usuariomodificacion() {

        return a001usuariomodificacion;
    }

    public void setA001usuariomodificacion(Integer a001usuariomodificacion) {

        this.a001usuariomodificacion = a001usuariomodificacion;
    }

    public List<Ivev002Inventario> getIvev002InventarioList() {

        return ivev002InventarioList;
    }

    public void setIvev002InventarioList(List<Ivev002Inventario> ivev002InventarioList) {

        this.ivev002InventarioList = ivev002InventarioList;
    }

    public List<IvetT002Usuario> getIvetT002UsuarioList() {

        return ivetT002UsuarioList;
    }

    public void setIvetT002UsuarioList(List<IvetT002Usuario> ivetT002UsuarioList) {

        this.ivetT002UsuarioList = ivetT002UsuarioList;
    }

    public PartT105Divipola getA001coddivipola() {

        return a001coddivipola;
    }

    public void setA001coddivipola(PartT105Divipola a001coddivipola) {

        this.a001coddivipola = a001coddivipola;
    }

    public List<Ivev001Usuario> getIvev001UsuarioList() {

        return ivev001UsuarioList;
    }

    public void setIvev001UsuarioList(List<Ivev001Usuario> ivev001UsuarioList) {

        this.ivev001UsuarioList = ivev001UsuarioList;
    }

    public List<IvetT003Inventario> getIvetT003InventarioList() {

        return ivetT003InventarioList;
    }

    public void setIvetT003InventarioList(List<IvetT003Inventario> ivetT003InventarioList) {

        this.ivetT003InventarioList = ivetT003InventarioList;
    }

    @Override
    public int hashCode() {

        int hash = 0;
        hash += (a001codigo != null ? a001codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof IvetT001Entidad)) {
            return false;
        }
        IvetT001Entidad other = (IvetT001Entidad) object;
        if ((this.a001codigo == null && other.a001codigo != null) || (this.a001codigo != null && !this.a001codigo.equals(other.a001codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {

        return "gov.mads.invent.comun.entidad.IvetT001Entidad[ a001codigo=" + a001codigo + " ]";
    }

}
