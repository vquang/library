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
                <a class="a-btn header-btn header-btn-active" href="TaiLieuBanDocController?action=home">Trang Chủ</a>
                <a class="a-btn header-btn" href="TaiLieuBanDocController?action=view">Kho Tài Liệu</a>
            </div>
            <a class="a-btn header-btn" href="/new-library/DangNhapController?action=logout">Đăng Xuất</a>
        </div>
        <div class="container" style="margin-top:50px;">
            
            <c:choose>
                <c:when test="${not empty listTKTaiLieus}">
                    <div class="content-frame" style="margin-top:100px">
                        <h1>Top 5 Phổ Biến</h1>
                        <div class="content" style="width:100%;">
                            <c:forEach var="tkTaiLieu" items="${listTKTaiLieus}" varStatus="loop">
                                <c:if test="${loop.index < 5}">
                                    <a class="content-item" href="TaiLieuBanDocController?action=show&id=${tkTaiLieu.taiLieu.id}">
                                        <img class="content-item-image" src="/new-library/${tkTaiLieu.taiLieu.anhBia}" />
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
                                <a class="content-item" href="TaiLieuBanDocController?action=show&id=${tkTaiLieu.taiLieu.id}">
                                    <img class="content-item-image" src="/new-library/${tkTaiLieu.taiLieu.anhBia}" />
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
