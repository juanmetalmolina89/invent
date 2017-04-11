package gov.mads.invent.ive.vista;
import gov.mads.invent.comun.vista.ObjetoEntrada;


import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ivan Chacon
*/
@XmlRootElement
public class ConsultarPorFiltro_11_OE extends ObjetoEntrada {

	@XmlElement
	private String filtro;

	public String getfiltro(){
		return this.filtro;
	}

	public void setfiltro(String in){
		this.filtro = in;
	}

}
