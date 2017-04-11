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
@Table(name = "IVET_T009_CATEGEMISION")
@NamedQueries({@NamedQuery(name = "IvetT009Categemision.findAll", query = "SELECT i FROM IvetT009Categemision i")})
public class IvetT009Categemision implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "A009CODIGO")
    private Integer a009codigo;
    @Basic(optional = false)
    @Column(name = "A009NOMCATEMISION")
    private String a009nomcatemision;
    @Column(name = "A009DESCCATEMISION")
    private String a009desccatemision;
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
    @Column(name = "A009FECHACREACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a009fechacreacion;
    @Column(name = "A009FECHAMODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a009fechamodificacion;
    @Basic(optional = false)
    @Column(name = "A009USUARIOCREACION")
    private int a009usuariocreacion;
    @Column(name = "A009USUARIOMODIFICACION")
    private Integer a009usuariomodificacion;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a013idcategoriaemision")
    private List<IvetT013Categcontamina> ivetT013CategcontaminaList;
    @JoinColumn(name = "A009IDINVENTARIO", referencedColumnName = "A003CODIGO")
    @ManyToOne(optional = false)
    private IvetT003Inventario a009idinventario;
    @JoinColumn(name = "A009IDMETODOEMISION", referencedColumnName = "A008CODIGO")
    @ManyToOne(optional = false)
    private IvetT008Metodoemision a009idmetodoemision;
    @JoinColumn(name = "A009IDTIPOCOMBUSTIBLE", referencedColumnName = "A102CODIGO")
    @ManyToOne(optional = false)
    private PartT102Lista a009idtipocombustible;
    @JoinColumn(name = "A009IDTIPOCATEMISION", referencedColumnName = "A102CODIGO")
    @ManyToOne(optional = false)
    private PartT102Lista a009idtipocatemision;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a017codcatemision")
    private List<IvetT017CatgemisCiiu> ivetT017CatgemisCiiuList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a010codcatemision")
    private List<IvetT010Categcombustible> ivetT010CategcombustibleList;

    public IvetT009Categemision() {

    }

    public IvetT009Categemision(Integer a009codigo) {

        this.a009codigo = a009codigo;
    }

    public IvetT009Categemision(Integer a009codigo, String a009nomcatemision, int a009nrofuentes, Character a009estadoregistro, int a009usuariocreacion) {

        this.a009codigo = a009codigo;
        this.a009nomcatemision = a009nomcatemision;
        this.a009nrofuentes = a009nrofuentes;
        this.a009estadoregistro = a009estadoregistro;
        this.a009usuariocreacion = a009usuariocreacion;
    }

    public Integer getA009codigo() {

        return a009codigo;
    }

    public void setA009codigo(Integer a009codigo) {

        this.a009codigo = a009codigo;
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

    public Date getA009fechacreacion() {

        return a009fechacreacion;
    }

    public void setA009fechacreacion(Date a009fechacreacion) {

        this.a009fechacreacion = a009fechacreacion;
    }

    public Date getA009fechamodificacion() {

        return a009fechamodificacion;
    }

    public void setA009fechamodificacion(Date a009fechamodificacion) {

        this.a009fechamodificacion = a009fechamodificacion;
    }

    public int getA009usuariocreacion() {

        return a009usuariocreacion;
    }

    public void setA009usuariocreacion(int a009usuariocreacion) {

        this.a009usuariocreacion = a009usuariocreacion;
    }

    public Integer getA009usuariomodificacion() {

        return a009usuariomodificacion;
    }

    public void setA009usuariomodificacion(Integer a009usuariomodificacion) {

        this.a009usuariomodificacion = a009usuariomodificacion;
    }

    public List<IvetT013Categcontamina> getIvetT013CategcontaminaList() {

        return ivetT013CategcontaminaList;
    }

    public void setIvetT013CategcontaminaList(List<IvetT013Categcontamina> ivetT013CategcontaminaList) {

        this.ivetT013CategcontaminaList = ivetT013CategcontaminaList;
    }

    public IvetT003Inventario getA009idinventario() {

        return a009idinventario;
    }

    public void setA009idinventario(IvetT003Inventario a009idinventario) {

        this.a009idinventario = a009idinventario;
    }

    public IvetT008Metodoemision getA009idmetodoemision() {

        return a009idmetodoemision;
    }

    public void setA009idmetodoemision(IvetT008Metodoemision a009idmetodoemision) {

        this.a009idmetodoemision = a009idmetodoemision;
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

    public List<IvetT017CatgemisCiiu> getIvetT017CatgemisCiiuList() {

        return ivetT017CatgemisCiiuList;
    }

    public void setIvetT017CatgemisCiiuList(List<IvetT017CatgemisCiiu> ivetT017CatgemisCiiuList) {

        this.ivetT017CatgemisCiiuList = ivetT017CatgemisCiiuList;
    }

    public List<IvetT010Categcombustible> getIvetT010CategcombustibleList() {

        return ivetT010CategcombustibleList;
    }

    public void setIvetT010CategcombustibleList(List<IvetT010Categcombustible> ivetT010CategcombustibleList) {

        this.ivetT010CategcombustibleList = ivetT010CategcombustibleList;
    }

    @Override
    public int hashCode() {

        int hash = 0;
        hash += (a009codigo != null ? a009codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof IvetT009Categemision)) {
            return false;
        }
        IvetT009Categemision other = (IvetT009Categemision) object;
        if ((this.a009codigo == null && other.a009codigo != null) || (this.a009codigo != null && !this.a009codigo.equals(other.a009codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {

        return "gov.mads.invent.comun.entidad.IvetT009Categemision[ a009codigo=" + a009codigo + " ]";
    }

}
