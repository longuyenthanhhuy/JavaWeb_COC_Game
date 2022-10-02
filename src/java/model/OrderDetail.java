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
public class OrderDetail {
    private int id;
    private int orderID;
   
    private int productID;
}
