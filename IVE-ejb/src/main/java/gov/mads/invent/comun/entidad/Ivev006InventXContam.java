/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package gov.mads.invent.comun.entidad;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @author Jorge
 */
@Entity
@Table(name = "IVEV_006_INVENT_X_CONTAM")
@NamedQueries({@NamedQuery(name = "Ivev006InventXContam.findAll", query = "SELECT i FROM Ivev006InventXContam i")})
public class Ivev006InventXContam implements Serializable {

    private static final long serialVersionUID = 1L;
    @Column(name = "DUMMY")
    private String dummy;

    public Ivev006InventXContam() {

    }

    public String getDummy() {

        return dummy;
    }

    public void setDummy(String dummy) {

        this.dummy = dummy;
    }

}
