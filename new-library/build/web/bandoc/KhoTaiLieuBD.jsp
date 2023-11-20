<%-- 
    Document   : BanDocHome
    Created on : Nov 20, 2023, 12:01:47 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../styles.css">
        <link rel="stylesheet" type="text/css" href="../icons/css/all.css">
    </head>
    <body>
        <div class="header">
            <div class="header-left">
                <a class="a-btn header-btn" href="TaiLieuBanDocController?action=home">Trang Chủ</a>
                <a class="a-btn header-btn header-btn-active" href="TaiLieuBanDocController?action=view">Kho Tài Liệu</a>
            </div>
            <a class="a-btn header-btn" href="/new-library/DangNhapController?action=logout">Đăng Xuất</a>
        </div>
        <div class="container" style="margin-top:50px;">
            <div class="search-frame center">
                <div class="search-item" style="width:40%; border:none">
                    <form action="TaiLieuBanDocController" method="post">
                        <div class="search-group">
                            <h3 style="margin-right:50px;">Tìm Tài Liệu:</h3>
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
                            <a class="content-item" href="TaiLieuBanDocController?action=show&id=${taiLieu.id}">
                                <img class="content-item-image" src="/new-library/${taiLieu.anhBia}" />
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
