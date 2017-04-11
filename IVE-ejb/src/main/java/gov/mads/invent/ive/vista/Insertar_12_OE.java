package gov.mads.invent.ive.vista;
import gov.mads.invent.comun.vista.ObjetoEntrada;

import gov.mads.invent.comun.entidad.IvetT005Contaminante;


import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ivan Chacon
*/
@XmlRootElement
public class Insertar_12_OE extends ObjetoEntrada {

	@XmlElement
	private IvetT005Contaminante ivetT005Contaminante;


	public IvetT005Contaminante getIvetT005Contaminante(){
		return this.ivetT005Contaminante;
	}

	public void setIvetT005Contaminante(IvetT005Contaminante in){
		this.ivetT005Contaminante = in;
	}

}
