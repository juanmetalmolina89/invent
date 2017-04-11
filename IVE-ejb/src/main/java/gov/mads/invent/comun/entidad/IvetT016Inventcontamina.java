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
@Table(name = "IVET_T016_INVENTCONTAMINA")
@NamedQueries({@NamedQuery(name = "IvetT016Inventcontamina.findAll", query = "SELECT i FROM IvetT016Inventcontamina i")})
public class IvetT016Inventcontamina implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "A016CODIGO")
    private Integer a016codigo;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "A016EMISIONTOTAL")
    private BigDecimal a016emisiontotal;
    @Basic(optional = false)
    @Column(name = "A016ESTADOREGISTRO")
    private Character a016estadoregistro;
    @Column(name = "A016FECHACREACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a016fechacreacion;
    @Column(name = "A016FECHAMODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a016fechamodificacion;
    @Basic(optional = false)
    @Column(name = "A016USUARIOCREACION")
    private int a016usuariocreacion;
    @Column(name = "A016USUARIOMODIFICACION")
    private Integer a016usuariomodificacion;
    @JoinColumn(name = "A016IDINVENTARIO", referencedColumnName = "A003CODIGO")
    @ManyToOne(optional = false)
    private IvetT003Inventario a016idinventario;
    @JoinColumn(name = "A016IDCONTAMINANTE", referencedColumnName = "A005CODIGO")
    @ManyToOne(optional = false)
    private IvetT005Contaminante a016idcontaminante;

    public IvetT016Inventcontamina() {

    }

    public IvetT016Inventcontamina(Integer a016codigo) {

        this.a016codigo = a016codigo;
    }

    public IvetT016Inventcontamina(Integer a016codigo, Character a016estadoregistro, int a016usuariocreacion) {

        this.a016codigo = a016codigo;
        this.a016estadoregistro = a016estadoregistro;
        this.a016usuariocreacion = a016usuariocreacion;
    }

    public Integer getA016codigo() {

        return a016codigo;
    }

    public void setA016codigo(Integer a016codigo) {

        this.a016codigo = a016codigo;
    }

    public BigDecimal getA016emisiontotal() {

        return a016emisiontotal;
    }

    public void setA016emisiontotal(BigDecimal a016emisiontotal) {

        this.a016emisiontotal = a016emisiontotal;
    }

    public Character getA016estadoregistro() {

        return a016estadoregistro;
    }

    public void setA016estadoregistro(Character a016estadoregistro) {

        this.a016estadoregistro = a016estadoregistro;
    }

    public Date getA016fechacreacion() {

        return a016fechacreacion;
    }

    public void setA016fechacreacion(Date a016fechacreacion) {

        this.a016fechacreacion = a016fechacreacion;
    }

    public Date getA016fechamodificacion() {

        return a016fechamodificacion;
    }

    public void setA016fechamodificacion(Date a016fechamodificacion) {

        this.a016fechamodificacion = a016fechamodificacion;
    }

    public int getA016usuariocreacion() {

        return a016usuariocreacion;
    }

    public void setA016usuariocreacion(int a016usuariocreacion) {

        this.a016usuariocreacion = a016usuariocreacion;
    }

    public Integer getA016usuariomodificacion() {

        return a016usuariomodificacion;
    }

    public void setA016usuariomodificacion(Integer a016usuariomodificacion) {

        this.a016usuariomodificacion = a016usuariomodificacion;
    }

    public IvetT003Inventario getA016idinventario() {

        return a016idinventario;
    }

    public void setA016idinventario(IvetT003Inventario a016idinventario) {

        this.a016idinventario = a016idinventario;
    }

    public IvetT005Contaminante getA016idcontaminante() {

        return a016idcontaminante;
    }

    public void setA016idcontaminante(IvetT005Contaminante a016idcontaminante) {

        this.a016idcontaminante = a016idcontaminante;
    }

    @Override
    public int hashCode() {

        int hash = 0;
        hash += (a016codigo != null ? a016codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof IvetT016Inventcontamina)) {
            return false;
        }
        IvetT016Inventcontamina other = (IvetT016Inventcontamina) object;
        if ((this.a016codigo == null && other.a016codigo != null) || (this.a016codigo != null && !this.a016codigo.equals(other.a016codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {

        return "gov.mads.invent.comun.entidad.IvetT016Inventcontamina[ a016codigo=" + a016codigo + " ]";
    }

}
