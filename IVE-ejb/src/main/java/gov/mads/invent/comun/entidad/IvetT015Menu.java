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
@Table(name = "IVET_T015_MENU")
@NamedQueries({@NamedQuery(name = "IvetT015Menu.findAll", query = "SELECT i FROM IvetT015Menu i")})
public class IvetT015Menu implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "A015CODIGO")
    private Integer a015codigo;
    @Basic(optional = false)
    @Column(name = "A015TIPOUSUARIOMENU")
    private String a015tipousuariomenu;
    @Basic(optional = false)
    @Column(name = "A015MENUPADRE")
    private String a015menupadre;
    @Basic(optional = false)
    @Column(name = "A015MENUHIJO")
    private String a015menuhijo;
    @Basic(optional = false)
    @Column(name = "A015ESTADOREGISTRO")
    private Character a015estadoregistro;
    @Column(name = "A015FECHACREACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a015fechacreacion;
    @Column(name = "A015FECHAMODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a015fechamodificacion;
    @Basic(optional = false)
    @Column(name = "A015USUARIOCREACION")
    private int a015usuariocreacion;
    @Column(name = "A015USUARIOMODIFICACION")
    private Integer a015usuariomodificacion;
    @OneToMany(mappedBy = "a002menu")
    private List<IvetT002Usuario> ivetT002UsuarioList;
    @OneToMany(mappedBy = "a002menu")
    private List<Ivev001Usuario> ivev001UsuarioList;

    public IvetT015Menu() {

    }

    public IvetT015Menu(Integer a015codigo) {

        this.a015codigo = a015codigo;
    }

    public IvetT015Menu(Integer a015codigo, String a015tipousuariomenu, String a015menupadre, String a015menuhijo, Character a015estadoregistro, int a015usuariocreacion) {

        this.a015codigo = a015codigo;
        this.a015tipousuariomenu = a015tipousuariomenu;
        this.a015menupadre = a015menupadre;
        this.a015menuhijo = a015menuhijo;
        this.a015estadoregistro = a015estadoregistro;
        this.a015usuariocreacion = a015usuariocreacion;
    }

    public Integer getA015codigo() {

        return a015codigo;
    }

    public void setA015codigo(Integer a015codigo) {

        this.a015codigo = a015codigo;
    }

    public String getA015tipousuariomenu() {

        return a015tipousuariomenu;
    }

    public void setA015tipousuariomenu(String a015tipousuariomenu) {

        this.a015tipousuariomenu = a015tipousuariomenu;
    }

    public String getA015menupadre() {

        return a015menupadre;
    }

    public void setA015menupadre(String a015menupadre) {

        this.a015menupadre = a015menupadre;
    }

    public String getA015menuhijo() {

        return a015menuhijo;
    }

    public void setA015menuhijo(String a015menuhijo) {

        this.a015menuhijo = a015menuhijo;
    }

    public Character getA015estadoregistro() {

        return a015estadoregistro;
    }

    public void setA015estadoregistro(Character a015estadoregistro) {

        this.a015estadoregistro = a015estadoregistro;
    }

    public Date getA015fechacreacion() {

        return a015fechacreacion;
    }

    public void setA015fechacreacion(Date a015fechacreacion) {

        this.a015fechacreacion = a015fechacreacion;
    }

    public Date getA015fechamodificacion() {

        return a015fechamodificacion;
    }

    public void setA015fechamodificacion(Date a015fechamodificacion) {

        this.a015fechamodificacion = a015fechamodificacion;
    }

    public int getA015usuariocreacion() {

        return a015usuariocreacion;
    }

    public void setA015usuariocreacion(int a015usuariocreacion) {

        this.a015usuariocreacion = a015usuariocreacion;
    }

    public Integer getA015usuariomodificacion() {

        return a015usuariomodificacion;
    }

    public void setA015usuariomodificacion(Integer a015usuariomodificacion) {

        this.a015usuariomodificacion = a015usuariomodificacion;
    }

    public List<IvetT002Usuario> getIvetT002UsuarioList() {

        return ivetT002UsuarioList;
    }

    public void setIvetT002UsuarioList(List<IvetT002Usuario> ivetT002UsuarioList) {

        this.ivetT002UsuarioList = ivetT002UsuarioList;
    }

    public List<Ivev001Usuario> getIvev001UsuarioList() {

        return ivev001UsuarioList;
    }

    public void setIvev001UsuarioList(List<Ivev001Usuario> ivev001UsuarioList) {

        this.ivev001UsuarioList = ivev001UsuarioList;
    }

    @Override
    public int hashCode() {

        int hash = 0;
        hash += (a015codigo != null ? a015codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof IvetT015Menu)) {
            return false;
        }
        IvetT015Menu other = (IvetT015Menu) object;
        if ((this.a015codigo == null && other.a015codigo != null) || (this.a015codigo != null && !this.a015codigo.equals(other.a015codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {

        return "gov.mads.invent.comun.entidad.IvetT015Menu[ a015codigo=" + a015codigo + " ]";
    }

}
