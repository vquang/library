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
import java.util.List;

/**
 *
 * @author Admin
 */
public class ThanhVienController extends HttpServlet {
    private ThanhVienDAO thanhVienDAO = new ThanhVienDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action.equals("search")) {
            String search = request.getParameter("search");
            List<ThanhVien> list = thanhVienDAO.searchBanDocs(search);
            request.setAttribute("listBanDocs", list);
            String from = request.getParameter("from");
            request.getRequestDispatcher(from).forward(request, response);
        }
    }
}
