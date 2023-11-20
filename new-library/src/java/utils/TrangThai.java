/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

/**
 *
 * @author Admin
 */
public enum TrangThai {
    DANGMUON(0),
    DATRA(1);
    
    private final int value;
    TrangThai(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }
}
