/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import dao.HoaDonNhapDAO;
import entity.HoaDonNhap;
import entity.NhaCungCap;
import entity.TaiLieu;
import entity.TaiLieuNhap;
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
public class NhapTaiLieuController extends HttpServlet {
    private HoaDonNhapDAO hoaDonNhapDAO = new HoaDonNhapDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("NhapTaiLieu.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ThanhVien nhanVien = new ThanhVien(Integer.parseInt(request.getParameter("maNhanVien")), "", "",
                (String) request.getParameter("hoTenNhanVien"), "", "", "",
                VaiTro.NHANVIEN.getValue());
        NhaCungCap nhaCungCap = new NhaCungCap(Integer.parseInt(request.getParameter("maNCC")),
                (String) request.getParameter("tenNCC"),
                (String) request.getParameter("diaChi"),
                (String) request.getParameter("soDienThoai"));
        Date ngayNhap = Time.stringToDate(request.getParameter("ngayNhap"));
        double tongTien = Double.parseDouble(request.getParameter("tongTien"));
        
        List<TaiLieuNhap> listTaiLieuNhaps = new ArrayList<>();
        // Lấy giá trị JSON từ request
        String jsonString = request.getParameter("listTaiLieuNhaps");
        // Chuyển đổi giá trị JSON thành mảng đối tượng
        JsonArray jsonArray = JsonParser.parseString(jsonString).getAsJsonArray();
        for (int i = 0; i < jsonArray.size(); i++) {
            JsonObject jsonObject = jsonArray.get(i).getAsJsonObject();
            int id = jsonObject.get("id").getAsInt();
            String ten = jsonObject.get("ten").getAsString();
            String tacGia = jsonObject.get("tacGia").getAsString();
            int soLuong = jsonObject.get("soLuong").getAsInt();
            double giaNhap = jsonObject.get("giaNhap").getAsDouble();
            
            TaiLieu taiLieu = new TaiLieu(id, ten, tacGia, "", -1, "", null);
            TaiLieuNhap taiLieuNhap = new TaiLieuNhap(-1, soLuong, giaNhap, taiLieu);
            listTaiLieuNhaps.add(taiLieuNhap);
        }
        
        HoaDonNhap hoaDonNhap = new HoaDonNhap(-1, ngayNhap, tongTien, nhanVien, nhaCungCap, listTaiLieuNhaps);
        hoaDonNhapDAO.insert(hoaDonNhap);
        
        request.setAttribute("hoaDonNhap", hoaDonNhap);
        request.getRequestDispatcher("HoaDonNhap.jsp").forward(request, response);
    }
}
