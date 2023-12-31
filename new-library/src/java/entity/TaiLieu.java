/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.List;

/**
 *
 * @author Admin
 */
public class TaiLieu {

    private int id;
    private String ten;
    private String tacGia;
    private String moTa;
    private int soLuong;
    private String anhBia;
    private List<NhaCungCap> nhaCungCap;

    public TaiLieu() {

    }

    public TaiLieu(int id, String ten, String tacGia, String moTa, int soLuong, String anhBia, List<NhaCungCap> nhaCungCap) {
        this.id = id;
        this.ten = ten;
        this.tacGia = tacGia;
        this.moTa = moTa;
        this.soLuong = soLuong;
        this.anhBia = anhBia;
        this.nhaCungCap = nhaCungCap;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getTacGia() {
        return tacGia;
    }

    public void setTacGia(String tacGia) {
        this.tacGia = tacGia;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public String getAnhBia() {
        return anhBia;
    }

    public void setAnhBia(String anhBia) {
        this.anhBia = anhBia;
    }

    public List<NhaCungCap> getNhaCungCap() {
        return nhaCungCap;
    }

    public void setNhaCungCap(List<NhaCungCap> nhaCungCap) {
        this.nhaCungCap = nhaCungCap;
    }

}
