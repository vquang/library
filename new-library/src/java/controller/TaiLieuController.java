/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.TaiLieuDAO;
import dao.ThongKeDAO;
import entity.TaiLieu;
import entity.ThongKeTaiLieu;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Admin
 */
public class TaiLieuController extends HttpServlet {

    private TaiLieuDAO taiLieuDAO = new TaiLieuDAO();
    private ThongKeDAO thongKeDAO = new ThongKeDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String from = request.getParameter("from");
        if (action == null || action.equals("view")) {
            List<TaiLieu> list = taiLieuDAO.getList();
            request.setAttribute("listTaiLieus", list);
            request.getRequestDispatcher("KhoTaiLieu.jsp").forward(request, response);
        } else if (action.equals("show")) {
            TaiLieu taiLieu = taiLieuDAO.getById(Integer.parseInt(request.getParameter("id")));
            request.getSession().setAttribute("taiLieu", taiLieu);
            if (from != null && from.equals("home")) {
                from = "XemTaiLieu.jsp";
            } else {
                from = "CapNhatTaiLieu.jsp";
            }
            request.getRequestDispatcher(from).forward(request, response);
        } else if (action.equals("update")) {
            int id = Integer.parseInt(request.getParameter("id"));
            String ten = (String) request.getParameter("ten");
            String tacGia = (String) request.getParameter("tacGia");
            String moTa = (String) request.getParameter("moTa");
            String anhBia = (String) request.getParameter("anhBia");

            TaiLieu taiLieu = new TaiLieu(id, ten, tacGia, moTa, 0, anhBia, null);
            taiLieuDAO.update(taiLieu);
            request.getSession().removeAttribute("taiLieu");
            request.getRequestDispatcher("TaiLieuController?action=view").forward(request, response);
        } else if (action.equals("search")) {
            String search = (String) request.getParameter("search");
            List<TaiLieu> list = taiLieuDAO.search(search);
            request.setAttribute("listTaiLieus", list);
            request.getRequestDispatcher(from).forward(request, response);
        } else if (action.equals("create")) {
            String ten = (String) request.getParameter("ten");
            String tacGia = (String) request.getParameter("tacGia");
            String moTa = (String) request.getParameter("moTa");
            String anhBia = (String) request.getParameter("anhBia");

            TaiLieu taiLieu = new TaiLieu(-1, ten, tacGia, moTa, 0, anhBia, null);
            taiLieu = taiLieuDAO.insert(taiLieu);
            request.getSession().removeAttribute("taiLieu");
            request.setAttribute("taiLieuMoi", taiLieu);
            request.getRequestDispatcher("NhapTaiLieu.jsp").forward(request, response);
        } else if (action.equals("home")) {
            List<ThongKeTaiLieu> list = thongKeDAO.getListTKTaiLieus("desc");
            request.setAttribute("listTKTaiLieus", list);
            request.getRequestDispatcher("NhanVienHome.jsp").forward(request, response);
        }
    }
}
