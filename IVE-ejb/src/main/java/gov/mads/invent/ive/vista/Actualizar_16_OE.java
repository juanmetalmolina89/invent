package gov.mads.invent.ive.vista;
import gov.mads.invent.comun.vista.ObjetoEntrada;

import gov.mads.invent.comun.entidad.IvetT001Entidad;


import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ivan Chacon
*/
@XmlRootElement
public class Actualizar_16_OE extends ObjetoEntrada {

	@XmlElement
	private IvetT001Entidad ivetT001Entidad;


	public IvetT001Entidad getIvetT001Entidad(){
		return this.ivetT001Entidad;
	}

	public void setIvetT001Entidad(IvetT001Entidad in){
		this.ivetT001Entidad = in;
	}

}
