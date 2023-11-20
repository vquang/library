/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.ThanhVien;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.VaiTro;

/**
 *
 * @author Admin
 */
public class ThanhVienDAO {

    private DBConnect dbConnect;

    public List<ThanhVien> checkLogin(ThanhVien thanhVien) {
        List<ThanhVien> list = new ArrayList<>();
        try {
            DBConnect dbConnect = new DBConnect();
            Connection connection = dbConnect.getConnection();
            String sql = "select * from thanhvien where username = ? and password = ? and vaiTro = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, thanhVien.getUsername());
            statement.setString(2, thanhVien.getPassword());
            statement.setInt(3, thanhVien.getVaiTro());
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String hoTen = resultSet.getString("hoTen");
                String soDienThoai = resultSet.getString("soDienThoai");
                String diaChi = resultSet.getString("diaChi");
                String email = resultSet.getString("email");
                int vaiTro = resultSet.getInt("vaiTro");

                ThanhVien tv = new ThanhVien(id, "", "", hoTen, soDienThoai, diaChi, email, vaiTro);
                list.add(tv);
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<ThanhVien> searchBanDocs(String searchName) {
        List<ThanhVien> list = new ArrayList<>();
        try {
            DBConnect dbConnect = new DBConnect();
            Connection connection = dbConnect.getConnection();
            String sql = "select * from thanhvien where hoTen like ? and vaiTro = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + searchName + "%");
            statement.setInt(2, VaiTro.BANDOC.getValue());
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String hoTen = resultSet.getString("hoTen");
                String soDienThoai = resultSet.getString("soDienThoai");
                String diaChi = resultSet.getString("diaChi");
                String email = resultSet.getString("email");
                int vaiTro = resultSet.getInt("vaiTro");

                ThanhVien tv = new ThanhVien(id, "", "", hoTen, soDienThoai, diaChi, email, vaiTro);
                list.add(tv);
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
