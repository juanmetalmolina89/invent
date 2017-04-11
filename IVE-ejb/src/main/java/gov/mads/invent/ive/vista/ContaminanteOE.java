package gov.mads.invent.ive.vista;

import gov.mads.invent.comun.entidad.IvetT013Categcontamina;
import gov.mads.invent.comun.vista.ObjetoEntrada;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author Ivan Chacon
 */
@XmlRootElement
public class ContaminanteOE extends ObjetoEntrada {

    @XmlElement
    private IvetT013Categcontamina contaminante;

    public IvetT013Categcontamina getContaminante() {

        return this.contaminante;
    }

    public void setContaminante(IvetT013Categcontamina contaminante) {

        this.contaminante = contaminante;
    }
}
