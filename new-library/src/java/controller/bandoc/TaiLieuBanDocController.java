/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.bandoc;

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
public class TaiLieuBanDocController extends HttpServlet {

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
        if (action == null || action.equals("view")) {
            List<TaiLieu> list = taiLieuDAO.getList();
            request.setAttribute("listTaiLieus", list);
            request.getRequestDispatcher("/bandoc/KhoTaiLieuBD.jsp").forward(request, response);
        } else if (action.equals("show")) {
            TaiLieu taiLieu = taiLieuDAO.getById(Integer.parseInt(request.getParameter("id")));
            request.getSession().setAttribute("taiLieu", taiLieu);
            request.getRequestDispatcher("/bandoc/XemTaiLieuBD.jsp").forward(request, response);
        } else if (action.equals("search")) {
            String search = (String) request.getParameter("search");
            List<TaiLieu> list = taiLieuDAO.search(search);
            request.setAttribute("listTaiLieus", list);
            request.getRequestDispatcher("/bandoc/KhoTaiLieuBD.jsp").forward(request, response);
        } else if(action.equals("home")) {
            List<ThongKeTaiLieu> list = thongKeDAO.getListTKTaiLieus("desc");
            request.setAttribute("listTKTaiLieus", list);
            request.getRequestDispatcher("/bandoc/BanDocHome.jsp").forward(request, response);
        }
    }

}
