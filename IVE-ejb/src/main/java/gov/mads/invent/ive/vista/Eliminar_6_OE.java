package gov.mads.invent.ive.vista;
import gov.mads.invent.comun.vista.ObjetoEntrada;

import gov.mads.invent.comun.entidad.IvetT013Categcontamina;


import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ivan Chacon
*/
@XmlRootElement
public class Eliminar_6_OE extends ObjetoEntrada {

	@XmlElement
	private IvetT013Categcontamina ivetT013Categcontamina;

	@XmlElement
	private Integer idUsuario;

	public IvetT013Categcontamina getIvetT013Categcontamina(){
		return this.ivetT013Categcontamina;
	}

	public void setIvetT013Categcontamina(IvetT013Categcontamina in){
		this.ivetT013Categcontamina = in;
	}
	public Integer getidUsuario(){
		return this.idUsuario;
	}

	public void setidUsuario(Integer in){
		this.idUsuario = in;
	}

}
