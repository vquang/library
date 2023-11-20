/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.PhieuMuon;
import entity.TaiLieu;
import entity.TaiLieuMuon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import java.util.stream.Collectors;
import utils.TrangThai;

/**
 *
 * @author Admin
 */
public class MuonTaiLieuDAO {

    private DBConnect dbConnect;

    public void insert(PhieuMuon phieuMuon) {
        try {
            DBConnect dbConnect = new DBConnect();
            Connection connection = dbConnect.getConnection();

            String sql = "insert into phieumuon (ngayMuon, ngayPhaiTra, nhanVienId, banDocId) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

            statement.setDate(1, phieuMuon.getNgayMuon());
            statement.setDate(2, phieuMuon.getNgayPhaiTra());
            statement.setInt(3, phieuMuon.getNhanVien().getId());
            statement.setInt(4, phieuMuon.getBanDoc().getId());
            statement.executeUpdate();
            ResultSet generatedKeys = statement.getGeneratedKeys();
            int id = 0;
            if (generatedKeys.next()) {
                id = generatedKeys.getInt(1);
            }

            List<Integer> listTaiLieuIds = new ArrayList<>();
            sql = "insert into tailieumuon (trangThai, taiLieuId, phieuMuonId) VALUES (?, ?, ?)";
            statement = connection.prepareStatement(sql);
            for (int i = 0; i < phieuMuon.getListTaiLieuMuons().size(); ++i) {
                int taiLieuId = phieuMuon.getListTaiLieuMuons().get(i).getTaiLieu().getId();
                statement.setInt(1, TrangThai.DANGMUON.getValue());
                statement.setInt(2, taiLieuId);
                statement.setInt(3, id);
                statement.executeUpdate();
                listTaiLieuIds.add(taiLieuId);
            }

            String placeholders = listTaiLieuIds.stream().map(i -> "?").collect(Collectors.joining(", "));
            sql = "update tailieu set soLuong = soLuong - 1 where id in (" + placeholders + ")";
            statement = connection.prepareStatement(sql);
            int index = 1;
            for (int taiLieuId : listTaiLieuIds) {
                statement.setInt(index++, taiLieuId);
            }
            statement.executeUpdate();

            statement.close();
            connection.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public List<PhieuMuon> getListByBanDoc(int banDocId) {
        List<PhieuMuon> list = new ArrayList<>();
        try {
            DBConnect dbConnect = new DBConnect();
            Connection connection = dbConnect.getConnection();
            String sql = "select * from phieumuon join tailieumuon "
                    + "on phieumuon.id = tailieumuon.phieuMuonId "
                    + "join tailieu "
                    + "on tailieu.id = tailieumuon.taiLieuId "
                    + "where phieumuon.banDocId = ? and tailieumuon.trangThai = 0";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, banDocId);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("phieumuon.id");
                Date ngayMuon = resultSet.getDate("phieumuon.ngayMuon");
                Date ngayPhaiTra = resultSet.getDate("phieumuon.ngayPhaiTra");

                int taiLieuMuonId = resultSet.getInt("tailieumuon.id");
                int trangThai = resultSet.getInt("tailieumuon.trangThai");

                int taiLieuId = resultSet.getInt("tailieu.id");
                String ten = resultSet.getString("tailieu.ten");
                String tacGia = resultSet.getString("tailieu.tacgia");

                TaiLieu taiLieu = new TaiLieu(taiLieuId, ten, tacGia, "", -1, "", null);
                TaiLieuMuon taiLieuMuon = new TaiLieuMuon(taiLieuMuonId, taiLieu);

                boolean check = false;
                for (PhieuMuon phieuMuon : list) {

                    if (phieuMuon.getId() == id) {
                        check = true;
                        phieuMuon.getListTaiLieuMuons().add(taiLieuMuon);
                        break;
                    }
                }
                if (!check) {
                    PhieuMuon phieuMuon2 = new PhieuMuon(id, ngayMuon, ngayPhaiTra, null, null, new ArrayList<>());
                    List<TaiLieuMuon> listTaiLieuMuons = new ArrayList<>();
                    listTaiLieuMuons.add(taiLieuMuon);
                    phieuMuon2.setListTaiLieuMuons(listTaiLieuMuons);
                    list.add(phieuMuon2);
                }
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
