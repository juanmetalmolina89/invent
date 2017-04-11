package gov.mads.invent.ive.vista;
import gov.mads.invent.comun.vista.ObjetoEntrada;


import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ivan Chacon
*/
@XmlRootElement
public class ConsultarLista_0_OE extends ObjetoEntrada {

	@XmlElement
	private String categoria;

	public String getcategoria(){
		return this.categoria;
	}

	public void setcategoria(String in){
		this.categoria = in;
	}

}
