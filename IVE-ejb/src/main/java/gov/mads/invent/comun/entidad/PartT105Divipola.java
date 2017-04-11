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
@Table(name = "PART_T105_DIVIPOLA")
@NamedQueries({@NamedQuery(name = "PartT105Divipola.findAll", query = "SELECT p FROM PartT105Divipola p")})
public class PartT105Divipola implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "A105CODIGO")
    private Integer a105codigo;
    @Basic(optional = false)
    @Column(name = "A105CODDIVIPOLA")
    private String a105coddivipola;
    @Basic(optional = false)
    @Column(name = "A105CODDIVIPOLADM")
    private String a105coddivipoladm;
    @Basic(optional = false)
    @Column(name = "A105CODPAIS")
    private short a105codpais;
    @Basic(optional = false)
    @Column(name = "A105PAIS")
    private String a105pais;
    @Basic(optional = false)
    @Column(name = "A105CODDEPARTAMENTO")
    private short a105coddepartamento;
    @Basic(optional = false)
    @Column(name = "A105DEPARTAMENTO")
    private String a105departamento;
    @Basic(optional = false)
    @Column(name = "A105CODMUNICIPIO")
    private short a105codmunicipio;
    @Basic(optional = false)
    @Column(name = "A105MUNICIPIO")
    private String a105municipio;
    @Basic(optional = false)
    @Column(name = "A105ESTADOREGISTRO")
    private Character a105estadoregistro;
    @Column(name = "A105FECHACREACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a105fechacreacion;
    @Column(name = "A105FECHAMODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a105fechamodificacion;
    @Basic(optional = false)
    @Column(name = "A105USUARIOCREACION")
    private int a105usuariocreacion;
    @Column(name = "A105USUARIOMODIFICACION")
    private Integer a105usuariomodificacion;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a002localizacion")
    private List<IvetT002Usuario> ivetT002UsuarioList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a001coddivipola")
    private List<IvetT001Entidad> ivetT001EntidadList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a003iddivipola")
    private List<IvetT003Inventario> ivetT003InventarioList;

    public PartT105Divipola() {

    }

    public PartT105Divipola(Integer a105codigo) {

        this.a105codigo = a105codigo;
    }

    public PartT105Divipola(Integer a105codigo, String a105coddivipola, String a105coddivipoladm, short a105codpais, String a105pais, short a105coddepartamento, String a105departamento, short a105codmunicipio, String a105municipio, Character a105estadoregistro, int a105usuariocreacion) {

        this.a105codigo = a105codigo;
        this.a105coddivipola = a105coddivipola;
        this.a105coddivipoladm = a105coddivipoladm;
        this.a105codpais = a105codpais;
        this.a105pais = a105pais;
        this.a105coddepartamento = a105coddepartamento;
        this.a105departamento = a105departamento;
        this.a105codmunicipio = a105codmunicipio;
        this.a105municipio = a105municipio;
        this.a105estadoregistro = a105estadoregistro;
        this.a105usuariocreacion = a105usuariocreacion;
    }

    public Integer getA105codigo() {

        return a105codigo;
    }

    public void setA105codigo(Integer a105codigo) {

        this.a105codigo = a105codigo;
    }

    public String getA105coddivipola() {

        return a105coddivipola;
    }

    public void setA105coddivipola(String a105coddivipola) {

        this.a105coddivipola = a105coddivipola;
    }

    public String getA105coddivipoladm() {

        return a105coddivipoladm;
    }

    public void setA105coddivipoladm(String a105coddivipoladm) {

        this.a105coddivipoladm = a105coddivipoladm;
    }

    public short getA105codpais() {

        return a105codpais;
    }

    public void setA105codpais(short a105codpais) {

        this.a105codpais = a105codpais;
    }

    public String getA105pais() {

        return a105pais;
    }

    public void setA105pais(String a105pais) {

        this.a105pais = a105pais;
    }

    public short getA105coddepartamento() {

        return a105coddepartamento;
    }

    public void setA105coddepartamento(short a105coddepartamento) {

        this.a105coddepartamento = a105coddepartamento;
    }

    public String getA105departamento() {

        return a105departamento;
    }

    public void setA105departamento(String a105departamento) {

        this.a105departamento = a105departamento;
    }

    public short getA105codmunicipio() {

        return a105codmunicipio;
    }

    public void setA105codmunicipio(short a105codmunicipio) {

        this.a105codmunicipio = a105codmunicipio;
    }

    public String getA105municipio() {

        return a105municipio;
    }

    public void setA105municipio(String a105municipio) {

        this.a105municipio = a105municipio;
    }

    public Character getA105estadoregistro() {

        return a105estadoregistro;
    }

    public void setA105estadoregistro(Character a105estadoregistro) {

        this.a105estadoregistro = a105estadoregistro;
    }

    public Date getA105fechacreacion() {

        return a105fechacreacion;
    }

    public void setA105fechacreacion(Date a105fechacreacion) {

        this.a105fechacreacion = a105fechacreacion;
    }

    public Date getA105fechamodificacion() {

        return a105fechamodificacion;
    }

    public void setA105fechamodificacion(Date a105fechamodificacion) {

        this.a105fechamodificacion = a105fechamodificacion;
    }

    public int getA105usuariocreacion() {

        return a105usuariocreacion;
    }

    public void setA105usuariocreacion(int a105usuariocreacion) {

        this.a105usuariocreacion = a105usuariocreacion;
    }

    public Integer getA105usuariomodificacion() {

        return a105usuariomodificacion;
    }

    public void setA105usuariomodificacion(Integer a105usuariomodificacion) {

        this.a105usuariomodificacion = a105usuariomodificacion;
    }

    public List<IvetT002Usuario> getIvetT002UsuarioList() {

        return ivetT002UsuarioList;
    }

    public void setIvetT002UsuarioList(List<IvetT002Usuario> ivetT002UsuarioList) {

        this.ivetT002UsuarioList = ivetT002UsuarioList;
    }

    public List<IvetT001Entidad> getIvetT001EntidadList() {

        return ivetT001EntidadList;
    }

    public void setIvetT001EntidadList(List<IvetT001Entidad> ivetT001EntidadList) {

        this.ivetT001EntidadList = ivetT001EntidadList;
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
        hash += (a105codigo != null ? a105codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PartT105Divipola)) {
            return false;
        }
        PartT105Divipola other = (PartT105Divipola) object;
        if ((this.a105codigo == null && other.a105codigo != null) || (this.a105codigo != null && !this.a105codigo.equals(other.a105codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {

        return "gov.mads.invent.comun.entidad.PartT105Divipola[ a105codigo=" + a105codigo + " ]";
    }

}
