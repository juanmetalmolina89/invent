/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package gov.mads.invent.comun.entidad;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;

/**
 * @author Jorge
 */
@Entity
@Table(name = "IVEV_007_INFOBAS_CONTAM")
@NamedQueries({@NamedQuery(name = "Ivev007InfobasContam.findAll", query = "SELECT i FROM Ivev007InfobasContam i")})
public class Ivev007InfobasContam implements Serializable {

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
    @Column(name = "ID_CONTAMINANTE")
    private Integer idContaminante;
    @Column(name = "DESC_CONTAM")
    private String descContam;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "A013VALORCONTAMINANTE")
    private BigDecimal a013valorcontaminante;
    @Column(name = "A013FACTORACTIVIDAD")
    private Integer a013factoractividad;
    @Column(name = "A013UNDMEDFACTORACTIV")
    private Integer a013undmedfactoractiv;
    @Column(name = "A013FTEMETDFACTORACTIV")
    private String a013ftemetdfactoractiv;
    @Column(name = "A013FACTOREMISION")
    private BigDecimal a013factoremision;
    @Column(name = "A013UNDMEDFACTOREMIS")
    private Integer a013undmedfactoremis;
    @Column(name = "A013FTEMETDFACTOREMIS")
    private String a013ftemetdfactoremis;
    @Column(name = "TOTAL_EMISION")
    private BigDecimal totalEmision;

    public Ivev007InfobasContam() {

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

    public Integer getIdContaminante() {

        return idContaminante;
    }

    public void setIdContaminante(Integer idContaminante) {

        this.idContaminante = idContaminante;
    }

    public String getDescContam() {

        return descContam;
    }

    public void setDescContam(String descContam) {

        this.descContam = descContam;
    }

    public BigDecimal getA013valorcontaminante() {

        return a013valorcontaminante;
    }

    public void setA013valorcontaminante(BigDecimal a013valorcontaminante) {

        this.a013valorcontaminante = a013valorcontaminante;
    }

    public Integer getA013factoractividad() {

        return a013factoractividad;
    }

    public void setA013factoractividad(Integer a013factoractividad) {

        this.a013factoractividad = a013factoractividad;
    }

    public Integer getA013undmedfactoractiv() {

        return a013undmedfactoractiv;
    }

    public void setA013undmedfactoractiv(Integer a013undmedfactoractiv) {

        this.a013undmedfactoractiv = a013undmedfactoractiv;
    }

    public String getA013ftemetdfactoractiv() {

        return a013ftemetdfactoractiv;
    }

    public void setA013ftemetdfactoractiv(String a013ftemetdfactoractiv) {

        this.a013ftemetdfactoractiv = a013ftemetdfactoractiv;
    }

    public BigDecimal getA013factoremision() {

        return a013factoremision;
    }

    public void setA013factoremision(BigDecimal a013factoremision) {

        this.a013factoremision = a013factoremision;
    }

    public Integer getA013undmedfactoremis() {

        return a013undmedfactoremis;
    }

    public void setA013undmedfactoremis(Integer a013undmedfactoremis) {

        this.a013undmedfactoremis = a013undmedfactoremis;
    }

    public String getA013ftemetdfactoremis() {

        return a013ftemetdfactoremis;
    }

    public void setA013ftemetdfactoremis(String a013ftemetdfactoremis) {

        this.a013ftemetdfactoremis = a013ftemetdfactoremis;
    }

    public BigDecimal getTotalEmision() {

        return totalEmision;
    }

    public void setTotalEmision(BigDecimal totalEmision) {

        this.totalEmision = totalEmision;
    }

}
