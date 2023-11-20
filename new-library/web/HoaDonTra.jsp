<%-- 
    Document   : PhieuMuon
    Created on : Nov 19, 2023, 10:21:09 PM
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
            <a class="a-btn header-btn" href="TaiLieuController?action=home">Trang Chủ</a>
            <a class="a-btn header-btn" href="DangNhapController?action=logout">Đăng Xuất</a>
        </div>
        <div class="menu">
            <a href="TaiLieuController?action=view" class="a-btn menu-btn">Kho Tài Liệu</a>
            <a href="MuonTaiLieu.jsp?clear=true" class="a-btn menu-btn">Mượn Sách</a>
            <a href="TraTaiLieu.jsp?clear=true" class="a-btn menu-btn menu-active">Trả Sách</a>
            <a href="NhapTaiLieu.jsp?clear=true" class="a-btn menu-btn">Nhập Sách</a>
            <a href="ThongKe.jsp?clear=true" class="a-btn menu-btn">Thống Kê</a>
        </div>
        <div class="container">
            <div class="container-content" style="background:rgb(217, 217, 217);">
                <div class="card-frame" style="width:50%; margin:auto;">
                    <form class="card-form card-main">
                        <h1>Hóa Đơn Trả Sách</h1>
                        <div>
                            <h2>Thông Tin Bạn Đọc</h2>
                            <div class="group">
                                <label>Mã Bạn Đọc: </label>
                                <input type="text" name="maBanDoc" readonly value="${hoaDonTra.phieuTra.banDoc.id}">
                            </div>
                            <div class="group">
                                <label>Tên Bạn Đọc: </label>
                                <input type="text" name="hoTenBanDoc" readonly value="${hoaDonTra.phieuTra.banDoc.hoTen}">
                            </div>
                            <div class="group">
                                <label>Số Điện Thoại: </label>
                                <input type="text" name="soDienThoai" readonly value="${hoaDonTra.phieuTra.banDoc.soDienThoai}">
                            </div>
                            <div class="group">
                                <label>Địa Chỉ: </label>
                                <input type="text" name="diaChi" readonly value="${hoaDonTra.phieuTra.banDoc.diaChi}">
                            </div>
                            <div class="group">
                                <label>Email: </label>
                                <input type="text" name="email" readonly value="${hoaDonTra.phieuTra.banDoc.email}">
                            </div>
                        </div>
                        <div>
                            <h2>Nhân Viên Tạo Phiếu:</h2>
                            <div class="group">
                                <label>Mã Nhân Viên: </label>
                                <input type="text" name="maNhanVien" readonly value="${hoaDonTra.phieuTra.nhanVien.id}">
                            </div>
                            <div class="group">
                                <label>Tên Nhân Viên: </label>
                                <input type="text" name="hoTenNhanVien" readonly value="${hoaDonTra.phieuTra.nhanVien.hoTen}">
                            </div>
                        </div>
                        <div>
                            <h2>Thông Tin Tài Liệu:</h2>
                            <div class="group">
                                <label>Ngày Trả: </label>
                                <input type="text" name="ngayTra" readonly value="${hoaDonTra.phieuTra.ngayTra}">
                            </div>
                            <div class="group">
                                <label>Tiền Phạt: </label>
                                <input type="text" name="tienPhat" readonly value="${hoaDonTra.tienPhat}">
                            </div>
                            <div class="group">
                                <label>Ghi Chú:</label>
                                <textarea rows="2" name="ghiChu" style="width:200px;" readonly>${hoaDonTra.ghiChu}</textarea>
                            </div>
                            <h2>Danh Sách Tài Liệu:</h2>
                            <c:choose>
                                <c:when test="${not empty hoaDonTra.phieuTra.listTaiLieuMuons}">
                                    <div class="card-table" style="width:100%;">
                                        <table class="table-shadow card-large">
                                            <tr>
                                                <th>Mã</th>
                                                <th>Tên Tài Liệu</th>
                                                <th>Tác Giả</th>
                                                <th>Ngày Mượn</th>
                                                <th>Ngày Phải Trả</th>
                                            </tr>

                                            <c:forEach var="taiLieuMuon" items="${hoaDonTra.phieuTra.listTaiLieuMuons}">
                                                <tr>
                                                    <td>${taiLieuMuon.taiLieu.id}</td>
                                                    <td>${taiLieuMuon.taiLieu.ten}</td>
                                                    <td>${taiLieuMuon.taiLieu.tacGia}</td>
                                                    <td>${taiLieuMuon.ngayMuon}</td>
                                                    <td>${taiLieuMuon.ngayPhaiTra}</td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                    </div>
                                </c:when>
                            </c:choose>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
