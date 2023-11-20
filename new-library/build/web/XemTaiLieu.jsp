<%-- 
    Document   : NhanVienHome
    Created on : Nov 19, 2023, 3:06:22 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <div class="detail-frame">
                <div class="detail-left" style="width:40%;">
                    <img class="detail-img" src="/new-library/${taiLieu.anhBia}" />
                </div>
                <div class="detail-right" style="width:60%;">
                    <form style="padding: 20px 50px;">
                        <div class="form-header">
                            <h1>Thông Tin Tài Liệu</h1>
                        </div>
                        <div class="group">
                            <label>Tên Tài Liệu:</label>
                            <span>${taiLieu.ten}</span>
                        </div>
                        <div class="group">
                            <label>Tác Giả:</label>
                            <span>${taiLieu.tacGia}</span>
                        </div>
                        <div class="group">
                            <label>Số Lượng:</label>
                            <span>${taiLieu.soLuong}</span>
                        </div>
                        <p style="width:90%;">${taiLieu.moTa}</p>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
