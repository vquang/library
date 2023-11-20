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
            <a class="a-btn header-btn" href="NhanVienHome.jsp">Trang Chủ</a>
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
            <div class="search-frame center">
                <div class="search-item" style="width:50%;">
                    <form id="search-form" action="NhaCungCapController" method="post">
                        <div class="search-group">
                            <!--<h3 style="margin-right:50px;">Tìm Tài Liệu:</h3>-->
                            <input type="hidden" name="from" value="NhapTaiLieu.jsp" />
                            <input type="hidden" name="action" value="search" />
                            <button id="ncc" type="button" class="search-opt" onclick="changeSearch(this)">Tìm NCC</button>
                            <button id="taiLieu" type="button" class="search-opt" onclick="changeSearch(this)">Tìm Tài Liệu</button>
                            <input class="search-inp" type="text" placeholder="search..." name="search" />
                            <button type="submit" class="search-btn"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </div>
                    </form>
                </div>
                <div class="search-item" style="width:50%; border:none">
                    <div>
                        <h1>Hóa Đơn Nhập</h1>
                    </div>
                </div>

            </div>
            <div class="container-content" >
                <div style="width:50%;">
                    <a href="TaoMoiTaiLieu.jsp" class="a-btn add-btn" >Tạo Mới</a>
                    <c:choose>
                        <c:when test="${not empty listNCCs}">
                            <div class="table-frame" style="width:100%;">
                                <table class="table-shadow">
                                    <tr>
                                        <th>Mã</th>
                                        <th>Tên</th>
                                        <th>Số Điện Thoại</th>
                                        <th>Địa Chỉ</th>
                                    </tr>

                                    <c:forEach var="ncc" items="${listNCCs}">
                                        <tr id="${ncc.id}" onclick="chooseNCC(this)">
                                            <td>${ncc.id}</td>
                                            <td>${ncc.ten}</td>
                                            <td>${ncc.soDienThoai}</td>
                                            <td>${ncc.diaChi}</td>
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
                <div class="card-frame" style="width:50%">
                    <form class="card-form" action="NhapTaiLieuController" method="post" onsubmit="return validateForm(this)">
                        <h1>Hóa Đơn Nhập</h1>
                        <div>
                            <h2>Thông Tin Nhà Cung Cấp</h2>
                            <div class="group">
                                <label>Mã Nhà Cung Cấp: </label>
                                <input type="text" name="maNCC" readonly>
                            </div>
                            <div class="group">
                                <label>Tên Nhà Cung Cấp: </label>
                                <input type="text" name="tenNCC" readonly>
                            </div>
                            <div class="group">
                                <label>Số Điện Thoại: </label>
                                <input type="text" name="soDienThoai" readonly>
                            </div>
                            <div class="group">
                                <label>Địa Chỉ: </label>
                                <input type="text" name="diaChi" readonly>
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
                                <label>Ngày Nhập </label>
                                <input type="text" name="ngayNhap" readonly>
                            </div>
                            <div class="group">
                                <label>Tổng Tiền: </label>
                                <input type="text" name="tongTien" readonly>
                            </div>
                            <input type="hidden" name="listTaiLieuNhaps" readonly>
                            <h2>Danh Sách Tài Liệu:</h2>
                            <table class="card-table">

                            </table>
                        </div>
                        <button type="submit" class="card-button">Tạo Hóa Đơn</button>
                    </form>
                </div>
            </div>
        </div>

        <script>
            function init() {
                let searchType = localStorage.getItem('searchType');
                if (searchType === null) {
                    searchType = 'ncc';
                    localStorage.setItem('searchType', searchType);
                }
                let buttons = document.querySelectorAll('.search-opt');
                let searchForm = document.getElementById('search-form');
                if (searchType === 'ncc') {
                    buttons[0].classList.add('search-opt-active');
                    buttons[1].classList.remove('search-opt-active');
                    searchForm.action = 'NhaCungCapController';
                } else {
                    buttons[0].classList.remove('search-opt-active');
                    buttons[1].classList.add('search-opt-active');
                    searchForm.action = 'TaiLieuController';
                }

                let ncc = JSON.parse(localStorage.getItem("ncc"));
                let listTaiLieuNhaps = JSON.parse(localStorage.getItem("listTaiLieuNhaps"));

                if (ncc !== null) {
                    document.querySelector('input[name="maNCC"]').value = ncc.id;
                    document.querySelector('input[name="tenNCC"]').value = ncc.ten;
                    document.querySelector('input[name="soDienThoai"]').value = ncc.soDienThoai;
                    document.querySelector('input[name="diaChi"]').value = ncc.diaChi;
                }

                let date = new Date();
                document.querySelector('input[name="ngayNhap"]').value = convertDate(date);

                let html = `<tr><th>Mã </th><th>Tên </th><th>Tác Giả </th></th><th>Số Lượng</th><th>Giá Nhập</th><th>Xóa </th></tr>`;
                if (listTaiLieuNhaps !== null) {
                    for (let i = 0; i < listTaiLieuNhaps.length; ++i) {
                        html += '<tr><td>' + listTaiLieuNhaps[i].id + '</td><td>' + listTaiLieuNhaps[i].ten + '</td>'
                                + '<td>' + listTaiLieuNhaps[i].tacGia + '</td>'
                                + '<td><input type="number" name="soLuong" min="0" required pattern="[0-9]+" oninput="onChangeNumber()" value="' +
                                +listTaiLieuNhaps[i].soLuong + '"/></td>'
                                + '<td><input type="number" name="giaNhap" min="0" required pattern="[0-9]+" oninput="onChangeNumber()" value="' +
                                +listTaiLieuNhaps[i].giaNhap + '"/></td>'
                                + '<td><button class="delete-btn" onclick="deleteTaiLieu(this)"><i class="fa-solid fa-trash"></i></button></td></tr>'
                    }
                }
                document.querySelector('.card-table').innerHTML = html;
                onChangeNumber();

                document.querySelector('input[name="listTaiLieuNhaps"]').value = JSON.stringify(listTaiLieuNhaps);
            }
            init();
            function changeSearch(element) {
                localStorage.setItem('searchType', element.id);
                init();
            }
            function chooseNCC(element) {
                let id = element.id;
                let ten = element.cells[1].textContent;
                let soDienThoai = element.cells[2].textContent;
                let diaChi = element.cells[3].textContent;
                let ncc = {
                    id: id,
                    ten: ten,
                    soDienThoai: soDienThoai,
                    diaChi: diaChi,
                };
                localStorage.setItem("ncc", JSON.stringify(ncc));
                init();
            }

            function chooseTaiLieu(element) {
                let id = element.id;
                let ten = element.querySelector('.ten').textContent;
                let tacGia = element.querySelector('.tacGia').textContent.replace('Tác giả: ', '');

                let taiLieu = {
                    id: id,
                    ten: ten,
                    tacGia: tacGia,
                    soLuong: 0,
                    giaNhap: 0
                };

                let listTaiLieuNhaps = JSON.parse(localStorage.getItem("listTaiLieuNhaps"));
                if (listTaiLieuNhaps !== null) {
                    for (let i = 0; i < listTaiLieuNhaps.length; ++i) {
                        if (listTaiLieuNhaps[i].id === id) {
                            return;
                        }
                    }
                } else {
                    listTaiLieuNhaps = [];
                }
                listTaiLieuNhaps.push(taiLieu);
                localStorage.setItem("listTaiLieuNhaps", JSON.stringify(listTaiLieuNhaps));
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
                let listTaiLieuNhaps = JSON.parse(localStorage.getItem("listTaiLieuNhaps"));
                let viTri = listTaiLieuNhaps.findIndex(function (taiLieu) {
                    return taiLieu.id === id;
                });

                if (viTri !== -1) {
                    listTaiLieuNhaps.splice(viTri, 1);
                    localStorage.setItem('listTaiLieuNhaps', JSON.stringify(listTaiLieuNhaps));
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
            function onChangeNumber() {
                let listTL = [];
                let oldValue = localStorage.getItem('listTaiLieuNhaps');
                if (oldValue !== null) {
                    listTL = JSON.parse(oldValue);
                }

                var rows = document.querySelector('.card-table').querySelectorAll('tr');
                var tong = 0;

                rows.forEach(function (row) {
                    var soLuongInput = row.querySelector('input[name="soLuong"]');
                    var giaNhapInput = row.querySelector('input[name="giaNhap"]');

                    if (soLuongInput !== null && giaNhapInput !== null) {
                        var soLuong = parseInt(soLuongInput.value) || 0;
                        var giaNhap = parseInt(giaNhapInput.value) || 0;

                        var tich = soLuong * giaNhap;
                        tong += tich;

                        for (let i = 0; i < listTL.length; ++i) {
                            if (listTL[i].id === row.cells[0].textContent) {
                                listTL[i].soLuong = soLuong;
                                listTL[i].giaNhap = giaNhap;
                                break;
                            }
                        }
                    }

                });
                localStorage.setItem('listTaiLieuNhaps', JSON.stringify(listTL));

                document.querySelector('input[name="tongTien"]').value = tong;
            }
        </script>

        <c:if test="${not empty taiLieu}">
            <script>
                // Lấy đối tượng TaiLieu từ request attribute
                console.log("hehe");
                let taiLieuMoi = {
                    id: '${taiLieu.id}',
                    ten: '${taiLieu.ten}',
                    tacGia: '${taiLieu.tacGia}',
                    soLuong: 0,
                    giaNhap: 0
                };
                let listTaiLieuNhaps = JSON.parse(localStorage.getItem("listTaiLieuNhaps"));
                if (listTaiLieuNhaps === null) {
                    listTaiLieuNhaps = [];
                }
                listTaiLieuNhaps.push(taiLieuMoi);
                localStorage.setItem("listTaiLieuNhaps", JSON.stringify(listTaiLieuNhaps));
                init();
            </script>
        </c:if>
    </body>
</html>
