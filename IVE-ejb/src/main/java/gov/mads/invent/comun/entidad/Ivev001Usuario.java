/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package gov.mads.invent.comun.entidad;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @author Jorge
 */
@Entity
@Table(name = "IVEV_001_USUARIO")
@NamedQueries({@NamedQuery(name = "Ivev001Usuario.findAll", query = "SELECT i FROM Ivev001Usuario i")})
public class Ivev001Usuario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @Column(name = "A002CODIGO")
    private int a002codigo;
    @Basic(optional = false)
    @Column(name = "A002NOMBRE")
    private String a002nombre;
    @Basic(optional = false)
    @Column(name = "A002APELLIDO")
    private String a002apellido;
    @Column(name = "DESC_TIPODOCUMENTO")
    private String descTipodocumento;
    @Basic(optional = false)
    @Column(name = "A002DOCUMENTO")
    private String a002documento;
    @Column(name = "A002EXPEDIDOEN")
    private String a002expedidoen;
    @Basic(optional = false)
    @Column(name = "A002DIRECCIONCORRESP")
    private String a002direccioncorresp;
    @Column(name = "A105CODDEPARTAMENTO")
    private Short a105coddepartamento;
    @Column(name = "DEPTO_LOCALIZACION")
    private String deptoLocalizacion;
    @Column(name = "A105CODMUNICIPIO")
    private Short a105codmunicipio;
    @Column(name = "MCIPIO_LOCALIZACION")
    private String mcipioLocalizacion;
    @Basic(optional = false)
    @Column(name = "A002CORREOELECTRONICO")
    private String a002correoelectronico;
    @Column(name = "A002TELEFONO")
    private String a002telefono;
    @Column(name = "A002CELULAR")
    private String a002celular;
    @Column(name = "A002PRIMERINGRESO")
    private String a002primeringreso;
    @Basic(optional = false)
    @Column(name = "A002USUARIO")
    private String a002usuario;
    @Basic(optional = false)
    @Column(name = "A002CONTRASENA")
    private String a002contrasena;
    @Column(name = "TIPOUSUARIO")
    private String tipousuario;
    @Column(name = "AUTORIDADAMBIENTAL")
    private String autoridadambiental;
    @Basic(optional = false)
    @Column(name = "A002ESTADOUSUARIO")
    private Character a002estadousuario;
    @Basic(optional = false)
    @Column(name = "A002ESTADOREGISTRO")
    private Character a002estadoregistro;
    @JoinColumn(name = "A002AUTORIDADAMBIENTAL", referencedColumnName = "A001CODIGO")
    @ManyToOne(optional = false)
    private IvetT001Entidad a002autoridadambiental;
    @JoinColumn(name = "A002MENU", referencedColumnName = "A015CODIGO")
    @ManyToOne
    private IvetT015Menu a002menu;
    @JoinColumn(name = "A002TIPOUSUARIO", referencedColumnName = "A102CODIGO")
    @ManyToOne(optional = false)
    private PartT102Lista a002tipousuario;
    @JoinColumn(name = "A002IDTIPODOCUMENTO", referencedColumnName = "A102CODIGO")
    @ManyToOne(optional = false)
    private PartT102Lista a002idtipodocumento;

    public Ivev001Usuario() {

    }

    public int getA002codigo() {

        return a002codigo;
    }

    public void setA002codigo(int a002codigo) {

        this.a002codigo = a002codigo;
    }

    public String getA002nombre() {

        return a002nombre;
    }

    public void setA002nombre(String a002nombre) {

        this.a002nombre = a002nombre;
    }

    public String getA002apellido() {

        return a002apellido;
    }

    public void setA002apellido(String a002apellido) {

        this.a002apellido = a002apellido;
    }

    public String getDescTipodocumento() {

        return descTipodocumento;
    }

    public void setDescTipodocumento(String descTipodocumento) {

        this.descTipodocumento = descTipodocumento;
    }

    public String getA002documento() {

        return a002documento;
    }

    public void setA002documento(String a002documento) {

        this.a002documento = a002documento;
    }

    public String getA002expedidoen() {

        return a002expedidoen;
    }

    public void setA002expedidoen(String a002expedidoen) {

        this.a002expedidoen = a002expedidoen;
    }

    public String getA002direccioncorresp() {

        return a002direccioncorresp;
    }

    public void setA002direccioncorresp(String a002direccioncorresp) {

        this.a002direccioncorresp = a002direccioncorresp;
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

    public String getA002correoelectronico() {

        return a002correoelectronico;
    }

    public void setA002correoelectronico(String a002correoelectronico) {

        this.a002correoelectronico = a002correoelectronico;
    }

    public String getA002telefono() {

        return a002telefono;
    }

    public void setA002telefono(String a002telefono) {

        this.a002telefono = a002telefono;
    }

    public String getA002celular() {

        return a002celular;
    }

    public void setA002celular(String a002celular) {

        this.a002celular = a002celular;
    }

    public String getA002primeringreso() {

        return a002primeringreso;
    }

    public void setA002primeringreso(String a002primeringreso) {

        this.a002primeringreso = a002primeringreso;
    }

    public String getA002usuario() {

        return a002usuario;
    }

    public void setA002usuario(String a002usuario) {

        this.a002usuario = a002usuario;
    }

    public String getA002contrasena() {

        return a002contrasena;
    }

    public void setA002contrasena(String a002contrasena) {

        this.a002contrasena = a002contrasena;
    }

    public String getTipousuario() {

        return tipousuario;
    }

    public void setTipousuario(String tipousuario) {

        this.tipousuario = tipousuario;
    }

    public String getAutoridadambiental() {

        return autoridadambiental;
    }

    public void setAutoridadambiental(String autoridadambiental) {

        this.autoridadambiental = autoridadambiental;
    }

    public Character getA002estadousuario() {

        return a002estadousuario;
    }

    public void setA002estadousuario(Character a002estadousuario) {

        this.a002estadousuario = a002estadousuario;
    }

    public Character getA002estadoregistro() {

        return a002estadoregistro;
    }

    public void setA002estadoregistro(Character a002estadoregistro) {

        this.a002estadoregistro = a002estadoregistro;
    }

    public IvetT001Entidad getA002autoridadambiental() {

        return a002autoridadambiental;
    }

    public void setA002autoridadambiental(IvetT001Entidad a002autoridadambiental) {

        this.a002autoridadambiental = a002autoridadambiental;
    }

    public IvetT015Menu getA002menu() {

        return a002menu;
    }

    public void setA002menu(IvetT015Menu a002menu) {

        this.a002menu = a002menu;
    }

    public PartT102Lista getA002tipousuario() {

        return a002tipousuario;
    }

    public void setA002tipousuario(PartT102Lista a002tipousuario) {

        this.a002tipousuario = a002tipousuario;
    }

    public PartT102Lista getA002idtipodocumento() {

        return a002idtipodocumento;
    }

    public void setA002idtipodocumento(PartT102Lista a002idtipodocumento) {

        this.a002idtipodocumento = a002idtipodocumento;
    }

}
