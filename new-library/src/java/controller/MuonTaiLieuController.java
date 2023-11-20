/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import dao.MuonTaiLieuDAO;
import entity.PhieuMuon;
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
import utils.Time;
import utils.VaiTro;

/**
 *
 * @author Admin
 */
public class MuonTaiLieuController extends HttpServlet {

    private MuonTaiLieuDAO muonTaiLieuDAO = new MuonTaiLieuDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("clear", true);
        request.getRequestDispatcher("MuonTaiLieu.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ThanhVien banDoc = new ThanhVien(Integer.parseInt(request.getParameter("maBanDoc")), "", "",
                (String) request.getParameter("hoTenBanDoc"),
                (String) request.getParameter("soDienThoai"),
                (String) request.getParameter("diaChi"),
                (String) request.getParameter("email"),
                VaiTro.BANDOC.getValue());
        ThanhVien nhanVien = new ThanhVien(Integer.parseInt(request.getParameter("maNhanVien")), "", "",
                (String) request.getParameter("hoTenNhanVien"), "", "", "",
                VaiTro.NHANVIEN.getValue());

        Date ngayMuon = Time.stringToDate(request.getParameter("ngayMuon"));
        Date ngayPhaiTra = Time.stringToDate(request.getParameter("ngayPhaiTra"));
        
        List<TaiLieuMuon> listTaiLieuMuons = new ArrayList<>();
        String jsonString = request.getParameter("listTaiLieuMuons");
        JsonArray jsonArray = JsonParser.parseString(jsonString).getAsJsonArray();
        for (int i = 0; i < jsonArray.size(); i++) {
            JsonObject jsonObject = jsonArray.get(i).getAsJsonObject();
            int id = jsonObject.get("id").getAsInt();
            String ten = jsonObject.get("ten").getAsString();
            String tacGia = jsonObject.get("tacGia").getAsString();
            
            TaiLieu taiLieu = new TaiLieu(id, ten, tacGia, "", -1, "", null);
            TaiLieuMuon taiLieuMuon = new TaiLieuMuon(-1, taiLieu);
            listTaiLieuMuons.add(taiLieuMuon);
        }
        
        PhieuMuon phieuMuon = new PhieuMuon(-1, ngayMuon, ngayPhaiTra, nhanVien, banDoc, listTaiLieuMuons);
        muonTaiLieuDAO.insert(phieuMuon);

        request.setAttribute("phieuMuon", phieuMuon);
        request.getRequestDispatcher("PhieuMuon.jsp").forward(request, response);
    }
}
