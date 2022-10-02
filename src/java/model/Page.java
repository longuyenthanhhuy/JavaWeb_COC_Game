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
public class Page {

    private int page;//
    private int sizePage;//
    private int totalItem;// 
    private int totalPage;
    private int begin;
    private int end;
    private int pageStart;
    private int pageEnd;
   

    public void calc() {
        totalPage = (totalItem + sizePage - 1) / sizePage;
        page = page < 1 ? 1 : page;
        page = page > totalPage ? totalPage : page;
        begin = (page - 1) * sizePage;
        end = page * sizePage;
        end = end > totalItem ? totalItem : end;
        pageStart = page - 2;
        pageStart = pageStart < 1 ? 1 : pageStart;
        pageEnd = page + 2;
        pageEnd = pageEnd > totalPage ? totalPage : pageEnd;
    }
}
