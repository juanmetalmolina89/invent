/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package gov.mads.invent.comun.entidad;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @author Jorge
 */
@Entity
@Table(name = "IVEV_004_CONTAMINANTE")
@NamedQueries({@NamedQuery(name = "Ivev004Contaminante.findAll", query = "SELECT i FROM Ivev004Contaminante i")})
public class Ivev004Contaminante implements Serializable {

    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @Column(name = "COD_CONTAMINANTE")
    private int codContaminante;
    @Basic(optional = false)
    @Column(name = "A013IDCONTAMINANTE")
    private int a013idcontaminante;
    @Column(name = "A005CONTAMINANTE")
    private String a005contaminante;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "A013VALORCONTAMINANTE")
    private BigDecimal a013valorcontaminante;
    @Basic(optional = false)
    @Column(name = "ID_CATEGORIA")
    private int idCategoria;
    @Column(name = "A009NOMCATEMISION")
    private String a009nomcatemision;
    @Basic(optional = false)
    @Column(name = "A013FTEMETDFACTORACTIV")
    private String a013ftemetdfactoractiv;
    @Basic(optional = false)
    @Column(name = "A013FACTORACTIVIDAD")
    private int a013factoractividad;
    @Column(name = "A013UNDMEDFACTORACTIV")
    private Integer a013undmedfactoractiv;
    @Column(name = "A013FTEMETDFACTOREMIS")
    private String a013ftemetdfactoremis;
    @Column(name = "A013FACTOREMISION")
    private BigDecimal a013factoremision;
    @Basic(optional = false)
    @Column(name = "A013UNDMEDFACTOREMIS")
    private int a013undmedfactoremis;
    @Column(name = "A013EMISIONTOTAL")
    private BigDecimal a013emisiontotal;
    @Basic(optional = false)
    @Column(name = "A013ESTADOREGISTRO")
    private Character a013estadoregistro;
    @Column(name = "ID_INVENTARIO")
    private Integer idInventario;

    public Ivev004Contaminante() {

    }

    public int getCodContaminante() {

        return codContaminante;
    }

    public void setCodContaminante(int codContaminante) {

        this.codContaminante = codContaminante;
    }

    public int getA013idcontaminante() {

        return a013idcontaminante;
    }

    public void setA013idcontaminante(int a013idcontaminante) {

        this.a013idcontaminante = a013idcontaminante;
    }

    public String getA005contaminante() {

        return a005contaminante;
    }

    public void setA005contaminante(String a005contaminante) {

        this.a005contaminante = a005contaminante;
    }

    public BigDecimal getA013valorcontaminante() {

        return a013valorcontaminante;
    }

    public void setA013valorcontaminante(BigDecimal a013valorcontaminante) {

        this.a013valorcontaminante = a013valorcontaminante;
    }

    public int getIdCategoria() {

        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {

        this.idCategoria = idCategoria;
    }

    public String getA009nomcatemision() {

        return a009nomcatemision;
    }

    public void setA009nomcatemision(String a009nomcatemision) {

        this.a009nomcatemision = a009nomcatemision;
    }

    public String getA013ftemetdfactoractiv() {

        return a013ftemetdfactoractiv;
    }

    public void setA013ftemetdfactoractiv(String a013ftemetdfactoractiv) {

        this.a013ftemetdfactoractiv = a013ftemetdfactoractiv;
    }

    public int getA013factoractividad() {

        return a013factoractividad;
    }

    public void setA013factoractividad(int a013factoractividad) {

        this.a013factoractividad = a013factoractividad;
    }

    public Integer getA013undmedfactoractiv() {

        return a013undmedfactoractiv;
    }

    public void setA013undmedfactoractiv(Integer a013undmedfactoractiv) {

        this.a013undmedfactoractiv = a013undmedfactoractiv;
    }

    public String getA013ftemetdfactoremis() {

        return a013ftemetdfactoremis;
    }

    public void setA013ftemetdfactoremis(String a013ftemetdfactoremis) {

        this.a013ftemetdfactoremis = a013ftemetdfactoremis;
    }

    public BigDecimal getA013factoremision() {

        return a013factoremision;
    }

    public void setA013factoremision(BigDecimal a013factoremision) {

        this.a013factoremision = a013factoremision;
    }

    public int getA013undmedfactoremis() {

        return a013undmedfactoremis;
    }

    public void setA013undmedfactoremis(int a013undmedfactoremis) {

        this.a013undmedfactoremis = a013undmedfactoremis;
    }

    public BigDecimal getA013emisiontotal() {

        return a013emisiontotal;
    }

    public void setA013emisiontotal(BigDecimal a013emisiontotal) {

        this.a013emisiontotal = a013emisiontotal;
    }

    public Character getA013estadoregistro() {

        return a013estadoregistro;
    }

    public void setA013estadoregistro(Character a013estadoregistro) {

        this.a013estadoregistro = a013estadoregistro;
    }

    public Integer getIdInventario() {

        return idInventario;
    }

    public void setIdInventario(Integer idInventario) {

        this.idInventario = idInventario;
    }

}
