package gov.mads.invent.ive.vista;
import gov.mads.invent.comun.vista.ObjetoEntrada;

import gov.mads.invent.comun.entidad.IvetT007Inventariofuente;


import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ivan Chacon
*/
@XmlRootElement
public class Actualizar_11_OE extends ObjetoEntrada {

	@XmlElement
	private IvetT007Inventariofuente ivetT007Inventariofuente;


	public IvetT007Inventariofuente getIvetT007Inventariofuente(){
		return this.ivetT007Inventariofuente;
	}

	public void setIvetT007Inventariofuente(IvetT007Inventariofuente in){
		this.ivetT007Inventariofuente = in;
	}

}
