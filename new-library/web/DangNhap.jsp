<%-- 
    Document   : DangNhap
    Created on : Nov 19, 2023, 2:26:08 PM
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
    </head>
    <body>
        <div class="header" style="justify-content: start">
            <a class="a-btn header-btn nv" href="#" onclick="changeVaiTro(this)">Nhân Viên</a>
            <a class="a-btn header-btn bd" href="#" onclick="changeVaiTro(this)">Bạn Đọc</a>
        </div>
        <div class="container">
            <div class="form-frame">
                <form class="form-basis" action="DangNhapController" method="post">
                    <div class="form-header">
                        <h1>Form Đăng Nhập</h1>
                        <h2 style="margin:10px 0;">Nhân Viên</h2>
                    </div>
                    <div class="group">
                        <label style="min-width: 100px;">Username:</label>
                        <input type="text" placeholder="username" name="username" required />
                    </div>
                    <div class="group">
                        <label style="min-width: 100px;">Password:</label>
                        <input type="password" placeholder="password" name="password" required />
                    </div>
                    <input type="hidden" name="vaiTro" value="1" />
                    <input type="hidden" name="action" value="login" />
                    <div class="center">
                        <button type="submit" style="width:100%;">Đăng Nhập</button>
                    </div>
                </form>
                <c:choose>
                    <c:when test="${not empty error}">
                        <div id="div-error">Sai Thông Tin Đăng Nhập</div>
                    </c:when>
                </c:choose>
            </div>
        </div>

        <script>
            function init() {
                let vaiTro = localStorage.getItem("vaiTro");
                if (vaiTro === null) {
                    vaiTro = '1';
                }
                document.querySelector('input[name="vaiTro"]').value = vaiTro;
                if (vaiTro === '1') {
                    document.querySelector('.nv').classList.add('header-btn-active');
                    document.querySelector('.bd').classList.remove('header-btn-active');
                    document.querySelector('h2').textContent = 'Nhân Viên';
                } else {
                    document.querySelector('.nv').classList.remove('header-btn-active');
                    document.querySelector('.bd').classList.add('header-btn-active');
                    document.querySelector('h2').textContent = 'Bạn Đọc';
                }
            }
            init();
            function changeVaiTro(element) {
                if (element.classList.contains('nv')) {
                    localStorage.setItem("vaiTro", '1');
                } else {
                    localStorage.setItem("vaiTro", '0');
                }
                init();
            }
        </script>
    </body>
</html>
