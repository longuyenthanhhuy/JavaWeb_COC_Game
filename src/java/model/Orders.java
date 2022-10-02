/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author htlvn
 */
@Builder
@Setter
@Getter
@ToString 
public class Orders {
    private int id;
    private int accountID;
    private float totalPrice;
    private String createDate;
    
}
