<%-- 
    Document   : ThongKe
    Created on : Nov 20, 2023, 10:31:21 AM
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
        <c:if test="${param.clear == 'true'}">
            <script>
                localStorage.clear();
                localStorage.setItem("searchType", 'tl');
                localStorage.setItem("thuTu", 'asc');
            </script>
            <c:set var="param.clear" value="false"/>
        </c:if>
        <div class="header">
            <a class="a-btn header-btn" href="TaiLieuController?action=home">Trang Chủ</a>
            <a class="a-btn header-btn" href="DangNhapController?action=logout">Đăng Xuất</a>
        </div>
        <div class="menu">
            <a href="TaiLieuController?action=view" class="a-btn menu-btn">Kho Tài Liệu</a>
            <a href="MuonTaiLieu.jsp?clear=true" class="a-btn menu-btn">Mượn Sách</a>
            <a href="TraTaiLieu.jsp?clear=true" class="a-btn menu-btn">Trả Sách</a>
            <a href="NhapTaiLieu.jsp?clear=true" class="a-btn menu-btn">Nhập Sách</a>
            <a href="ThongKe.jsp?clear=true" class="a-btn menu-btn menu-active">Thống Kê</a>
        </div>
        <div class="container">
            <div class="search-frame start" style="padding:0">
                <form id="tl" action="ThongKeController" method="post" onsubmit="return changeSearch(this)">
                    <input type="hidden" name="loai" value="taiLieu" />
                    <input type="hidden" name="thuTu" value="asc" />
                    <button type="submit" class="tk-btn tk-btn-active">Thống Kê Tài Liệu Theo Số Lượt Mượn</button>
                </form>
                <form id="bd" action="ThongKeController" method="post" onsubmit="return changeSearch(this)">
                    <input type="hidden" name="loai" value="banDoc" />
                    <input type="hidden" name="thuTu" value="asc" />
                    <button type="submit" class="tk-btn">Thống Kê Bạn Đọc Theo Số Lượt Mượn</button>
                </form>
            </div>
            <div class="container-content" style="background: transparent;" >
                <div style="width:60%; margin:auto;">
                    <c:choose>
                        <c:when test="${not empty listTKTaiLieus}">
                            <div class="table-frame">
                                <table id="tl" class="table-shadow" style="background: white;">
                                    <tr>
                                        <th>Mã Tài Liệu</th>
                                        <th>Tên Tài Liệu</th>
                                        <th>Tác Giả</th>
                                        <th>Số Lượng</th>
                                        <th onclick="changeThuTu(this)">Số Lượt Mượn <i class="arrow fa-solid fa-arrow-up"></i></th>
                                    </tr>
                                    <c:forEach var="tkTaiLieu" items="${listTKTaiLieus}">
                                        <tr>
                                            <td>${tkTaiLieu.taiLieu.id}</td>
                                            <td>${tkTaiLieu.taiLieu.ten}</td>
                                            <td>${tkTaiLieu.taiLieu.tacGia}</td>
                                            <td>${tkTaiLieu.taiLieu.soLuong}</td>
                                            <td style="color:red; font-weight: bold">${tkTaiLieu.soLuotMuon}</td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </c:when>
                    </c:choose>
                    <c:choose>
                        <c:when test="${not empty listTKBanDocs}">
                            <div class="table-frame" style="width:100%;">
                                <table class="table-shadow" style="background: white;">
                                    <tr>
                                        <th>Mã</th>
                                        <th>Họ Tên</th>
                                        <th>Số Điện Thoại</th>
                                        <th>Địa Chỉ</th>
                                        <th>Email</th>
                                        <th onclick="changeThuTu(this)">Số Lượt Mượn <i class="arrow fa-solid fa-arrow-up"></i></th>
                                    </tr>
                                    <c:forEach var="tkBanDoc" items="${listTKBanDocs}">
                                        <tr>
                                            <td>${tkBanDoc.banDoc.id}</td>
                                            <td>${tkBanDoc.banDoc.hoTen}</td>
                                            <td>${tkBanDoc.banDoc.soDienThoai}</td>
                                            <td>${tkBanDoc.banDoc.diaChi}</td>
                                            <td>${tkBanDoc.banDoc.email}</td>
                                            <td style="color:red; font-weight: bold">${tkBanDoc.tongTaiLieu}</td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </div>
        <script>
            function init() {
                let searchType = localStorage.getItem("searchType");
                let thuTu = localStorage.getItem("thuTu");
                let forms = document.querySelectorAll('form');
                let arrows = document.querySelectorAll('.arrow');
                for (let i = 0; i < forms.length; ++i) {
                    forms[i].querySelector('input[name="thuTu"]').value = thuTu;
                    if (forms[i].id === searchType) {
                        forms[i].querySelector('button').classList.add('tk-btn-active');
                    } else {
                        forms[i].querySelector('button').classList.remove('tk-btn-active');
                    }
                }
                for (let i = 0; i < arrows.length; ++i) {
                    if (thuTu === 'asc') {
                        arrows[i].classList.remove('fa-arrow-down');
                        arrows[i].classList.add('fa-arrow-up');
                    } else {
                        arrows[i].classList.add('fa-arrow-down');
                        arrows[i].classList.remove('fa-arrow-up');
                    }
                }
            }
            init();
            function changeSearch(element) {
                localStorage.setItem("searchType", element.id);
                init();
                return true;
            }
            function changeThuTu(element) {
                let searchType = localStorage.getItem("searchType");
                console.log(searchType);
                let form = document.getElementById(searchType);
                let arrow = element.querySelector('.arrow');
                if (arrow.classList.contains('fa-arrow-up')) {
                    arrow.classList.remove('fa-arrow-up');
                    arrow.classList.add('fa-arrow-down');
                    form.querySelector('input[name="thuTu"]').value = 'desc';
                    localStorage.setItem("thuTu", 'desc');
                    form.submit();
                } else {
                    arrow.classList.remove('fa-arrow-down');
                    arrow.classList.add('fa-arrow-up');
                    form.querySelector('input[name="thuTu"]').value = 'asc';
                    localStorage.setItem("thuTu", 'asc');
                    form.submit();
                }
            }
        </script>
    </body>
</html>
