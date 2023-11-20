/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.HoaDonTra;
import entity.PhieuTra;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;
import utils.TrangThai;

/**
 *
 * @author Admin
 */
public class TraTaiLieuDAO {

    private DBConnect dbConnect;

    public void insert(HoaDonTra hoaDonTra, Map<Integer, Integer> mapTaiLieuIds) {
        try {
            DBConnect dbConnect = new DBConnect();
            Connection connection = dbConnect.getConnection();
            String sql = "insert into phieutra (ngayTra, nhanVienId, banDocId) value (?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            PhieuTra phieuTra = hoaDonTra.getPhieuTra();

            statement.setDate(1, phieuTra.getNgayTra());
            statement.setInt(2, phieuTra.getNhanVien().getId());
            statement.setInt(3, phieuTra.getBanDoc().getId());
            statement.executeUpdate();
            ResultSet generatedKeys = statement.getGeneratedKeys();
            int phieuTraId = 0;
            if (generatedKeys.next()) {
                phieuTraId = generatedKeys.getInt(1);
            }

            sql = "update tailieumuon set trangThai = ?, phieuTraId = ? WHERE id = ?";
            statement = connection.prepareStatement(sql);
            for (int i = 0; i < phieuTra.getListTaiLieuMuons().size(); ++i) {
                int taiLieuTraId = phieuTra.getListTaiLieuMuons().get(i).getId();
                statement.setInt(1, TrangThai.DATRA.getValue());
                statement.setInt(2, phieuTraId);
                statement.setInt(3, taiLieuTraId);
                statement.executeUpdate();

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

            System.out.println(hoaDonTra.getTienPhat() + ", " + hoaDonTra.getGhiChu() + ", " + phieuTraId);
            sql = "insert into hoadontra (tienPhat, ghiChu, phieuTraId) values (?, ?, ?)";
            statement = connection.prepareStatement(sql);
            statement.setDouble(1, hoaDonTra.getTienPhat());
            statement.setString(2, hoaDonTra.getGhiChu());
            statement.setInt(3, phieuTraId);
            statement.executeUpdate();

            statement.close();
            connection.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
