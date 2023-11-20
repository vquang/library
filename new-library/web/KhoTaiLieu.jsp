<%-- 
    Document   : NhanVienHome
    Created on : Nov 19, 2023, 3:06:22 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
        <link rel="stylesheet" type="text/css" href="icons/css/all.css">
    </head>
    <body>
        <div class="header">
            <a class="a-btn header-btn" href="NhanVienHome.jsp">Trang Chủ</a>
            <a class="a-btn header-btn" href="DangNhapController?action=logout">Đăng Xuất</a>
        </div>
        <div class="menu">
            <a href="TaiLieuController?action=view" class="a-btn menu-btn menu-active">Kho Tài Liệu</a>
            <a href="MuonTaiLieu.jsp?clear=true" class="a-btn menu-btn">Mượn Sách</a>
            <a href="TraTaiLieu.jsp?clear=true" class="a-btn menu-btn">Trả Sách</a>
            <a href="NhapTaiLieu.jsp?clear=true" class="a-btn menu-btn">Nhập Sách</a>
            <a href="ThongKe.jsp?clear=true" class="a-btn menu-btn">Thống Kê</a>
        </div>
        <div class="container">
            <div class="search-frame center">
                <div class="search-item" style="width:40%; border:none">
                    <form action="TaiLieuController" method="post">
                        <div class="search-group">
                            <h3 style="margin-right:50px;">Tìm Tài Liệu:</h3>
                            <input type="hidden" name="from" value="KhoTaiLieu.jsp" />
                            <input type="hidden" name="action" value="search" />
                            <input class="search-inp" type="text" placeholder="search..." name="search" />
                            <button class="search-btn"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </div>
                    </form>
                </div>

            </div>
            <c:choose>
                <c:when test="${not empty listTaiLieus}">
                    <div class="content">
                        <c:forEach var="taiLieu" items="${listTaiLieus}">
                            <a class="content-item" href="TaiLieuController?action=show&id=${taiLieu.id}">
                                <img class="content-item-image" src="${taiLieu.anhBia}" />
                                <span class="content-item-text" style="color:black;font-size: 20px;">${taiLieu.ten}</span>
                                <span class="content-item-text" >Tác giả: ${taiLieu.tacGia}</span>
                                <span class="content-item-text" >Số lượng: ${taiLieu.soLuong}</span>
                            </a>
                        </c:forEach>
                    </div>
                </c:when>
            </c:choose>
        </div>
    </body>
</html>
