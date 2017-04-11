/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package gov.mads.invent.comun.entidad;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @author Jorge
 */
@Entity
@Table(name = "IVET_T013_CATEGCONTAMINA")
@NamedQueries({@NamedQuery(name = "IvetT013Categcontamina.findAll", query = "SELECT i FROM IvetT013Categcontamina i")})
public class IvetT013Categcontamina implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "A013CODIGO")
    private Integer a013codigo;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "A013VALORCONTAMINANTE")
    private BigDecimal a013valorcontaminante;
    @Basic(optional = false)
    @Column(name = "A013FACTORACTIVIDAD")
    private int a013factoractividad;
    @Basic(optional = false)
    @Column(name = "A013FTEMETDFACTORACTIV")
    private String a013ftemetdfactoractiv;
    @Column(name = "A013FACTOREMISION")
    private BigDecimal a013factoremision;
    @Column(name = "A013FTEMETDFACTOREMIS")
    private String a013ftemetdfactoremis;
    @Column(name = "A013EMISIONTOTAL")
    private BigDecimal a013emisiontotal;
    @Basic(optional = false)
    @Column(name = "A013ESTADOREGISTRO")
    private Character a013estadoregistro;
    @Column(name = "A013FECHACREACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a013fechacreacion;
    @Column(name = "A013FECHAMODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a013fechamodificacion;
    @Basic(optional = false)
    @Column(name = "A013USUARIOCREACION")
    private int a013usuariocreacion;
    @Column(name = "A013USUARIOMODIFICACION")
    private Integer a013usuariomodificacion;
    @JoinColumn(name = "A013IDCONTAMINANTE", referencedColumnName = "A005CODIGO")
    @ManyToOne(optional = false)
    private IvetT005Contaminante a013idcontaminante;
    @JoinColumn(name = "A013IDCATEGORIAEMISION", referencedColumnName = "A009CODIGO")
    @ManyToOne(optional = false)
    private IvetT009Categemision a013idcategoriaemision;
    @JoinColumn(name = "A013UNDMEDFACTORACTIV", referencedColumnName = "A011CODIGO")
    @ManyToOne
    private IvetT011Unidadmedida a013undmedfactoractiv;
    @JoinColumn(name = "A013UNDMEDFACTOREMIS", referencedColumnName = "A012CODIGO")
    @ManyToOne(optional = false)
    private IvetT012Unidadmedidafactor a013undmedfactoremis;

    public IvetT013Categcontamina() {

    }

    public IvetT013Categcontamina(Integer a013codigo) {

        this.a013codigo = a013codigo;
    }

    public IvetT013Categcontamina(Integer a013codigo, int a013factoractividad, String a013ftemetdfactoractiv, Character a013estadoregistro, int a013usuariocreacion) {

        this.a013codigo = a013codigo;
        this.a013factoractividad = a013factoractividad;
        this.a013ftemetdfactoractiv = a013ftemetdfactoractiv;
        this.a013estadoregistro = a013estadoregistro;
        this.a013usuariocreacion = a013usuariocreacion;
    }

    public Integer getA013codigo() {

        return a013codigo;
    }

    public void setA013codigo(Integer a013codigo) {

        this.a013codigo = a013codigo;
    }

    public BigDecimal getA013valorcontaminante() {

        return a013valorcontaminante;
    }

    public void setA013valorcontaminante(BigDecimal a013valorcontaminante) {

        this.a013valorcontaminante = a013valorcontaminante;
    }

    public int getA013factoractividad() {

        return a013factoractividad;
    }

    public void setA013factoractividad(int a013factoractividad) {

        this.a013factoractividad = a013factoractividad;
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

    public String getA013ftemetdfactoremis() {

        return a013ftemetdfactoremis;
    }

    public void setA013ftemetdfactoremis(String a013ftemetdfactoremis) {

        this.a013ftemetdfactoremis = a013ftemetdfactoremis;
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

    public Date getA013fechacreacion() {

        return a013fechacreacion;
    }

    public void setA013fechacreacion(Date a013fechacreacion) {

        this.a013fechacreacion = a013fechacreacion;
    }

    public Date getA013fechamodificacion() {

        return a013fechamodificacion;
    }

    public void setA013fechamodificacion(Date a013fechamodificacion) {

        this.a013fechamodificacion = a013fechamodificacion;
    }

    public int getA013usuariocreacion() {

        return a013usuariocreacion;
    }

    public void setA013usuariocreacion(int a013usuariocreacion) {

        this.a013usuariocreacion = a013usuariocreacion;
    }

    public Integer getA013usuariomodificacion() {

        return a013usuariomodificacion;
    }

    public void setA013usuariomodificacion(Integer a013usuariomodificacion) {

        this.a013usuariomodificacion = a013usuariomodificacion;
    }

    public IvetT005Contaminante getA013idcontaminante() {

        return a013idcontaminante;
    }

    public void setA013idcontaminante(IvetT005Contaminante a013idcontaminante) {

        this.a013idcontaminante = a013idcontaminante;
    }

    public IvetT009Categemision getA013idcategoriaemision() {

        return a013idcategoriaemision;
    }

    public void setA013idcategoriaemision(IvetT009Categemision a013idcategoriaemision) {

        this.a013idcategoriaemision = a013idcategoriaemision;
    }

    public IvetT011Unidadmedida getA013undmedfactoractiv() {

        return a013undmedfactoractiv;
    }

    public void setA013undmedfactoractiv(IvetT011Unidadmedida a013undmedfactoractiv) {

        this.a013undmedfactoractiv = a013undmedfactoractiv;
    }

    public IvetT012Unidadmedidafactor getA013undmedfactoremis() {

        return a013undmedfactoremis;
    }

    public void setA013undmedfactoremis(IvetT012Unidadmedidafactor a013undmedfactoremis) {

        this.a013undmedfactoremis = a013undmedfactoremis;
    }

    @Override
    public int hashCode() {

        int hash = 0;
        hash += (a013codigo != null ? a013codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof IvetT013Categcontamina)) {
            return false;
        }
        IvetT013Categcontamina other = (IvetT013Categcontamina) object;
        if ((this.a013codigo == null && other.a013codigo != null) || (this.a013codigo != null && !this.a013codigo.equals(other.a013codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {

        return "gov.mads.invent.comun.entidad.IvetT013Categcontamina[ a013codigo=" + a013codigo + " ]";
    }

}
