/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package gov.mads.invent.comun.entidad;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigInteger;

/**
 * @author Jorge
 */
@Entity
@Table(name = "IVEV_003_CATEGORIA")
@NamedQueries({@NamedQuery(name = "Ivev003Categoria.findAll", query = "SELECT i FROM Ivev003Categoria i")})
public class Ivev003Categoria implements Serializable {

    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @Column(name = "A009CODIGO")
    private int a009codigo;
    @Column(name = "DESC_TIPO_CAT_EMISION")
    private String descTipoCatEmision;
    @Basic(optional = false)
    @Column(name = "A009NOMCATEMISION")
    private String a009nomcatemision;
    @Column(name = "A009DESCCATEMISION")
    private String a009desccatemision;
    @Column(name = "DESC_ID_TIPO_COMBUSTIBLE")
    private String descIdTipoCombustible;
    @Basic(optional = false)
    @Column(name = "A009IDMETODOEMISION")
    private int a009idmetodoemision;
    @Column(name = "A008METODODETEMISION")
    private String a008metododetemision;
    @Column(name = "A009CILINDRAJE")
    private BigInteger a009cilindraje;
    @Column(name = "A009ANIOMODELO")
    private Short a009aniomodelo;
    @Basic(optional = false)
    @Column(name = "A009NROFUENTES")
    private int a009nrofuentes;
    @Column(name = "A009DETMETODFUENTES")
    private String a009detmetodfuentes;
    @Column(name = "A009OBSERVACION")
    private String a009observacion;
    @Column(name = "A009TOTALEMISION")
    private BigInteger a009totalemision;
    @Basic(optional = false)
    @Column(name = "A009ESTADOREGISTRO")
    private Character a009estadoregistro;
    @Basic(optional = false)
    @Column(name = "A009IDINVENTARIO")
    private int a009idinventario;
    @JoinColumn(name = "A009IDTIPOCOMBUSTIBLE", referencedColumnName = "A102CODIGO")
    @ManyToOne(optional = false)
    private PartT102Lista a009idtipocombustible;
    @JoinColumn(name = "A009IDTIPOCATEMISION", referencedColumnName = "A102CODIGO")
    @ManyToOne(optional = false)
    private PartT102Lista a009idtipocatemision;

    public Ivev003Categoria() {

    }

    public int getA009codigo() {

        return a009codigo;
    }

    public void setA009codigo(int a009codigo) {

        this.a009codigo = a009codigo;
    }

    public String getDescTipoCatEmision() {

        return descTipoCatEmision;
    }

    public void setDescTipoCatEmision(String descTipoCatEmision) {

        this.descTipoCatEmision = descTipoCatEmision;
    }

    public String getA009nomcatemision() {

        return a009nomcatemision;
    }

    public void setA009nomcatemision(String a009nomcatemision) {

        this.a009nomcatemision = a009nomcatemision;
    }

    public String getA009desccatemision() {

        return a009desccatemision;
    }

    public void setA009desccatemision(String a009desccatemision) {

        this.a009desccatemision = a009desccatemision;
    }

    public String getDescIdTipoCombustible() {

        return descIdTipoCombustible;
    }

    public void setDescIdTipoCombustible(String descIdTipoCombustible) {

        this.descIdTipoCombustible = descIdTipoCombustible;
    }

    public int getA009idmetodoemision() {

        return a009idmetodoemision;
    }

    public void setA009idmetodoemision(int a009idmetodoemision) {

        this.a009idmetodoemision = a009idmetodoemision;
    }

    public String getA008metododetemision() {

        return a008metododetemision;
    }

    public void setA008metododetemision(String a008metododetemision) {

        this.a008metododetemision = a008metododetemision;
    }

    public BigInteger getA009cilindraje() {

        return a009cilindraje;
    }

    public void setA009cilindraje(BigInteger a009cilindraje) {

        this.a009cilindraje = a009cilindraje;
    }

    public Short getA009aniomodelo() {

        return a009aniomodelo;
    }

    public void setA009aniomodelo(Short a009aniomodelo) {

        this.a009aniomodelo = a009aniomodelo;
    }

    public int getA009nrofuentes() {

        return a009nrofuentes;
    }

    public void setA009nrofuentes(int a009nrofuentes) {

        this.a009nrofuentes = a009nrofuentes;
    }

    public String getA009detmetodfuentes() {

        return a009detmetodfuentes;
    }

    public void setA009detmetodfuentes(String a009detmetodfuentes) {

        this.a009detmetodfuentes = a009detmetodfuentes;
    }

    public String getA009observacion() {

        return a009observacion;
    }

    public void setA009observacion(String a009observacion) {

        this.a009observacion = a009observacion;
    }

    public BigInteger getA009totalemision() {

        return a009totalemision;
    }

    public void setA009totalemision(BigInteger a009totalemision) {

        this.a009totalemision = a009totalemision;
    }

    public Character getA009estadoregistro() {

        return a009estadoregistro;
    }

    public void setA009estadoregistro(Character a009estadoregistro) {

        this.a009estadoregistro = a009estadoregistro;
    }

    public int getA009idinventario() {

        return a009idinventario;
    }

    public void setA009idinventario(int a009idinventario) {

        this.a009idinventario = a009idinventario;
    }

    public PartT102Lista getA009idtipocombustible() {

        return a009idtipocombustible;
    }

    public void setA009idtipocombustible(PartT102Lista a009idtipocombustible) {

        this.a009idtipocombustible = a009idtipocombustible;
    }

    public PartT102Lista getA009idtipocatemision() {

        return a009idtipocatemision;
    }

    public void setA009idtipocatemision(PartT102Lista a009idtipocatemision) {

        this.a009idtipocatemision = a009idtipocatemision;
    }

}
