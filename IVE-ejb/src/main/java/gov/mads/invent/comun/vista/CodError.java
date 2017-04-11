/*
 * Objeto codificacion de error
 */

package gov.mads.invent.comun.vista;

import com.fasterxml.jackson.annotation.JsonValue;

import java.util.HashMap;
import java.util.Map;

public enum CodError {

    OPERACION_CORRECTA(0),
    FILTRO_NULO(1),
    NUMERO_INVALIDO(2),
    ERROR_EN_EL_VALOR(3),
    ID_NULO(4),
    NO_SE_ENCONTRARON_DATOS(5),
    ERROR_AL_CONSULTAR_DATOS(6),
    REGISTRO_INACTIVO(7),
    USUARIO_NULO(8),
    CONTRASENA_ANTERIOR_NULA(9),
    CONTRASENA_NUEVA_NULA(10),
    CONTRASENA_NULA(11),
    ERROR_INTERNO(99),
    MENSAJE_NO_PARAMETRIZADO(999);

    private static final Map<Integer, CodError> typesByValue = new HashMap<Integer, CodError>();

    static {
        for (CodError type : CodError.values()) {
            typesByValue.put(type.valor, type);
        }
    }

    private final Integer valor;

    private CodError(Integer valor) {

        this.valor = valor;
    }

    public static CodError forValue(Integer value) {

        if (value > 99)
            value = 999;
        return typesByValue.get(value);
    }

    @JsonValue
    public Integer getValor() {

        return this.valor;
    }
}
