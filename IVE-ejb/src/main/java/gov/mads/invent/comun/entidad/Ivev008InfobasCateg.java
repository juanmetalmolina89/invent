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

/**
 * @author Jorge
 */
@Entity
@Table(name = "IVEV_008_INFOBAS_CATEG")
@NamedQueries({@NamedQuery(name = "Ivev008InfobasCateg.findAll", query = "SELECT i FROM Ivev008InfobasCateg i")})
public class Ivev008InfobasCateg implements Serializable {

    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @Column(name = "COD_INVENTARIO")
    private int codInventario;
    @Column(name = "COD_ENTIDAD")
    private Integer codEntidad;
    @Column(name = "SIGLA_ENTIDAD")
    private String siglaEntidad;
    @Column(name = "NOMBRE_ENTIDAD")
    private String nombreEntidad;
    @Basic(optional = false)
    @Column(name = "A003OBJETO")
    private String a003objeto;
    @Column(name = "A003FECHA_INICIAL")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a003fechaInicial;
    @Column(name = "A003FECHA_FINAL")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a003fechaFinal;
    @Column(name = "A009TOTALEMISION")
    private BigInteger a009totalemision;
    @Column(name = "A003DESCRIPCION_TERRITORIO")
    private String a003descripcionTerritorio;
    @Column(name = "A105CODDEPARTAMENTO")
    private Short a105coddepartamento;
    @Column(name = "A105DEPARTAMENTO")
    private String a105departamento;
    @Column(name = "A105CODMUNICIPIO")
    private Short a105codmunicipio;
    @Column(name = "A105MUNICIPIO")
    private String a105municipio;
    @Column(name = "CATEGORIA")
    private String categoria;
    @Column(name = "ID_TIPO_CAT")
    private Integer idTipoCat;
    @Column(name = "TIPO_CAT")
    private String tipoCat;
    @Column(name = "ID_TIPO_COM")
    private Integer idTipoCom;
    @Column(name = "TIPO_COMBUSTIBLE")
    private String tipoCombustible;
    @Column(name = "DESC_CAT")
    private String descCat;
    @Column(name = "A017IDCODCIIU")
    private Integer a017idcodciiu;
    @Column(name = "A108DESCRIPCIONCIIU")
    private String a108descripcionciiu;

    public Ivev008InfobasCateg() {

    }

    public int getCodInventario() {

        return codInventario;
    }

    public void setCodInventario(int codInventario) {

        this.codInventario = codInventario;
    }

    public Integer getCodEntidad() {

        return codEntidad;
    }

    public void setCodEntidad(Integer codEntidad) {

        this.codEntidad = codEntidad;
    }

    public String getSiglaEntidad() {

        return siglaEntidad;
    }

    public void setSiglaEntidad(String siglaEntidad) {

        this.siglaEntidad = siglaEntidad;
    }

    public String getNombreEntidad() {

        return nombreEntidad;
    }

    public void setNombreEntidad(String nombreEntidad) {

        this.nombreEntidad = nombreEntidad;
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

    public BigInteger getA009totalemision() {

        return a009totalemision;
    }

    public void setA009totalemision(BigInteger a009totalemision) {

        this.a009totalemision = a009totalemision;
    }

    public String getA003descripcionTerritorio() {

        return a003descripcionTerritorio;
    }

    public void setA003descripcionTerritorio(String a003descripcionTerritorio) {

        this.a003descripcionTerritorio = a003descripcionTerritorio;
    }

    public Short getA105coddepartamento() {

        return a105coddepartamento;
    }

    public void setA105coddepartamento(Short a105coddepartamento) {

        this.a105coddepartamento = a105coddepartamento;
    }

    public String getA105departamento() {

        return a105departamento;
    }

    public void setA105departamento(String a105departamento) {

        this.a105departamento = a105departamento;
    }

    public Short getA105codmunicipio() {

        return a105codmunicipio;
    }

    public void setA105codmunicipio(Short a105codmunicipio) {

        this.a105codmunicipio = a105codmunicipio;
    }

    public String getA105municipio() {

        return a105municipio;
    }

    public void setA105municipio(String a105municipio) {

        this.a105municipio = a105municipio;
    }

    public String getCategoria() {

        return categoria;
    }

    public void setCategoria(String categoria) {

        this.categoria = categoria;
    }

    public Integer getIdTipoCat() {

        return idTipoCat;
    }

    public void setIdTipoCat(Integer idTipoCat) {

        this.idTipoCat = idTipoCat;
    }

    public String getTipoCat() {

        return tipoCat;
    }

    public void setTipoCat(String tipoCat) {

        this.tipoCat = tipoCat;
    }

    public Integer getIdTipoCom() {

        return idTipoCom;
    }

    public void setIdTipoCom(Integer idTipoCom) {

        this.idTipoCom = idTipoCom;
    }

    public String getTipoCombustible() {

        return tipoCombustible;
    }

    public void setTipoCombustible(String tipoCombustible) {

        this.tipoCombustible = tipoCombustible;
    }

    public String getDescCat() {

        return descCat;
    }

    public void setDescCat(String descCat) {

        this.descCat = descCat;
    }

    public Integer getA017idcodciiu() {

        return a017idcodciiu;
    }

    public void setA017idcodciiu(Integer a017idcodciiu) {

        this.a017idcodciiu = a017idcodciiu;
    }

    public String getA108descripcionciiu() {

        return a108descripcionciiu;
    }

    public void setA108descripcionciiu(String a108descripcionciiu) {

        this.a108descripcionciiu = a108descripcionciiu;
    }

}
