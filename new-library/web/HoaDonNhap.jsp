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
            <a href="TraTaiLieu.jsp?clear=true" class="a-btn menu-btn">Trả Sách</a>
            <a href="NhapTaiLieu.jsp?clear=true" class="a-btn menu-btn menu-active">Nhập Sách</a>
            <a href="ThongKe.jsp?clear=true" class="a-btn menu-btn">Thống Kê</a>
        </div>
        <div class="container">
            <div class="container-content" style="background:rgb(217, 217, 217);">
                <div class="card-frame" style="width:50%; margin:auto;">
                    <form class="card-form card-main">
                        <h1>Hóa Đơn Nhập Tài Liệu</h1>
                        <div>
                            <h2>Thông Tin Nhà Cung Cấp</h2>
                            <div class="group">
                                <label>Mã Nhà Cung Cấp: </label>
                                <input type="text" name="maBanDoc" readonly value="${hoaDonNhap.nhaCungCap.id}">
                            </div>
                            <div class="group">
                                <label>Tên Nhà Cung Cấp: </label>
                                <input type="text" name="hoTenBanDoc" readonly value="${hoaDonNhap.nhaCungCap.ten}">
                            </div>
                            <div class="group">
                                <label>Số Điện Thoại: </label>
                                <input type="text" name="soDienThoai" readonly value="${hoaDonNhap.nhaCungCap.soDienThoai}">
                            </div>
                            <div class="group">
                                <label>Địa Chỉ: </label>
                                <input type="text" name="diaChi" readonly value="${hoaDonNhap.nhaCungCap.diaChi}">
                            </div>
                        </div>
                        <div>
                            <h2>Nhân Viên Tạo Phiếu:</h2>
                            <div class="group">
                                <label>Mã Nhân Viên: </label>
                                <input type="text" name="maNhanVien" readonly value="${hoaDonNhap.nhanVien.id}">
                            </div>
                            <div class="group">
                                <label>Tên Nhân Viên: </label>
                                <input type="text" name="hoTenNhanVien" readonly value="${hoaDonNhap.nhanVien.hoTen}">
                            </div>
                        </div>
                        <div>
                            <h2>Thông Tin Tài Liệu:</h2>
                            <div class="group">
                                <label>Ngày Nhập </label>
                                <input type="text" name="ngayNhap" readonly value="${hoaDonNhap.ngayNhap}">
                            </div>
                            <div class="group">
                                <label>Tổng Tiền: </label>
                                <input type="text" name="tongTien" readonly value="${hoaDonNhap.tongTien}">
                            </div>
                            <h2>Danh Sách Tài Liệu:</h2>
                            <c:choose>
                                <c:when test="${not empty hoaDonNhap.listTaiLieuNhaps}">
                                    <div class="card-table" style="width:100%;">
                                        <table class="table-shadow card-large">
                                            <tr>
                                                <th>Mã</th>
                                                <th>Tên Tài Liệu</th>
                                                <th>Tác Giả</th>
                                                <th>Số Lượng Nhập</th>
                                                <th>Giá Nhập</th>
                                            </tr>

                                            <c:forEach var="taiLieuNhap" items="${hoaDonNhap.listTaiLieuNhaps}">
                                                <tr>
                                                    <td>${taiLieuNhap.taiLieu.id}</td>
                                                    <td>${taiLieuNhap.taiLieu.ten}</td>
                                                    <td>${taiLieuNhap.taiLieu.tacGia}</td>
                                                    <td>${taiLieuNhap.soLuong}</td>
                                                    <td>${taiLieuNhap.giaNhap}</td>
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
