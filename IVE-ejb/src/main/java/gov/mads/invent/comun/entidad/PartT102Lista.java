/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package gov.mads.invent.comun.entidad;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @author Jorge
 */
@Entity
@Table(name = "PART_T102_LISTA")
@NamedQueries({@NamedQuery(name = "PartT102Lista.findAll", query = "SELECT p FROM PartT102Lista p")})
public class PartT102Lista implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "A102CODIGO")
    private Integer a102codigo;
    @Basic(optional = false)
    @Column(name = "A102VALOR")
    private String a102valor;
    @Column(name = "A102VALORCORTO")
    private String a102valorcorto;
    @Basic(optional = false)
    @Column(name = "A102ESTADOREGISTRO")
    private Character a102estadoregistro;
    @Column(name = "A102FECHACREACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a102fechacreacion;
    @Column(name = "A102FECHAMODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date a102fechamodificacion;
    @Basic(optional = false)
    @Column(name = "A102USUARIOCREACION")
    private int a102usuariocreacion;
    @Column(name = "A102USUARIOMODIFICACION")
    private Integer a102usuariomodificacion;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a003estadoInventario")
    private List<Ivev002Inventario> ivev002InventarioList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a002tipousuario")
    private List<IvetT002Usuario> ivetT002UsuarioList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a002idtipodocumento")
    private List<IvetT002Usuario> ivetT002UsuarioList1;
    @JoinColumn(name = "A102CATEGORIA", referencedColumnName = "A101CODIGO")
    @ManyToOne(optional = false)
    private PartT101Categoria a102categoria;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a009idtipocombustible")
    private List<IvetT009Categemision> ivetT009CategemisionList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a009idtipocatemision")
    private List<IvetT009Categemision> ivetT009CategemisionList1;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a003estadoNvoInv")
    private List<IvetT018CambioEstados> ivetT018CambioEstadosList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a003estadoAntInv")
    private List<IvetT018CambioEstados> ivetT018CambioEstadosList1;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a002tipousuario")
    private List<Ivev001Usuario> ivev001UsuarioList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a002idtipodocumento")
    private List<Ivev001Usuario> ivev001UsuarioList1;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a010idtipocombustible")
    private List<IvetT010Categcombustible> ivetT010CategcombustibleList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a009idtipocombustible")
    private List<Ivev003Categoria> ivev003CategoriaList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a009idtipocatemision")
    private List<Ivev003Categoria> ivev003CategoriaList1;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "a003estadoInventario")
    private List<IvetT003Inventario> ivetT003InventarioList;

    public PartT102Lista() {

    }

    public PartT102Lista(Integer a102codigo) {

        this.a102codigo = a102codigo;
    }

    public PartT102Lista(Integer a102codigo, String a102valor, Character a102estadoregistro, int a102usuariocreacion) {

        this.a102codigo = a102codigo;
        this.a102valor = a102valor;
        this.a102estadoregistro = a102estadoregistro;
        this.a102usuariocreacion = a102usuariocreacion;
    }

    public Integer getA102codigo() {

        return a102codigo;
    }

    public void setA102codigo(Integer a102codigo) {

        this.a102codigo = a102codigo;
    }

    public String getA102valor() {

        return a102valor;
    }

    public void setA102valor(String a102valor) {

        this.a102valor = a102valor;
    }

    public String getA102valorcorto() {

        return a102valorcorto;
    }

    public void setA102valorcorto(String a102valorcorto) {

        this.a102valorcorto = a102valorcorto;
    }

    public Character getA102estadoregistro() {

        return a102estadoregistro;
    }

    public void setA102estadoregistro(Character a102estadoregistro) {

        this.a102estadoregistro = a102estadoregistro;
    }

    public Date getA102fechacreacion() {

        return a102fechacreacion;
    }

    public void setA102fechacreacion(Date a102fechacreacion) {

        this.a102fechacreacion = a102fechacreacion;
    }

    public Date getA102fechamodificacion() {

        return a102fechamodificacion;
    }

    public void setA102fechamodificacion(Date a102fechamodificacion) {

        this.a102fechamodificacion = a102fechamodificacion;
    }

    public int getA102usuariocreacion() {

        return a102usuariocreacion;
    }

    public void setA102usuariocreacion(int a102usuariocreacion) {

        this.a102usuariocreacion = a102usuariocreacion;
    }

    public Integer getA102usuariomodificacion() {

        return a102usuariomodificacion;
    }

    public void setA102usuariomodificacion(Integer a102usuariomodificacion) {

        this.a102usuariomodificacion = a102usuariomodificacion;
    }

    public List<Ivev002Inventario> getIvev002InventarioList() {

        return ivev002InventarioList;
    }

    public void setIvev002InventarioList(List<Ivev002Inventario> ivev002InventarioList) {

        this.ivev002InventarioList = ivev002InventarioList;
    }

    public List<IvetT002Usuario> getIvetT002UsuarioList() {

        return ivetT002UsuarioList;
    }

    public void setIvetT002UsuarioList(List<IvetT002Usuario> ivetT002UsuarioList) {

        this.ivetT002UsuarioList = ivetT002UsuarioList;
    }

    public List<IvetT002Usuario> getIvetT002UsuarioList1() {

        return ivetT002UsuarioList1;
    }

    public void setIvetT002UsuarioList1(List<IvetT002Usuario> ivetT002UsuarioList1) {

        this.ivetT002UsuarioList1 = ivetT002UsuarioList1;
    }

    public PartT101Categoria getA102categoria() {

        return a102categoria;
    }

    public void setA102categoria(PartT101Categoria a102categoria) {

        this.a102categoria = a102categoria;
    }

    public List<IvetT009Categemision> getIvetT009CategemisionList() {

        return ivetT009CategemisionList;
    }

    public void setIvetT009CategemisionList(List<IvetT009Categemision> ivetT009CategemisionList) {

        this.ivetT009CategemisionList = ivetT009CategemisionList;
    }

    public List<IvetT009Categemision> getIvetT009CategemisionList1() {

        return ivetT009CategemisionList1;
    }

    public void setIvetT009CategemisionList1(List<IvetT009Categemision> ivetT009CategemisionList1) {

        this.ivetT009CategemisionList1 = ivetT009CategemisionList1;
    }

    public List<IvetT018CambioEstados> getIvetT018CambioEstadosList() {

        return ivetT018CambioEstadosList;
    }

    public void setIvetT018CambioEstadosList(List<IvetT018CambioEstados> ivetT018CambioEstadosList) {

        this.ivetT018CambioEstadosList = ivetT018CambioEstadosList;
    }

    public List<IvetT018CambioEstados> getIvetT018CambioEstadosList1() {

        return ivetT018CambioEstadosList1;
    }

    public void setIvetT018CambioEstadosList1(List<IvetT018CambioEstados> ivetT018CambioEstadosList1) {

        this.ivetT018CambioEstadosList1 = ivetT018CambioEstadosList1;
    }

    public List<Ivev001Usuario> getIvev001UsuarioList() {

        return ivev001UsuarioList;
    }

    public void setIvev001UsuarioList(List<Ivev001Usuario> ivev001UsuarioList) {

        this.ivev001UsuarioList = ivev001UsuarioList;
    }

    public List<Ivev001Usuario> getIvev001UsuarioList1() {

        return ivev001UsuarioList1;
    }

    public void setIvev001UsuarioList1(List<Ivev001Usuario> ivev001UsuarioList1) {

        this.ivev001UsuarioList1 = ivev001UsuarioList1;
    }

    public List<IvetT010Categcombustible> getIvetT010CategcombustibleList() {

        return ivetT010CategcombustibleList;
    }

    public void setIvetT010CategcombustibleList(List<IvetT010Categcombustible> ivetT010CategcombustibleList) {

        this.ivetT010CategcombustibleList = ivetT010CategcombustibleList;
    }

    public List<Ivev003Categoria> getIvev003CategoriaList() {

        return ivev003CategoriaList;
    }

    public void setIvev003CategoriaList(List<Ivev003Categoria> ivev003CategoriaList) {

        this.ivev003CategoriaList = ivev003CategoriaList;
    }

    public List<Ivev003Categoria> getIvev003CategoriaList1() {

        return ivev003CategoriaList1;
    }

    public void setIvev003CategoriaList1(List<Ivev003Categoria> ivev003CategoriaList1) {

        this.ivev003CategoriaList1 = ivev003CategoriaList1;
    }

    public List<IvetT003Inventario> getIvetT003InventarioList() {

        return ivetT003InventarioList;
    }

    public void setIvetT003InventarioList(List<IvetT003Inventario> ivetT003InventarioList) {

        this.ivetT003InventarioList = ivetT003InventarioList;
    }

    @Override
    public int hashCode() {

        int hash = 0;
        hash += (a102codigo != null ? a102codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PartT102Lista)) {
            return false;
        }
        PartT102Lista other = (PartT102Lista) object;
        if ((this.a102codigo == null && other.a102codigo != null) || (this.a102codigo != null && !this.a102codigo.equals(other.a102codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {

        return "gov.mads.invent.comun.entidad.PartT102Lista[ a102codigo=" + a102codigo + " ]";
    }

}
