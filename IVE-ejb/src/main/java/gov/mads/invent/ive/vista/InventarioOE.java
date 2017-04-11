package gov.mads.invent.ive.vista;

import gov.mads.invent.comun.entidad.IvetT003Inventario;
import gov.mads.invent.comun.vista.ObjetoEntrada;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement
public class InventarioOE extends ObjetoEntrada {

    @XmlElement
    private IvetT003Inventario inventario;

    @XmlElement
    private Object geometria;

    @XmlElement
    private Object adjunto;

    public IvetT003Inventario getInventario() {

        return inventario;
    }

    public void setInventario(IvetT003Inventario inventario) {

        this.inventario = inventario;
    }

    public Object getGeometria() {

        return geometria;
    }

    public void setGeometria(Object geometria) {

        this.geometria = geometria;
    }

    public Object getAdjunto() {

        return adjunto;
    }

    public void setAdjunto(Object adjunto) {

        this.adjunto = adjunto;
    }
}
