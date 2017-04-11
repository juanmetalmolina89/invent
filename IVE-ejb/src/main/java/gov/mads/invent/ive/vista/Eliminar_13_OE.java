package gov.mads.invent.ive.vista;
import gov.mads.invent.comun.vista.ObjetoEntrada;

import gov.mads.invent.comun.entidad.IvetT004Geometria;


import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ivan Chacon
*/
@XmlRootElement
public class Eliminar_13_OE extends ObjetoEntrada {

	@XmlElement
	private IvetT004Geometria ivetT004Geometria;


	public IvetT004Geometria getIvetT004Geometria(){
		return this.ivetT004Geometria;
	}

	public void setIvetT004Geometria(IvetT004Geometria in){
		this.ivetT004Geometria = in;
	}

}
