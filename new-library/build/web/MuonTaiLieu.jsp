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
        <c:if test="${param.clear == 'true'}">
            <script>
                localStorage.clear();
                console.log('localStorage cleared');
            </script>
            <c:set var="param.clear" value="false"/>
        </c:if>
        <div class="header">
            <a class="a-btn header-btn" href="TaiLieuController?action=home">Trang Chủ</a>
            <a class="a-btn header-btn" href="DangNhapController?action=logout">Đăng Xuất</a>
        </div>
        <div class="menu">
            <a href="TaiLieuController?action=view" class="a-btn menu-btn">Kho Tài Liệu</a>
            <a href="MuonTaiLieu.jsp?clear=true" class="a-btn menu-btn menu-active">Mượn Sách</a>
            <a href="TraTaiLieu.jsp?clear=true" class="a-btn menu-btn">Trả Sách</a>
            <a href="NhapTaiLieu.jsp?clear=true" class="a-btn menu-btn">Nhập Sách</a>
            <a href="ThongKe.jsp?clear=true" class="a-btn menu-btn">Thống Kê</a>
        </div>
        <div class="container">
            <div class="search-frame center">
                <div class="search-item" style="width:60%;">
                    <form id="search-form" action="ThanhVienController" method="post">
                        <div class="search-group">
                            <!--<h3 style="margin-right:50px;">Tìm Tài Liệu:</h3>-->
                            <input type="hidden" name="from" value="MuonTaiLieu.jsp" />
                            <input type="hidden" name="action" value="search" />
                            <button id="banDoc" type="button" class="search-opt" onclick="changeSearch(this)">Tìm Bạn Đọc</button>
                            <button id="taiLieu" type="button" class="search-opt" onclick="changeSearch(this)">Tìm Tài Liệu</button>
                            <input class="search-inp" type="text" placeholder="search..." name="search" />
                            <button type="submit" class="search-btn"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </div>
                    </form>
                </div>
                <div class="search-item" style="width:40%; border:none">
                    <div>
                        <h1>Phiếu Mượn</h1>
                    </div>
                </div>

            </div>
            <div class="container-content" >
                <div style="width:60%;">
                    <c:choose>
                        <c:when test="${not empty listBanDocs}">
                            <div class="table-frame" style="width:100%;">
                                <table class="table-shadow">
                                    <tr>
                                        <th>Mã</th>
                                        <th>Họ Tên</th>
                                        <th>Số Điện Thoại</th>
                                        <th>Địa Chỉ</th>
                                        <th>Email</th>
                                    </tr>

                                    <c:forEach var="banDoc" items="${listBanDocs}">
                                        <tr id="${banDoc.id}" onclick="chooseBanDoc(this)">
                                            <td>${banDoc.id}</td>
                                            <td>${banDoc.hoTen}</td>
                                            <td>${banDoc.soDienThoai}</td>
                                            <td>${banDoc.diaChi}</td>
                                            <td>${banDoc.email}</td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </c:when>
                    </c:choose>
                    <c:choose>
                        <c:when test="${not empty listTaiLieus}">
                            <div class="content" style="width:100%; margin-top:0">
                                <c:forEach var="taiLieu" items="${listTaiLieus}">
                                    <div id="${taiLieu.id}" class="content-item-2" onclick="chooseTaiLieu(this)">
                                        <img class="content-item-image-2" src="${taiLieu.anhBia}" />
                                        <span class="content-item-text-2 ten" style="color:black;font-size: 20px;">${taiLieu.ten}</span>
                                        <span class="content-item-text-2 tacGia" >Tác giả: ${taiLieu.tacGia}</span>
                                        <span class="content-item-text-2" >Số lượng: ${taiLieu.soLuong}</span>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:when>
                    </c:choose>
                </div>
                <div class="card-frame" style="width:40%">
                    <form class="card-form" action="MuonTaiLieuController" method="post" onsubmit="return validateForm(this)">
                        <h1>Phiếu Mượn Sách</h1>
                        <div>
                            <h2>Thông Tin Bạn Đọc</h2>
                            <div class="group">
                                <label>Mã Bạn Đọc: </label>
                                <input type="text" name="maBanDoc" readonly>
                            </div>
                            <div class="group">
                                <label>Tên Bạn Đọc: </label>
                                <input type="text" name="hoTenBanDoc" readonly>
                            </div>
                            <div class="group">
                                <label>Số Điện Thoại: </label>
                                <input type="text" name="soDienThoai" readonly>
                            </div>
                            <div class="group">
                                <label>Địa Chỉ: </label>
                                <input type="text" name="diaChi" readonly>
                            </div>
                            <div class="group">
                                <label>Email: </label>
                                <input type="text" name="email" readonly>
                            </div>
                        </div>
                        <div>
                            <h2>Nhân Viên Tạo Phiếu:</h2>
                            <div class="group">
                                <label>Mã Nhân Viên: </label>
                                <input type="text" name="maNhanVien" readonly value="${thanhVien.id}">
                            </div>
                            <div class="group">
                                <label>Tên Nhân Viên: </label>
                                <input type="text" name="hoTenNhanVien" readonly value="${thanhVien.hoTen}">
                            </div>
                        </div>
                        <div>
                            <h2>Thông Tin Tài Liệu:</h2>
                            <div class="group">
                                <label>Ngày Mượn: </label>
                                <input type="text" name="ngayMuon" readonly>
                            </div>
                            <div class="group">
                                <label>Ngày Phải Trả: </label>
                                <input type="text" name="ngayPhaiTra" readonly>
                            </div>
                            <input type="hidden" name="listTaiLieuMuons" readonly>
                            <h2>Danh Sách Tài Liệu:</h2>
                            <table class="card-table">

                            </table>
                        </div>
                        <button type="submit" class="card-button">Tạo phiếu mượn</button>
                    </form>
                </div>
            </div>
        </div>

        <script>
            function init() {
                let searchType = localStorage.getItem('searchType');
                if (searchType === null) {
                    searchType = 'banDoc';
                    localStorage.setItem('searchType', searchType);
                }
                let buttons = document.querySelectorAll('.search-opt');
                let searchForm = document.getElementById('search-form');
                if (searchType === 'banDoc') {
                    buttons[0].classList.add('search-opt-active');
                    buttons[1].classList.remove('search-opt-active');
                    searchForm.action = 'ThanhVienController';
                } else {
                    buttons[0].classList.remove('search-opt-active');
                    buttons[1].classList.add('search-opt-active');
                    searchForm.action = 'TaiLieuController';
                }

                let banDoc = JSON.parse(localStorage.getItem("banDocMuon"));
                let listTaiLieuMuons = JSON.parse(localStorage.getItem("listTaiLieuMuons"));

                if (banDoc !== null) {
                    document.querySelector('input[name="maBanDoc"]').value = banDoc.id;
                    document.querySelector('input[name="hoTenBanDoc"]').value = banDoc.hoTen;
                    document.querySelector('input[name="soDienThoai"]').value = banDoc.soDienThoai;
                    document.querySelector('input[name="diaChi"]').value = banDoc.diaChi;
                    document.querySelector('input[name="email"]').value = banDoc.email;
                }

                let date = new Date();
                document.querySelector('input[name="ngayMuon"]').value = convertDate(date);
                date.setDate(date.getDate() + 5);
                document.querySelector('input[name="ngayPhaiTra"]').value = convertDate(date);

                let html = `<tr><th>Mã </th><th>Tên </th><th>Tác Giả </th></th><th>Xóa </th></tr>`;
                if (listTaiLieuMuons !== null) {
                    for (let i = 0; i < listTaiLieuMuons.length; ++i) {
                        html += '<tr><td>' + listTaiLieuMuons[i].id + '</td><td>' + listTaiLieuMuons[i].ten + '</td>'
                                + '<td>' + listTaiLieuMuons[i].tacGia + '</td>'
                                + '<td><button class="delete-btn" onclick="deleteTaiLieu(this)"><i class="fa-solid fa-trash"></i></button></td></tr>'
                    }
                }
                document.querySelector('.card-table').innerHTML = html;
                
                document.querySelector('input[name="listTaiLieuMuons"]').value = JSON.stringify(listTaiLieuMuons);
            }
            init();
            function changeSearch(element) {
                localStorage.setItem('searchType', element.id);
                init();
            }
            function chooseBanDoc(element) {
                let id = element.id;
                let hoTen = element.cells[1].textContent;
                let soDienThoai = element.cells[2].textContent;
                let diaChi = element.cells[3].textContent;
                let email = element.cells[4].textContent;
                let banDoc = {
                    id: id,
                    hoTen: hoTen,
                    soDienThoai: soDienThoai,
                    diaChi: diaChi,
                    email: email
                };
                localStorage.setItem("banDocMuon", JSON.stringify(banDoc));
                init();
            }

            function chooseTaiLieu(element) {
                let id = element.id;
                let ten = element.querySelector('.ten').textContent;
                let tacGia = element.querySelector('.tacGia').textContent.replace('Tác giả: ', '');
                
                let taiLieu = {
                    id: id,
                    ten: ten,
                    tacGia: tacGia
                };

                let listTaiLieuMuons = JSON.parse(localStorage.getItem("listTaiLieuMuons"));
                if (listTaiLieuMuons !== null) {
                    if (listTaiLieuMuons.length >= 3)
                        return;
                    for (let i = 0; i < listTaiLieuMuons.length; ++i) {
                        if (listTaiLieuMuons[i].id === id) {
                            return;
                        }
                    }
                } else {
                    listTaiLieuMuons = [];
                }
                listTaiLieuMuons.push(taiLieu);
                localStorage.setItem("listTaiLieuMuons", JSON.stringify(listTaiLieuMuons));
                init();
            }
            function convertDate(date) {
                var nam = date.getFullYear();
                var thang = date.getMonth() + 1;
                var ngay = date.getDate();
                var newDate = nam + '-' + (thang < 10 ? '0' : '') + thang + '-' + (ngay < 10 ? '0' : '') + ngay;
                return newDate;
            }
            function deleteTaiLieu(element) {
                let id = element.closest('tr').cells[0].textContent;
                let listTaiLieuMuons = JSON.parse(localStorage.getItem("listTaiLieuMuons"));
                let viTri = listTaiLieuMuons.findIndex(function (taiLieu) {
                    return taiLieu.id === id;
                });

                if (viTri !== -1) {
                    listTaiLieuMuons.splice(viTri, 1);
                    localStorage.setItem('listTaiLieuMuons', JSON.stringify(listTaiLieuMuons));
                }
                init();
            }
            function validateForm(element) {
                var inputs = element.querySelectorAll('input');

                for (var i = 0; i < inputs.length; i++) {
                    if (inputs[i].value.trim() === '') {
                        alert('Vui lòng điền đầy đủ thông tin vào tất cả các trường.');
                        return false;
                    }
                }
                return true;
            }
        </script>
    </body>
</html>
