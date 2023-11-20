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
            <a class="a-btn header-btn header-btn-active" href="TaiLieuController?action=home">Trang Chủ</a>
            <a class="a-btn header-btn" href="DangNhapController?action=logout">Đăng Xuất</a>
        </div>
        <div class="menu">
            <a href="TaiLieuController?action=view" class="a-btn menu-btn">Kho Tài Liệu</a>
            <a href="MuonTaiLieu.jsp?clear=true" class="a-btn menu-btn">Mượn Sách</a>
            <a href="TraTaiLieu.jsp?clear=true" class="a-btn menu-btn">Trả Sách</a>
            <a href="NhapTaiLieu.jsp?clear=true" class="a-btn menu-btn">Nhập Sách</a>
            <a href="ThongKe.jsp?clear=true" class="a-btn menu-btn">Thống Kê</a>
        </div>
        <div class="container">
            <c:choose>
                <c:when test="${not empty listTKTaiLieus}">
                    <div class="content-frame">
                        <h1>Top 5 Phổ Biến</h1>
                        <div class="content" style="width:100%;">
                            <c:forEach var="tkTaiLieu" items="${listTKTaiLieus}" varStatus="loop">
                                <c:if test="${loop.index < 5}">
                                    <a class="content-item" href="TaiLieuController?action=show&from=home&id=${tkTaiLieu.taiLieu.id}">
                                        <img class="content-item-image" src="${tkTaiLieu.taiLieu.anhBia}" />
                                        <span class="content-item-text" style="color:black;font-size: 20px;">${tkTaiLieu.taiLieu.ten}</span>
                                        <span class="content-item-text" >Tác giả: ${tkTaiLieu.taiLieu.tacGia}</span>
                                        <span class="content-item-text" >Số lượng: ${tkTaiLieu.taiLieu.soLuong}</span>
                                    </a>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="content-frame" style="margin-top:50px">
                        <h1>Kho Tài Liệu</h1>
                        <div class="content" style="width:100%;">
                            <c:forEach var="tkTaiLieu" items="${listTKTaiLieus}">
                                <a class="content-item" href="TaiLieuController?action=show&from=home&id=${tkTaiLieu.taiLieu.id}">
                                    <img class="content-item-image" src="${tkTaiLieu.taiLieu.anhBia}" />
                                    <span class="content-item-text" style="color:black;font-size: 20px;">${tkTaiLieu.taiLieu.ten}</span>
                                    <span class="content-item-text" >Tác giả: ${tkTaiLieu.taiLieu.tacGia}</span>
                                    <span class="content-item-text" >Số lượng: ${tkTaiLieu.taiLieu.soLuong}</span>
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                </c:when>
            </c:choose>
        </div>
    </body>
</html>
