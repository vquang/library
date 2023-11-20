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
            <div class="detail-frame">
                <div class="detail-left">
                    <img class="detail-img" src="${taiLieu.anhBia}" />
                    <form class="form-img" action="UploadImageController" method="post" enctype="multipart/form-data">
                        <input type="file" name="file" required />
                        <input type="hidden" name="from" value="CapNhatTaiLieu.jsp" />
                        <button type="submit" style="width: 50px;"><i class="fa-solid fa-upload"></i></button>
                    </form>
                </div>
                <div class="detail-right">
                    <form style="padding: 20px 50px;" action="TaiLieuController?id=${taiLieu.id}" method="post">
                        <input type="hidden" name="action" value="update" />
                        <div class="form-header">
                            <h1>Form Chỉnh Sửa</h1>
                        </div>
                        <div class="group">
                            <label>Tên Tài Liệu:</label>
                            <input type="text" placeholder="ten" name="ten" value="${taiLieu.ten}" />
                        </div>
                        <div class="group">
                            <label>Tác Giả:</label>
                            <input type="text" placeholder="tacGia" name="tacGia" value="${taiLieu.tacGia}" />
                        </div>
                        <div class="group">
                            <label>Mô Tả:</label>
                            <textarea rows="4" style="width:200px;" name="moTa" >${taiLieu.moTa}</textarea>
                        </div>
                        <input type="hidden" name="anhBia" value="${taiLieu.anhBia}" />
                        <div class="center">
                            <button type="submit" style="width:100%;">Cập Nhật</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </body>
</html>
