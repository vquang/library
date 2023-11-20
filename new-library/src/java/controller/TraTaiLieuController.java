/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import dao.MuonTaiLieuDAO;
import dao.TraTaiLieuDAO;
import entity.HoaDonTra;
import entity.PhieuMuon;
import entity.PhieuTra;
import entity.TaiLieu;
import entity.TaiLieuMuon;
import entity.ThanhVien;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import utils.Time;
import utils.VaiTro;

/**
 *
 * @author Admin
 */
public class TraTaiLieuController extends HttpServlet {

    private MuonTaiLieuDAO muonSachDAO = new MuonTaiLieuDAO();
    private TraTaiLieuDAO traSachDAO = new TraTaiLieuDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("search")) {
            int banDocId = Integer.parseInt(request.getParameter("banDocId"));
            List<PhieuMuon> listPhieuMuons = muonSachDAO.getListByBanDoc(banDocId);
            request.setAttribute("listPhieuMuons", listPhieuMuons);
            request.getRequestDispatcher("TraTaiLieu.jsp").forward(request, response);
        } else if (action.equals("create")) {
            ThanhVien banDoc = new ThanhVien(Integer.parseInt(request.getParameter("maBanDoc")), "", "",
                    (String) request.getParameter("hoTenBanDoc"),
                    (String) request.getParameter("soDienThoai"),
                    (String) request.getParameter("diaChi"),
                    (String) request.getParameter("email"),
                    VaiTro.BANDOC.getValue());
            ThanhVien nhanVien = new ThanhVien(Integer.parseInt(request.getParameter("maNhanVien")), "", "",
                    (String) request.getParameter("hoTenNhanVien"), "", "", "",
                    VaiTro.NHANVIEN.getValue());

            Date ngayTra = Time.stringToDate(request.getParameter("ngayTra"));
            double tienPhat = Double.parseDouble(request.getParameter("tienPhat"));
            String ghiChu = request.getParameter("ghiChu");

            List<TaiLieuMuon> listTaiLieuTras = new ArrayList<>();
            List<Integer> listTaiLieuIds = new ArrayList<>();
            String jsonString = request.getParameter("listTaiLieuTras");
            JsonArray jsonArray = JsonParser.parseString(jsonString).getAsJsonArray();
            for (int i = 0; i < jsonArray.size(); i++) {
                JsonObject jsonObject = jsonArray.get(i).getAsJsonObject();
                int id = jsonObject.get("id").getAsInt();
                int taiLieuId = jsonObject.get("taiLieuId").getAsInt();
                String ten = jsonObject.get("ten").getAsString();
                String tacGia = jsonObject.get("tacGia").getAsString();
                Date ngayMuon = Time.stringToDate(jsonObject.get("ngayMuon").getAsString());
                Date ngayPhaiTra = Time.stringToDate(jsonObject.get("ngayPhaiTra").getAsString());

                TaiLieu taiLieu = new TaiLieu(taiLieuId, ten, tacGia, "", -1, "", null);
                TaiLieuMuon taiLieuMuon = new TaiLieuMuon(id, taiLieu, ngayMuon, ngayPhaiTra);
                listTaiLieuTras.add(taiLieuMuon);
                listTaiLieuIds.add(taiLieuId);
            }
            Map<Integer, Integer> mapTaiLieuIds = listTaiLieuIds.stream()
                    .collect(Collectors.groupingBy(e -> e, Collectors.summingInt(e -> 1)));

            PhieuTra phieuTra = new PhieuTra(-1, ngayTra, nhanVien, banDoc, listTaiLieuTras);
            HoaDonTra hoaDon = new HoaDonTra(-1, tienPhat, ghiChu, phieuTra);
            traSachDAO.insert(hoaDon, mapTaiLieuIds);

            request.setAttribute("hoaDonTra", hoaDon);
            request.getRequestDispatcher("HoaDonTra.jsp").forward(request, response);
        }
    }

}
