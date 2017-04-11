/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package gov.mads.invent.ive.vista;

import gov.mads.invent.comun.entidad.IvetT009Categemision;
import gov.mads.invent.comun.vista.ObjetoEntrada;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author carlosivan.rivera
 */
@XmlRootElement
public class CategoriaOE extends ObjetoEntrada {

    @XmlElement
    private IvetT009Categemision categoria;

    public IvetT009Categemision getCategoria() {

        return categoria;
    }

    public void setCategoria(IvetT009Categemision categoria) {

        this.categoria = categoria;
    }
}
