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

/**
 * @author Jorge
 */
@Entity
@Table(name = "SIST_T996_AUDITORIA")
@NamedQueries({@NamedQuery(name = "SistT996Auditoria.findAll", query = "SELECT s FROM SistT996Auditoria s")})
public class SistT996Auditoria implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "A996CODIGO")
    private Integer a996codigo;
    @Column(name = "A996FECHA")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a996fecha;
    @Column(name = "A996IDOBJETO")
    private BigInteger a996idobjeto;
    @Column(name = "A996OBJETO")
    private String a996objeto;
    @Column(name = "A996OPERACION")
    private String a996operacion;
    @Column(name = "A996USUARIO")
    private BigInteger a996usuario;
    @Column(name = "A996PROCEDIMIENTO")
    private String a996procedimiento;
    @Column(name = "A996PAQUETE")
    private String a996paquete;

    public SistT996Auditoria() {

    }

    public SistT996Auditoria(Integer a996codigo) {

        this.a996codigo = a996codigo;
    }

    public Integer getA996codigo() {

        return a996codigo;
    }

    public void setA996codigo(Integer a996codigo) {

        this.a996codigo = a996codigo;
    }

    public Date getA996fecha() {

        return a996fecha;
    }

    public void setA996fecha(Date a996fecha) {

        this.a996fecha = a996fecha;
    }

    public BigInteger getA996idobjeto() {

        return a996idobjeto;
    }

    public void setA996idobjeto(BigInteger a996idobjeto) {

        this.a996idobjeto = a996idobjeto;
    }

    public String getA996objeto() {

        return a996objeto;
    }

    public void setA996objeto(String a996objeto) {

        this.a996objeto = a996objeto;
    }

    public String getA996operacion() {

        return a996operacion;
    }

    public void setA996operacion(String a996operacion) {

        this.a996operacion = a996operacion;
    }

    public BigInteger getA996usuario() {

        return a996usuario;
    }

    public void setA996usuario(BigInteger a996usuario) {

        this.a996usuario = a996usuario;
    }

    public String getA996procedimiento() {

        return a996procedimiento;
    }

    public void setA996procedimiento(String a996procedimiento) {

        this.a996procedimiento = a996procedimiento;
    }

    public String getA996paquete() {

        return a996paquete;
    }

    public void setA996paquete(String a996paquete) {

        this.a996paquete = a996paquete;
    }

    @Override
    public int hashCode() {

        int hash = 0;
        hash += (a996codigo != null ? a996codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof SistT996Auditoria)) {
            return false;
        }
        SistT996Auditoria other = (SistT996Auditoria) object;
        if ((this.a996codigo == null && other.a996codigo != null) || (this.a996codigo != null && !this.a996codigo.equals(other.a996codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {

        return "gov.mads.invent.comun.entidad.SistT996Auditoria[ a996codigo=" + a996codigo + " ]";
    }

}
