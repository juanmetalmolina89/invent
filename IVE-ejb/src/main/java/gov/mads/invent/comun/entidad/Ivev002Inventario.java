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
@Table(name = "IVEV_002_INVENTARIO")
@NamedQueries({@NamedQuery(name = "Ivev002Inventario.findAll", query = "SELECT i FROM Ivev002Inventario i")})
public class Ivev002Inventario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @Column(name = "A003CODIGO")
    private int a003codigo;
    @Column(name = "A105CODDEPARTAMENTO")
    private Short a105coddepartamento;
    @Column(name = "DEPTO_LOCALIZACION")
    private String deptoLocalizacion;
    @Column(name = "A105CODMUNICIPIO")
    private Short a105codmunicipio;
    @Column(name = "MCIPIO_LOCALIZACION")
    private String mcipioLocalizacion;
    @Column(name = "A105CODDIVIPOLADM")
    private String a105coddivipoladm;
    @Lob
    @Column(name = "A004GEOMETRIA")
    private String a004geometria;
    @Basic(optional = false)
    @Column(name = "A003OBJETO")
    private String a003objeto;
    @Column(name = "A003DESCRIPCION_TERRITORIO")
    private String a003descripcionTerritorio;
    @Column(name = "A003FECHA_INICIAL")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a003fechaInicial;
    @Column(name = "A003FECHA_FINAL")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a003fechaFinal;
    @Column(name = "DESC_ESTADO_INVENTARIO")
    private String descEstadoInventario;
    @Column(name = "A002AUTORIDADAMBIENTAL")
    private Integer a002autoridadambiental;
    @Column(name = "SIGLA_AA")
    private String siglaAa;
    @Basic(optional = false)
    @Column(name = "A003IDDIVIPOLA")
    private int a003iddivipola;
    @Column(name = "A003OBS_RECHAZO")
    private String a003obsRechazo;
    @Basic(optional = false)
    @Column(name = "A003ESTADOREGISTRO")
    private Character a003estadoregistro;
    @JoinColumn(name = "A003IDUSUARIOREGISTRO", referencedColumnName = "A001CODIGO")
    @ManyToOne(optional = false)
    private IvetT001Entidad a003idusuarioregistro;
    @JoinColumn(name = "A003ESTADO_INVENTARIO", referencedColumnName = "A102CODIGO")
    @ManyToOne(optional = false)
    private PartT102Lista a003estadoInventario;

    public Ivev002Inventario() {

    }

    public int getA003codigo() {

        return a003codigo;
    }

    public void setA003codigo(int a003codigo) {

        this.a003codigo = a003codigo;
    }

    public Short getA105coddepartamento() {

        return a105coddepartamento;
    }

    public void setA105coddepartamento(Short a105coddepartamento) {

        this.a105coddepartamento = a105coddepartamento;
    }

    public String getDeptoLocalizacion() {

        return deptoLocalizacion;
    }

    public void setDeptoLocalizacion(String deptoLocalizacion) {

        this.deptoLocalizacion = deptoLocalizacion;
    }

    public Short getA105codmunicipio() {

        return a105codmunicipio;
    }

    public void setA105codmunicipio(Short a105codmunicipio) {

        this.a105codmunicipio = a105codmunicipio;
    }

    public String getMcipioLocalizacion() {

        return mcipioLocalizacion;
    }

    public void setMcipioLocalizacion(String mcipioLocalizacion) {

        this.mcipioLocalizacion = mcipioLocalizacion;
    }

    public String getA105coddivipoladm() {

        return a105coddivipoladm;
    }

    public void setA105coddivipoladm(String a105coddivipoladm) {

        this.a105coddivipoladm = a105coddivipoladm;
    }

    public String getA004geometria() {

        return a004geometria;
    }

    public void setA004geometria(String a004geometria) {

        this.a004geometria = a004geometria;
    }

    public String getA003objeto() {

        return a003objeto;
    }

    public void setA003objeto(String a003objeto) {

        this.a003objeto = a003objeto;
    }

    public String getA003descripcionTerritorio() {

        return a003descripcionTerritorio;
    }

    public void setA003descripcionTerritorio(String a003descripcionTerritorio) {

        this.a003descripcionTerritorio = a003descripcionTerritorio;
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

    public String getDescEstadoInventario() {

        return descEstadoInventario;
    }

    public void setDescEstadoInventario(String descEstadoInventario) {

        this.descEstadoInventario = descEstadoInventario;
    }

    public Integer getA002autoridadambiental() {

        return a002autoridadambiental;
    }

    public void setA002autoridadambiental(Integer a002autoridadambiental) {

        this.a002autoridadambiental = a002autoridadambiental;
    }

    public String getSiglaAa() {

        return siglaAa;
    }

    public void setSiglaAa(String siglaAa) {

        this.siglaAa = siglaAa;
    }

    public int getA003iddivipola() {

        return a003iddivipola;
    }

    public void setA003iddivipola(int a003iddivipola) {

        this.a003iddivipola = a003iddivipola;
    }

    public String getA003obsRechazo() {

        return a003obsRechazo;
    }

    public void setA003obsRechazo(String a003obsRechazo) {

        this.a003obsRechazo = a003obsRechazo;
    }

    public Character getA003estadoregistro() {

        return a003estadoregistro;
    }

    public void setA003estadoregistro(Character a003estadoregistro) {

        this.a003estadoregistro = a003estadoregistro;
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

}
