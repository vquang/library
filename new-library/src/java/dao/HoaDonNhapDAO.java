/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.HoaDonNhap;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import utils.TrangThai;

/**
 *
 * @author Admin
 */
public class HoaDonNhapDAO {

    private DBConnect dbConnect;

    public void insert(HoaDonNhap hoaDonNhap) {
        try {
            DBConnect dbConnect = new DBConnect();
            Connection connection = dbConnect.getConnection();
            String sql = "insert into hoadonnhap (ngayNhap, tongTien, nhanVienId, nhaCungCapId) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

            statement.setDate(1, hoaDonNhap.getNgayNhap());
            statement.setDouble(2, hoaDonNhap.getTongTien());
            statement.setInt(3, hoaDonNhap.getNhanVien().getId());
            statement.setInt(4, hoaDonNhap.getNhaCungCap().getId());
            statement.executeUpdate();
            ResultSet generatedKeys = statement.getGeneratedKeys();
            int hoaDonId = 0;
            if (generatedKeys.next()) {
                hoaDonId = generatedKeys.getInt(1);
            }

            System.out.println(hoaDonNhap.getListTaiLieuNhaps().size());
            Map<Integer, Integer> mapTaiLieuIds = new HashMap<>();
            sql = "insert into tailieunhap (soLuong, giaNhap, taiLieuId, hoaDonNhapId) values (?, ?, ?, ?)";
            statement = connection.prepareStatement(sql);
            for (int i = 0; i < hoaDonNhap.getListTaiLieuNhaps().size(); ++i) {
                int taiLieuId = hoaDonNhap.getListTaiLieuNhaps().get(i).getTaiLieu().getId();
                int soLuong = hoaDonNhap.getListTaiLieuNhaps().get(i).getSoLuong();
                statement.setInt(1, soLuong);
                statement.setDouble(2, hoaDonNhap.getListTaiLieuNhaps().get(i).getGiaNhap());
                statement.setInt(3, taiLieuId);
                statement.setInt(4, hoaDonId);
                statement.executeUpdate();
                mapTaiLieuIds.put(taiLieuId, soLuong);
            }

            sql = "update tailieu set soLuong = soLuong + ? where id = ?";
            statement = connection.prepareStatement(sql);
            for (Map.Entry<Integer, Integer> entry : mapTaiLieuIds.entrySet()) {
                int id = entry.getKey();
                int count = entry.getValue();

                statement.setInt(1, count);
                statement.setInt(2, id);
                statement.addBatch();
            }
            statement.executeBatch();

            statement.close();
            connection.close();
        } catch (Exception e) {
            System.out.println(e);
        }

    }
}
