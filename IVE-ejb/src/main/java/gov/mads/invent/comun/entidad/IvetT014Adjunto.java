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
@Table(name = "IVET_T014_ADJUNTO")
@NamedQueries({@NamedQuery(name = "IvetT014Adjunto.findAll", query = "SELECT i FROM IvetT014Adjunto i")})
public class IvetT014Adjunto implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "A014CODIGO")
    private Integer a014codigo;
    @Basic(optional = false)
    @Column(name = "A014NOMBREADJUNTO")
    private String a014nombreadjunto;
    @Basic(optional = false)
    @Column(name = "A014RUTAADJUNTO")
    private String a014rutaadjunto;
    @Basic(optional = false)
    @Column(name = "A014ESTADOREGISTRO")
    private Character a014estadoregistro;
    @Column(name = "A014FECHACREACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a014fechacreacion;
    @Column(name = "A014FECHAMODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a014fechamodificacion;
    @Basic(optional = false)
    @Column(name = "A014USUARIOCREACION")
    private int a014usuariocreacion;
    @Column(name = "A014USUARIOMODIFICACION")
    private Integer a014usuariomodificacion;
    @JoinColumn(name = "A014IDINVENTARIO", referencedColumnName = "A003CODIGO")
    @ManyToOne(optional = false)
    private IvetT003Inventario a014idinventario;

    public IvetT014Adjunto() {

    }

    public IvetT014Adjunto(Integer a014codigo) {

        this.a014codigo = a014codigo;
    }

    public IvetT014Adjunto(Integer a014codigo, String a014nombreadjunto, String a014rutaadjunto, Character a014estadoregistro, int a014usuariocreacion) {

        this.a014codigo = a014codigo;
        this.a014nombreadjunto = a014nombreadjunto;
        this.a014rutaadjunto = a014rutaadjunto;
        this.a014estadoregistro = a014estadoregistro;
        this.a014usuariocreacion = a014usuariocreacion;
    }

    public Integer getA014codigo() {

        return a014codigo;
    }

    public void setA014codigo(Integer a014codigo) {

        this.a014codigo = a014codigo;
    }

    public String getA014nombreadjunto() {

        return a014nombreadjunto;
    }

    public void setA014nombreadjunto(String a014nombreadjunto) {

        this.a014nombreadjunto = a014nombreadjunto;
    }

    public String getA014rutaadjunto() {

        return a014rutaadjunto;
    }

    public void setA014rutaadjunto(String a014rutaadjunto) {

        this.a014rutaadjunto = a014rutaadjunto;
    }

    public Character getA014estadoregistro() {

        return a014estadoregistro;
    }

    public void setA014estadoregistro(Character a014estadoregistro) {

        this.a014estadoregistro = a014estadoregistro;
    }

    public Date getA014fechacreacion() {

        return a014fechacreacion;
    }

    public void setA014fechacreacion(Date a014fechacreacion) {

        this.a014fechacreacion = a014fechacreacion;
    }

    public Date getA014fechamodificacion() {

        return a014fechamodificacion;
    }

    public void setA014fechamodificacion(Date a014fechamodificacion) {

        this.a014fechamodificacion = a014fechamodificacion;
    }

    public int getA014usuariocreacion() {

        return a014usuariocreacion;
    }

    public void setA014usuariocreacion(int a014usuariocreacion) {

        this.a014usuariocreacion = a014usuariocreacion;
    }

    public Integer getA014usuariomodificacion() {

        return a014usuariomodificacion;
    }

    public void setA014usuariomodificacion(Integer a014usuariomodificacion) {

        this.a014usuariomodificacion = a014usuariomodificacion;
    }

    public IvetT003Inventario getA014idinventario() {

        return a014idinventario;
    }

    public void setA014idinventario(IvetT003Inventario a014idinventario) {

        this.a014idinventario = a014idinventario;
    }

    @Override
    public int hashCode() {

        int hash = 0;
        hash += (a014codigo != null ? a014codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof IvetT014Adjunto)) {
            return false;
        }
        IvetT014Adjunto other = (IvetT014Adjunto) object;
        if ((this.a014codigo == null && other.a014codigo != null) || (this.a014codigo != null && !this.a014codigo.equals(other.a014codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {

        return "gov.mads.invent.comun.entidad.IvetT014Adjunto[ a014codigo=" + a014codigo + " ]";
    }

}
