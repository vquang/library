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
            <a href="MuonTaiLieu.jsp?clear=true" class="a-btn menu-btn">Mượn Sách</a>
            <a href="TraTaiLieu.jsp?clear=true" class="a-btn menu-btn menu-active">Trả Sách</a>
            <a href="NhapTaiLieu.jsp?clear=true" class="a-btn menu-btn">Nhập Sách</a>
            <a href="ThongKe.jsp?clear=true" class="a-btn menu-btn">Thống Kê</a>
        </div>
        <div class="container">
            <div class="search-frame center">
                <div class="search-item" style="width:50%;">
                    <form action="ThanhVienController" method="post">
                        <div class="search-group">
                            <h3 style="margin-right:50px;">Tìm Bạn Đọc:</h3>
                            <input type="hidden" name="from" value="TraTaiLieu.jsp" />
                            <input type="hidden" name="action" value="search" />
                            <input class="search-inp" type="text" placeholder="search..." name="search" />
                            <button type="submit" class="search-btn"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </div>
                    </form>
                </div>
                <div class="search-item" style="width:50%; border:none">
                    <div>
                        <h1>Phiếu Trả</h1>
                    </div>
                </div>

            </div>
            <div class="container-content" >
                <form id="myForm" action="TraTaiLieuController" method="post" style="padding:0">
                    <input type="hidden" name="banDocId" id="selectedId">
                    <input type="hidden" name="action" value="search">
                </form>
                <div style="width:50%;">
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
                        <c:when test="${not empty listPhieuMuons}">
                            <div class="table-frame">
                                <h1 style="width:100%; text-align: center;margin-bottom: 10px;">Danh Sách Các Tài Liệu Đang Mượn</h1>
                                <table id="tl" class="table-shadow">
                                    <tr>
                                        <th>Mã Tài Liệu</th>
                                        <th>Tên Tài Liệu</th>
                                        <th>Tác Giả</th>
                                        <th>Ngày Mượn</th>
                                        <th>Ngày Phải Trả</th>
                                    </tr>
                                    <c:forEach var="phieuMuon" items="${listPhieuMuons}">
                                        <c:forEach var="taiLieuMuon" items="${phieuMuon.listTaiLieuMuons}">
                                            <tr id="${taiLieuMuon.id}" onclick="chooseTaiLieu(this)">
                                                <td>${taiLieuMuon.taiLieu.id}</td>
                                                <td>${taiLieuMuon.taiLieu.ten}</td>
                                                <td>${taiLieuMuon.taiLieu.tacGia}</td>
                                                <td>${phieuMuon.ngayMuon}</td>
                                                <td>${phieuMuon.ngayPhaiTra}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:forEach>
                                </table>
                            </div>
                        </c:when>
                    </c:choose>
                </div>
                <div class="card-frame">
                    <form class="card-form" onsubmit="return validateForm(this)" action="TraTaiLieuController" method="post">
                        <input type="hidden" name="action" value="create" />
                        <h1>Phiếu Trả Sách</h1>
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
                                <label>Ngày Trả: </label>
                                <input type="text" name="ngayTra" readonly>
                            </div>
                            <div class="group">
                                <label>Tiền Phạt: </label>
                                <input type="text" name="tienPhat" readonly>
                            </div>
                            <div class="group">
                                <label>Ghi Chú:</label>
                                <textarea rows="2" name="ghiChu" style="width:200px;"></textarea>
                            </div>
                            <input type="hidden" name="listTaiLieuTras" readonly>
                            <h2>Danh Sách Tài Liệu:</h2>
                            <table class="card-table">

                            </table>

                        </div>
                        <button type="submit" class="card-button">Tạo Hóa Đơn</button>
                    </form>
                </div>
            </div>

        </div>
    </div>
    <script>
        function init() {
            let banDoc = JSON.parse(localStorage.getItem("banDocTra"));
            let listTaiLieuTras = JSON.parse(localStorage.getItem("listTaiLieuTras"));

            if (banDoc !== null) {
                document.querySelector('input[name="maBanDoc"]').value = banDoc.id;
                document.querySelector('input[name="hoTenBanDoc"]').value = banDoc.hoTen;
                document.querySelector('input[name="soDienThoai"]').value = banDoc.soDienThoai;
                document.querySelector('input[name="diaChi"]').value = banDoc.diaChi;
                document.querySelector('input[name="email"]').value = banDoc.email;
            }

            let ngayTra = convertDate(new Date());
            document.querySelector('input[name="ngayTra"]').value = ngayTra;

            let ids = [];
            let soNgayMuon = 0;
            let html = `<tr><th>Mã </th><th>Tên </th><th>Tác Giả </th></th><th>Ngày Mượn</th><th>Ngày Phải Trả</th><th>Xóa </th></tr>`;
            if (listTaiLieuTras !== null) {
                for (let i = 0; i < listTaiLieuTras.length; ++i) {
                    ids.push(listTaiLieuTras[i].id);
                    soNgayMuon += calculateDate(listTaiLieuTras[i].ngayPhaiTra, ngayTra);
                    html += '<tr data-id=' + listTaiLieuTras[i].id + '><td>' + listTaiLieuTras[i].taiLieuId + '</td><td>' + listTaiLieuTras[i].ten + '</td>'
                            + '<td>' + listTaiLieuTras[i].tacGia + '</td>'
                            + '<td>' + listTaiLieuTras[i].ngayMuon + '</td>'
                            + '<td>' + listTaiLieuTras[i].ngayPhaiTra + '</td>'
                            + '<td><button class="delete-btn" onclick="deleteTaiLieu(this)"><i class="fa-solid fa-trash"></i></button></td></tr>'
                }
            }
            document.querySelector('.card-table').innerHTML = html;
            document.querySelector('input[name="tienPhat"]').value = soNgayMuon * 2000;

            let tableTaiLieu = document.getElementById('tl');
            if (tableTaiLieu !== null) {
                let rows = tableTaiLieu.querySelectorAll('tr');
                for (let i = 0; i < rows.length; ++i) {
                    if (ids.includes(rows[i].id)) {
                        rows[i].classList.add('tr-active');
                    } else {
                        rows[i].classList.remove('tr-active');
                    }
                }
            }

            document.querySelector('input[name="listTaiLieuTras"]').value = JSON.stringify(listTaiLieuTras);
        }
        init();
        function chooseBanDoc(element) {
            localStorage.clear();
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
            localStorage.setItem("banDocTra", JSON.stringify(banDoc));

            document.getElementById('selectedId').value = id;
            document.getElementById('myForm').submit();
            init();
        }
        function chooseTaiLieu(element) {
            let id = element.id;
            let taiLieuId = element.cells[0].textContent;
            let ten = element.cells[1].textContent;
            let tacGia = element.cells[2].textContent;
            let ngayMuon = element.cells[3].textContent;
            let ngayPhaiTra = element.cells[4].textContent;
            let taiLieu = {
                id: id,
                taiLieuId: taiLieuId,
                ten: ten,
                tacGia: tacGia,
                ngayMuon: ngayMuon,
                ngayPhaiTra: ngayPhaiTra
            };

            let listTaiLieuTras = JSON.parse(localStorage.getItem("listTaiLieuTras"));
            if (listTaiLieuTras !== null) {
                for (let i = 0; i < listTaiLieuTras.length; ++i) {
                    if (listTaiLieuTras[i].id === id) {
                        return;
                    }
                }
            } else {
                listTaiLieuTras = [];
            }
            listTaiLieuTras.push(taiLieu);
            localStorage.setItem("listTaiLieuTras", JSON.stringify(listTaiLieuTras));
            init();
        }

        function deleteTaiLieu(element) {
            let id = element.closest('tr').getAttribute("data-id");
            let listTaiLieuTras = JSON.parse(localStorage.getItem("listTaiLieuTras"));
            let viTri = listTaiLieuTras.findIndex(function (taiLieu) {
                return taiLieu.id === id;
            });

            if (viTri !== -1) {
                listTaiLieuTras.splice(viTri, 1);
                localStorage.setItem('listTaiLieuTras', JSON.stringify(listTaiLieuTras));
            }
            init();
        }

        function calculateDate(dateString1, dateString2) {
            // Chuyển đổi chuỗi ngày thành đối tượng Date
            const date1 = new Date(dateString1);
            const date2 = new Date(dateString2);

            // Tính toán khoảng cách giữa hai ngày (theo miligiây)
            const timeDifference = date2.getTime() - date1.getTime();
            if (timeDifference <= 0) {
                return 0;
            }

            // Chuyển đổi khoảng cách từ miligiây sang ngày
            const daysDifference = Math.ceil(timeDifference / (1000 * 60 * 60 * 24));

            return daysDifference;
        }
        function convertDate(date) {
            var nam = date.getFullYear();
            var thang = date.getMonth() + 1; // Tháng bắt đầu từ 0
            var ngay = date.getDate();
            var newDate = nam + '-' + (thang < 10 ? '0' : '') + thang + '-' + (ngay < 10 ? '0' : '') + ngay;
            return newDate;
        }

        function validateForm(element) {
            var inputs = element.querySelectorAll('input');

            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].value.trim() === '' && inputs[i].name !== 'ghiChu') {
                    alert('Vui lòng điền đầy đủ thông tin vào tất cả các trường.');
                    return false;
                }
            }
            return true;
        }
    </script>
</body>
</html>
