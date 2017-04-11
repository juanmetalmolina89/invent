package gov.mads.invent.ive.vista;
import gov.mads.invent.comun.vista.ObjetoEntrada;


import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ivan Chacon
*/
@XmlRootElement
public class ConsultarGrilla_20_OE extends ObjetoEntrada {

	@XmlElement
	private String PalabraClave;

	public String getPalabraClave(){
		return this.PalabraClave;
	}

	public void setPalabraClave(String in){
		this.PalabraClave = in;
	}

}
