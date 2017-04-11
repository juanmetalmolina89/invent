/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gov.mads.invent.comun.modelo;

import static java.lang.System.out;
import java.math.BigInteger;

import java.nio.charset.Charset;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.Date;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

/**
 *
 * @author juanmetalmolina
 */
public class SeguridadAdaptador {
    public SeguridadAdaptador() {
    }
    public static boolean ValidarMAC (String macRecibido, String datos) {
        
        boolean valido = false;
        
        String macGenerado = getMD5(datos);
        
        if (macGenerado.equals(macRecibido))
            valido = true;
        
        return valido;
    }
    
    public static int ValidarToken (String tokenRecibido, String llaveEnc) {
        
        String tokenDes = Desencriptar(tokenRecibido, llaveEnc);
        
        if (tokenDes.length() != 24) {
            return 1;
        }
        
        if ( !tokenDes.startsWith("SIAC")  )
            return 2;
        
        String fecha = tokenDes.substring(5);
        
        System.out.println("HPC Fecha recibida: " + fecha);
        
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        
        Date fechaRecibida = null;
        try
           {
             fechaRecibida = simpleDateFormat.parse(fecha);
           }
        catch (ParseException ex)
        {
            return 3;
        }

        Date fechaSistema = new Date();
        System.out.println("HPC Fecha sistema: " + fechaSistema);
        
        Long difTiempo = ( fechaSistema.getTime() - fechaRecibida.getTime()) / 1000;

        System.out.println("Diferencia: " + difTiempo);
        
        if (difTiempo > new Long(ParametroAdaptador.GetParametro("TIEMPO_VENCIMIENTO")) )
            return 4;
        
        return 0;
        
    }

    public static String getMD5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());
            BigInteger number = new BigInteger(1, messageDigest);
            String hashtext = number.toString(16);
            // Now we need to zero pad it if you actually want the full 32 chars.
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    public static void entry() {
    }

    public static String Encriptar(String cadena, String semilla) {

        try {
            String claveEncriptada = null;
            String claveOriginal = cadena;

            SecretKeySpec desKey = new SecretKeySpec(new String((semilla.trim().concat("99999999")).substring(0, 8)).getBytes("ASCII"), "DES");
            Cipher cipher = Cipher.getInstance("DES/ECB/NoPadding");
            cipher.init(Cipher.ENCRYPT_MODE, desKey);

            byte[] claveEncriptadaBytes = cipher.doFinal(claveOriginal.getBytes());

            claveEncriptada = encode(claveEncriptadaBytes);

            return claveEncriptada;
        } catch (Exception error) {
            return null;
        }
    }

    public static String Desencriptar(String cadena, String semilla) {

        try {
            String cadenaDesencriptada = null;
            byte[] claveDesc = decode(cadena);

            SecretKeySpec desKey = new SecretKeySpec(new String((semilla.trim().concat("99999999")).substring(0, 8)).getBytes("ASCII"), "DES");

            Cipher cipher = Cipher.getInstance("DES/ECB/NoPadding");

            cipher.init(Cipher.DECRYPT_MODE, desKey);

            cadenaDesencriptada = new String(cipher.doFinal(claveDesc));
            return cadenaDesencriptada;

        } catch (Exception error) {
            return null;
        }
    }

    private static char[] map1 = new char[64];

    static {
        int i = 0;
        for (char c = 'A'; c <= 'Z'; c++) {
            map1[i++] = c;
        }
        for (char c = 'a'; c <= 'z'; c++) {
            map1[i++] = c;
        }
        for (char c = '0'; c <= '9'; c++) {
            map1[i++] = c;
        }
        map1[i++] = '+';
        map1[i++] = '/';
    }

    // Mapping table from Base64 characters to 6-bit nibbles.
    private static byte[] map2 = new byte[128];

    static {
        for (int i = 0; i < map2.length; i++) {
            map2[i] = -1;
        }
        for (int i = 0; i < 64; i++) {
            map2[map1[i]] = (byte) i;
        }
    }

    public static String encode(byte[] in) {
        int iOff = 0;
        int iLen = in.length;
        int oDataLen = (iLen * 4 + 2) / 3;       // output length without padding
        int oLen = ((iLen + 2) / 3) * 4;         // output length including padding
        char[] out = new char[oLen];
        int ip = iOff;
        int iEnd = iOff + iLen;
        int op = 0;
        while (ip < iEnd) {
            int i0 = in[ip++] & 0xff;
            int i1 = ip < iEnd ? in[ip++] & 0xff : 0;
            int i2 = ip < iEnd ? in[ip++] & 0xff : 0;
            int o0 = i0 >>> 2;
            int o1 = ((i0 & 3) << 4) | (i1 >>> 4);
            int o2 = ((i1 & 0xf) << 2) | (i2 >>> 6);
            int o3 = i2 & 0x3F;
            out[op++] = map1[o0];
            out[op++] = map1[o1];
            out[op] = op < oDataLen ? map1[o2] : '=';
            op++;
            out[op] = op < oDataLen ? map1[o3] : '=';
            op++;
        }
        return new String(out);
    }

    public static byte[] decode(String cadena) {

        char[] in;
        int iOff;
        int iLen;
        in = cadena.toCharArray();
        iOff = 0;
        iLen = in.length;
        try {

            if (iLen % 4 != 0) {
                throw new IllegalArgumentException("Length of Base64 encoded input string is not a multiple of 4.");
            }

            while (iLen > 0 && in[iOff + iLen - 1] == '=') {
                iLen--;
            }
            int oLen = (iLen * 3) / 4;
            byte[] out = new byte[oLen];
            int ip = iOff;
            int iEnd = iOff + iLen;
            int op = 0;
            while (ip < iEnd) {
                int i0 = in[ip++];
                int i1 = in[ip++];
                int i2 = ip < iEnd ? in[ip++] : 'A';
                int i3 = ip < iEnd ? in[ip++] : 'A';

                if (i0 > 127 || i1 > 127 || i2 > 127 || i3 > 127) {
                    throw new Exception("Illegal character in Base64 encoded data.");
                }

                int b0 = map2[i0];
                int b1 = map2[i1];
                int b2 = map2[i2];
                int b3 = map2[i3];
                if (b0 < 0 || b1 < 0 || b2 < 0 || b3 < 0) {
                    throw new Exception("Illegal character in Base64 encoded data.");
                }
                int o0 = (b0 << 2) | (b1 >>> 4);
                int o1 = ((b1 & 0xf) << 4) | (b2 >>> 2);
                int o2 = ((b2 & 3) << 6) | b3;
                out[op++] = (byte) o0;
                if (op < oLen) {
                    out[op++] = (byte) o1;
                }
                if (op < oLen) {
                    out[op++] = (byte) o2;
                }
            }
            return out;
        } catch (Exception error) {
            return null;
        }

    }
}
