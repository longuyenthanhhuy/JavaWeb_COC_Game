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

//@Data
@Builder
@Getter
@Setter
@ToString
public class Product {
    private  int id;
    private  String name;
    private double price;
    private String description;
    private String image;
    private String createDate;
    private int categoryID;
    private String category;


}
