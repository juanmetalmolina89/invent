/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package gov.mads.invent.comun.entidad;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;
import java.util.List;

/**
 * @author Jorge
 */
@Entity
@Table(name = "IVET_T003_INVENTARIO")
@NamedQueries({@NamedQuery(name = "IvetT003Inventario.findAll", query = "SELECT i FROM IvetT003Inventario i")})
public class IvetT003Inventario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "A003CODIGO")
    private Integer a003codigo;
    @Basic(optional = false)
    @Column(name = "A003OBJETO")
    private String a003objeto;
    @Column(name = "A003FECHA_INICIAL")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a003fechaInicial;
    @Column(name = "A003FECHA_FINAL")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a003fechaFinal;
    @Column(name = "A003OBS_RECHAZO")
    private String a003obsRechazo;
    @Column(name = "A003DESCRIPCION_TERRITORIO")
    private String a003descripcionTerritorio;
    @Column(name = "A003TOTALEMISION")
    private BigInteger a003totalemision;
    @Basic(optional = false)
    @Column(name = "A003ESTADOREGISTRO")
    private Character a003estadoregistro;
    @Column(name = "A003FECHACREACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a003fechacreacion;
    @Column(name = "A003FECHAMODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a003fechamodificacion;
    @Basic(optional = false)
    @Column(name = "A003USUARIOCREACION")
    private int a003usuariocreacion;
    @Column(name = "A003USUARIOMODIFICACION")
    private Integer a003usuariomodificacion;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a016idinventario")
    private List<IvetT016Inventcontamina> ivetT016InventcontaminaList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a018idinventario")
    private List<IvetT018CambioEstados> ivetT018CambioEstadosList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a007idinventario")
    private List<IvetT007Inventariofuente> ivetT007InventariofuenteList;
    @JoinColumn(name = "A003IDUSUARIOREGISTRO", referencedColumnName = "A001CODIGO")
    @ManyToOne(optional = false)
    private IvetT001Entidad a003idusuarioregistro;
    @JoinColumn(name = "A003ESTADO_INVENTARIO", referencedColumnName = "A102CODIGO")
    @ManyToOne(optional = false)
    private PartT102Lista a003estadoInventario;
    @JoinColumn(name = "A003IDDIVIPOLA", referencedColumnName = "A105CODIGO")
    @ManyToOne(optional = false)
    private PartT105Divipola a003iddivipola;

    public IvetT003Inventario() {

    }

    public IvetT003Inventario(Integer a003codigo) {

        this.a003codigo = a003codigo;
    }

    public IvetT003Inventario(Integer a003codigo, String a003objeto, Character a003estadoregistro, int a003usuariocreacion) {

        this.a003codigo = a003codigo;
        this.a003objeto = a003objeto;
        this.a003estadoregistro = a003estadoregistro;
        this.a003usuariocreacion = a003usuariocreacion;
    }

    public Integer getA003codigo() {

        return a003codigo;
    }

    public void setA003codigo(Integer a003codigo) {

        this.a003codigo = a003codigo;
    }

    public String getA003objeto() {

        return a003objeto;
    }

    public void setA003objeto(String a003objeto) {

        this.a003objeto = a003objeto;
    }

    public Date getA003fechaInicial() {

        return a003fechaInicial;
    }

    public void setA003fechaInicial(Date a003fechaInicial) {

        this.a003fechaInicial = a003fechaInicial;
    }

    public Date getA003fechaFinal() {

        return a003fechaFinal;
    }

    public void setA003fechaFinal(Date a003fechaFinal) {

        this.a003fechaFinal = a003fechaFinal;
    }

    public String getA003obsRechazo() {

        return a003obsRechazo;
    }

    public void setA003obsRechazo(String a003obsRechazo) {

        this.a003obsRechazo = a003obsRechazo;
    }

    public String getA003descripcionTerritorio() {

        return a003descripcionTerritorio;
    }

    public void setA003descripcionTerritorio(String a003descripcionTerritorio) {

        this.a003descripcionTerritorio = a003descripcionTerritorio;
    }

    public BigInteger getA003totalemision() {

        return a003totalemision;
    }

    public void setA003totalemision(BigInteger a003totalemision) {

        this.a003totalemision = a003totalemision;
    }

    public Character getA003estadoregistro() {

        return a003estadoregistro;
    }

    public void setA003estadoregistro(Character a003estadoregistro) {

        this.a003estadoregistro = a003estadoregistro;
    }

    public Date getA003fechacreacion() {

        return a003fechacreacion;
    }

    public void setA003fechacreacion(Date a003fechacreacion) {

        this.a003fechacreacion = a003fechacreacion;
    }

    public Date getA003fechamodificacion() {

        return a003fechamodificacion;
    }

    public void setA003fechamodificacion(Date a003fechamodificacion) {

        this.a003fechamodificacion = a003fechamodificacion;
    }

    public int getA003usuariocreacion() {

        return a003usuariocreacion;
    }

    public void setA003usuariocreacion(int a003usuariocreacion) {

        this.a003usuariocreacion = a003usuariocreacion;
    }

    public Integer getA003usuariomodificacion() {

        return a003usuariomodificacion;
    }

    public void setA003usuariomodificacion(Integer a003usuariomodificacion) {

        this.a003usuariomodificacion = a003usuariomodificacion;
    }

    public List<IvetT016Inventcontamina> getIvetT016InventcontaminaList() {

        return ivetT016InventcontaminaList;
    }

    public void setIvetT016InventcontaminaList(List<IvetT016Inventcontamina> ivetT016InventcontaminaList) {

        this.ivetT016InventcontaminaList = ivetT016InventcontaminaList;
    }

    public List<IvetT018CambioEstados> getIvetT018CambioEstadosList() {

        return ivetT018CambioEstadosList;
    }

    public void setIvetT018CambioEstadosList(List<IvetT018CambioEstados> ivetT018CambioEstadosList) {

        this.ivetT018CambioEstadosList = ivetT018CambioEstadosList;
    }

    public List<IvetT007Inventariofuente> getIvetT007InventariofuenteList() {

        return ivetT007InventariofuenteList;
    }

    public void setIvetT007InventariofuenteList(List<IvetT007Inventariofuente> ivetT007InventariofuenteList) {

        this.ivetT007InventariofuenteList = ivetT007InventariofuenteList;
    }

    public IvetT001Entidad getA003idusuarioregistro() {

        return a003idusuarioregistro;
    }

    public void setA003idusuarioregistro(IvetT001Entidad a003idusuarioregistro) {

        this.a003idusuarioregistro = a003idusuarioregistro;
    }

    public PartT102Lista getA003estadoInventario() {

        return a003estadoInventario;
    }

    public void setA003estadoInventario(PartT102Lista a003estadoInventario) {

        this.a003estadoInventario = a003estadoInventario;
    }

    public PartT105Divipola getA003iddivipola() {

        return a003iddivipola;
    }

    public void setA003iddivipola(PartT105Divipola a003iddivipola) {

        this.a003iddivipola = a003iddivipola;
    }

    @Override
    public int hashCode() {

        int hash = 0;
        hash += (a003codigo != null ? a003codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof IvetT003Inventario)) {
            return false;
        }
        IvetT003Inventario other = (IvetT003Inventario) object;
        if ((this.a003codigo == null && other.a003codigo != null) || (this.a003codigo != null && !this.a003codigo.equals(other.a003codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {

        return "gov.mads.invent.comun.entidad.IvetT003Inventario[ a003codigo=" + a003codigo + " ]";
    }

}
