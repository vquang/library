-- Thêm 5 bản ghi có vai trò là 0
INSERT INTO ThanhVien (username, password, hoTen, soDienThoai, diaChi, email, vaiTro)
VALUES
  ('user1', 'password1', 'Ho Ten 1', '1234567891', 'Dia Chi 1', 'email1@example.com', 0),
  ('user2', 'password2', 'Ho Ten 2', '1234567892', 'Dia Chi 2', 'email2@example.com', 0),
  ('user3', 'password3', 'Ho Ten 3', '1234567893', 'Dia Chi 3', 'email3@example.com', 0),
  ('user4', 'password4', 'Ho Ten 4', '1234567894', 'Dia Chi 4', 'email4@example.com', 0),
  ('user5', 'password5', 'Ho Ten 5', '1234567895', 'Dia Chi 5', 'email5@example.com', 0);

-- Thêm 5 bản ghi có vai trò là 1
INSERT INTO ThanhVien (username, password, hoTen, soDienThoai, diaChi, email, vaiTro)
VALUES
  ('user6', 'password6', 'Ho Ten 6', '1234567896', 'Dia Chi 6', 'email6@example.com', 1),
  ('user7', 'password7', 'Ho Ten 7', '1234567897', 'Dia Chi 7', 'email7@example.com', 1),
  ('user8', 'password8', 'Ho Ten 8', '1234567898', 'Dia Chi 8', 'email8@example.com', 1),
  ('user9', 'password9', 'Ho Ten 9', '1234567899', 'Dia Chi 9', 'email9@example.com', 1),
  ('user10', 'password10', 'Ho Ten 10', '12345678910', 'Dia Chi 10', 'email10@example.com', 1);
  
  
-- Thêm 10 bản ghi vào bảng TaiLieu
INSERT INTO TaiLieu (ten, tacGia, moTa, soLuong, anhBia)
VALUES
  ('Doraemon 1', 'Tac Gia 1', 'Doraemon là một nhân vật hoạt hình mà em yêu thích nhất. Đó là một chú mèo máy đến từ thế kỷ 22 để giúp đỡ cậu bé Nobita. Doraemon có nhiều bảo bối thần kỳ trong túi của mình, có thể giải quyết mọi vấn đề khó khăn. ', 20, 'images/1.jfif'),
  ('Doraemon 2', 'Tac Gia 2', 'Doraemon là một nhân vật hoạt hình mà em yêu thích nhất. Đó là một chú mèo máy đến từ thế kỷ 22 để giúp đỡ cậu bé Nobita. Doraemon có nhiều bảo bối thần kỳ trong túi của mình, có thể giải quyết mọi vấn đề khó khăn. ', 20, 'images/2.jfif'),
  ('Doraemon 3', 'Tac Gia 3', 'Doraemon là một nhân vật hoạt hình mà em yêu thích nhất. Đó là một chú mèo máy đến từ thế kỷ 22 để giúp đỡ cậu bé Nobita. Doraemon có nhiều bảo bối thần kỳ trong túi của mình, có thể giải quyết mọi vấn đề khó khăn. ', 20, 'images/3.jfif'),
  ('Doraemon 4', 'Tac Gia 4', 'Doraemon là một nhân vật hoạt hình mà em yêu thích nhất. Đó là một chú mèo máy đến từ thế kỷ 22 để giúp đỡ cậu bé Nobita. Doraemon có nhiều bảo bối thần kỳ trong túi của mình, có thể giải quyết mọi vấn đề khó khăn. ', 20, 'images/4.jfif'),
  ('Doraemon 5', 'Tac Gia 5', 'Doraemon là một nhân vật hoạt hình mà em yêu thích nhất. Đó là một chú mèo máy đến từ thế kỷ 22 để giúp đỡ cậu bé Nobita. Doraemon có nhiều bảo bối thần kỳ trong túi của mình, có thể giải quyết mọi vấn đề khó khăn. ', 20, 'images/5.jfif'),
  ('Doraemon 6', 'Tac Gia 6', 'Doraemon là một nhân vật hoạt hình mà em yêu thích nhất. Đó là một chú mèo máy đến từ thế kỷ 22 để giúp đỡ cậu bé Nobita. Doraemon có nhiều bảo bối thần kỳ trong túi của mình, có thể giải quyết mọi vấn đề khó khăn. ', 20, 'images/6.jfif'),
  ('Doraemon 7', 'Tac Gia 7', 'Doraemon là một nhân vật hoạt hình mà em yêu thích nhất. Đó là một chú mèo máy đến từ thế kỷ 22 để giúp đỡ cậu bé Nobita. Doraemon có nhiều bảo bối thần kỳ trong túi của mình, có thể giải quyết mọi vấn đề khó khăn. ', 20, 'images/7.jfif'),
  ('Doraemon 8', 'Tac Gia 8', 'Doraemon là một nhân vật hoạt hình mà em yêu thích nhất. Đó là một chú mèo máy đến từ thế kỷ 22 để giúp đỡ cậu bé Nobita. Doraemon có nhiều bảo bối thần kỳ trong túi của mình, có thể giải quyết mọi vấn đề khó khăn. ', 20, 'images/8.jfif'),
  ('Doraemon 9', 'Tac Gia 9', 'Doraemon là một nhân vật hoạt hình mà em yêu thích nhất. Đó là một chú mèo máy đến từ thế kỷ 22 để giúp đỡ cậu bé Nobita. Doraemon có nhiều bảo bối thần kỳ trong túi của mình, có thể giải quyết mọi vấn đề khó khăn. ', 20, 'images/9.jfif'),
  ('Doraemon 10', 'Tac Gia 10', 'Doraemon là một nhân vật hoạt hình mà em yêu thích nhất. Đó là một chú mèo máy đến từ thế kỷ 22 để giúp đỡ cậu bé Nobita. Doraemon có nhiều bảo bối thần kỳ trong túi của mình, có thể giải quyết mọi vấn đề khó khăn. ', 20, 'images/10.jfif');
  
INSERT INTO NhaCungCap (ten, diaChi, soDienThoai) VALUES
('NhaCungCap 1', 'DiaChi 1', '0123456789'),
('NhaCungCap 2', 'DiaChi 2', '0123456789'),
('NhaCungCap 3', 'DiaChi 3', '0123456789'),
('NhaCungCap 4', 'DiaChi 4', '0123456789'),
('NhaCungCap 5', 'DiaChi 5', '0123456789'),
('NhaCungCap 6', 'DiaChi 6', '0123456789'),
('NhaCungCap 7', 'DiaChi 7', '0123456789'),
('NhaCungCap 8', 'DiaChi 8', '0123456789'),
('NhaCungCap 9', 'DiaChi 9', '0123456789'),
('NhaCungCap 10', 'DiaChi 10', '0123456789');

