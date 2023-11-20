/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ThanhVienDAO;
import entity.ThanhVien;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import utils.VaiTro;

/**
 *
 * @author Admin
 */
public class DangNhapController extends HttpServlet {

    private ThanhVienDAO thanhVienDAO = new ThanhVienDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect("DangNhap.jsp");
        }else if (action.equals("login")) {
            int vaiTro = Integer.parseInt(request.getParameter("vaiTro"));
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            ThanhVien thanhVien = new ThanhVien(username, password, vaiTro);
            List<ThanhVien> list = thanhVienDAO.checkLogin(thanhVien);
            if (list.isEmpty()) {
                request.setAttribute("error", true);
                request.getRequestDispatcher("DangNhap.jsp").forward(request, response);
            } else {
                request.getSession().setAttribute("thanhVien", list.get(0));
                request.setAttribute("error", false);
                if (vaiTro == VaiTro.NHANVIEN.getValue()) {
                    response.sendRedirect("/new-library/NhanVienHome.jsp");
                } else {
                    response.sendRedirect("/new-library/bandoc/BanDocHome.jsp");
                }
            }
        } else if (action.equals("logout")) {

            HttpSession session = request.getSession();
            session.removeAttribute("thanhVien");
            response.sendRedirect("DangNhap.jsp");
        }
    }

}
