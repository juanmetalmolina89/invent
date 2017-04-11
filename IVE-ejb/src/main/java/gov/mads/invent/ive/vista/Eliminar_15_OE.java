package gov.mads.invent.ive.vista;
import gov.mads.invent.comun.vista.ObjetoEntrada;

import gov.mads.invent.comun.entidad.IvetT002Usuario;


import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ivan Chacon
*/
@XmlRootElement
public class Eliminar_15_OE extends ObjetoEntrada {

	@XmlElement
	private IvetT002Usuario ivetT002Usuario;


	public IvetT002Usuario getIvetT002Usuario(){
		return this.ivetT002Usuario;
	}

	public void setIvetT002Usuario(IvetT002Usuario in){
		this.ivetT002Usuario = in;
	}

}
