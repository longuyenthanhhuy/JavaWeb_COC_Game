/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.util.Locale;
import java.util.Random;

/**
 *
 * @author htlvn
 */
public class Validate {
    public static String getRandom(){
        Random ran= new Random();
        int num= ran.nextInt(999999);
        return String.format("%06d",num);
    }
}
