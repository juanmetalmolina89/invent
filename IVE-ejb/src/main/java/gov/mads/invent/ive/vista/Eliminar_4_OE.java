package gov.mads.invent.ive.vista;
import gov.mads.invent.comun.vista.ObjetoEntrada;

import gov.mads.invent.comun.entidad.IvetT016Inventcontamina;


import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ivan Chacon
*/
@XmlRootElement
public class Eliminar_4_OE extends ObjetoEntrada {

	@XmlElement
	private IvetT016Inventcontamina ivetT016Inventcontamina;

	@XmlElement
	private Integer idUsuario;

	public IvetT016Inventcontamina getIvetT016Inventcontamina(){
		return this.ivetT016Inventcontamina;
	}

	public void setIvetT016Inventcontamina(IvetT016Inventcontamina in){
		this.ivetT016Inventcontamina = in;
	}
	public Integer getidUsuario(){
		return this.idUsuario;
	}

	public void setidUsuario(Integer in){
		this.idUsuario = in;
	}

}
