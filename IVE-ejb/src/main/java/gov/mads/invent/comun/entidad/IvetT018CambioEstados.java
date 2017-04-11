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
@Table(name = "IVET_T018_CAMBIO_ESTADOS")
@NamedQueries({@NamedQuery(name = "IvetT018CambioEstados.findAll", query = "SELECT i FROM IvetT018CambioEstados i")})
public class IvetT018CambioEstados implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "A018CODIGO")
    private Integer a018codigo;
    @Basic(optional = false)
    @Column(name = "A018ESTADOREGISTRO")
    private Character a018estadoregistro;
    @Column(name = "A018FECHACREACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a018fechacreacion;
    @Column(name = "A017FECHAMODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a017fechamodificacion;
    @Basic(optional = false)
    @Column(name = "A017USUARIOCREACION")
    private int a017usuariocreacion;
    @Column(name = "A017USUARIOMODIFICACION")
    private Integer a017usuariomodificacion;
    @JoinColumn(name = "A018IDINVENTARIO", referencedColumnName = "A003CODIGO")
    @ManyToOne(optional = false)
    private IvetT003Inventario a018idinventario;
    @JoinColumn(name = "A003ESTADO_NVO_INV", referencedColumnName = "A102CODIGO")
    @ManyToOne(optional = false)
    private PartT102Lista a003estadoNvoInv;
    @JoinColumn(name = "A003ESTADO_ANT_INV", referencedColumnName = "A102CODIGO")
    @ManyToOne(optional = false)
    private PartT102Lista a003estadoAntInv;

    public IvetT018CambioEstados() {

    }

    public IvetT018CambioEstados(Integer a018codigo) {

        this.a018codigo = a018codigo;
    }

    public IvetT018CambioEstados(Integer a018codigo, Character a018estadoregistro, int a017usuariocreacion) {

        this.a018codigo = a018codigo;
        this.a018estadoregistro = a018estadoregistro;
        this.a017usuariocreacion = a017usuariocreacion;
    }

    public Integer getA018codigo() {

        return a018codigo;
    }

    public void setA018codigo(Integer a018codigo) {

        this.a018codigo = a018codigo;
    }

    public Character getA018estadoregistro() {

        return a018estadoregistro;
    }

    public void setA018estadoregistro(Character a018estadoregistro) {

        this.a018estadoregistro = a018estadoregistro;
    }

    public Date getA018fechacreacion() {

        return a018fechacreacion;
    }

    public void setA018fechacreacion(Date a018fechacreacion) {

        this.a018fechacreacion = a018fechacreacion;
    }

    public Date getA017fechamodificacion() {

        return a017fechamodificacion;
    }

    public void setA017fechamodificacion(Date a017fechamodificacion) {

        this.a017fechamodificacion = a017fechamodificacion;
    }

    public int getA017usuariocreacion() {

        return a017usuariocreacion;
    }

    public void setA017usuariocreacion(int a017usuariocreacion) {

        this.a017usuariocreacion = a017usuariocreacion;
    }

    public Integer getA017usuariomodificacion() {

        return a017usuariomodificacion;
    }

    public void setA017usuariomodificacion(Integer a017usuariomodificacion) {

        this.a017usuariomodificacion = a017usuariomodificacion;
    }

    public IvetT003Inventario getA018idinventario() {

        return a018idinventario;
    }

    public void setA018idinventario(IvetT003Inventario a018idinventario) {

        this.a018idinventario = a018idinventario;
    }

    public PartT102Lista getA003estadoNvoInv() {

        return a003estadoNvoInv;
    }

    public void setA003estadoNvoInv(PartT102Lista a003estadoNvoInv) {

        this.a003estadoNvoInv = a003estadoNvoInv;
    }

    public PartT102Lista getA003estadoAntInv() {

        return a003estadoAntInv;
    }

    public void setA003estadoAntInv(PartT102Lista a003estadoAntInv) {

        this.a003estadoAntInv = a003estadoAntInv;
    }

    @Override
    public int hashCode() {

        int hash = 0;
        hash += (a018codigo != null ? a018codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof IvetT018CambioEstados)) {
            return false;
        }
        IvetT018CambioEstados other = (IvetT018CambioEstados) object;
        if ((this.a018codigo == null && other.a018codigo != null) || (this.a018codigo != null && !this.a018codigo.equals(other.a018codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {

        return "gov.mads.invent.comun.entidad.IvetT018CambioEstados[ a018codigo=" + a018codigo + " ]";
    }

}
