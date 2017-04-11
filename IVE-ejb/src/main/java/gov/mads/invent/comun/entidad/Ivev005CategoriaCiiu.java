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
@Table(name = "IVEV_005_CATEGORIA_CIIU")
@NamedQueries({@NamedQuery(name = "Ivev005CategoriaCiiu.findAll", query = "SELECT i FROM Ivev005CategoriaCiiu i")})
public class Ivev005CategoriaCiiu implements Serializable {

    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @Column(name = "A009CODIGO")
    private int a009codigo;
    @Basic(optional = false)
    @Column(name = "A009IDTIPOCATEMISION")
    private int a009idtipocatemision;
    @Basic(optional = false)
    @Column(name = "A009NOMCATEMISION")
    private String a009nomcatemision;
    @Column(name = "A009DESCCATEMISION")
    private String a009desccatemision;
    @Basic(optional = false)
    @Column(name = "A009IDTIPOCOMBUSTIBLE")
    private int a009idtipocombustible;
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
    @Column(name = "A009IDINVENTARIO")
    private int a009idinventario;
    @Column(name = "A017CODIGO")
    private Integer a017codigo;
    @Column(name = "A017IDCODCIIU")
    private Integer a017idcodciiu;
    @Column(name = "A108DESCRIPCIONCIIU")
    private String a108descripcionciiu;
    @Column(name = "A017ESTADOREGISTRO")
    private Character a017estadoregistro;

    public Ivev005CategoriaCiiu() {

    }

    public int getA009codigo() {

        return a009codigo;
    }

    public void setA009codigo(int a009codigo) {

        this.a009codigo = a009codigo;
    }

    public int getA009idtipocatemision() {

        return a009idtipocatemision;
    }

    public void setA009idtipocatemision(int a009idtipocatemision) {

        this.a009idtipocatemision = a009idtipocatemision;
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

    public int getA009idtipocombustible() {

        return a009idtipocombustible;
    }

    public void setA009idtipocombustible(int a009idtipocombustible) {

        this.a009idtipocombustible = a009idtipocombustible;
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

    public int getA009idinventario() {

        return a009idinventario;
    }

    public void setA009idinventario(int a009idinventario) {

        this.a009idinventario = a009idinventario;
    }

    public Integer getA017codigo() {

        return a017codigo;
    }

    public void setA017codigo(Integer a017codigo) {

        this.a017codigo = a017codigo;
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

    public Character getA017estadoregistro() {

        return a017estadoregistro;
    }

    public void setA017estadoregistro(Character a017estadoregistro) {

        this.a017estadoregistro = a017estadoregistro;
    }

}
