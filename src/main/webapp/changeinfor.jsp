<%@page import="model.KhachHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=divice-width, initial-scale=1, shrink-to-fit=no">
	<title>Thông tin tài khoản</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
</head>
<body>
<%
	Object obj=session.getAttribute("khachHang");
	if(obj==null){	
%>
	<jsp:forward page="login.jsp"></jsp:forward>
<%	} %>
<%
	KhachHang khachHang = (KhachHang)session.getAttribute("khachHang");	

	String hoVaTen = khachHang.getHoTen();
	String gioiTinh = khachHang.getGioiTinh();
	String ngaySinh = khachHang.getNgaySinh().toString();
	String diaChiKhachHang = khachHang.getDiaChi();
	String diaChiMuaHang = khachHang.getDiaChiMuaHang();
	String diaChiNhanHang = khachHang.getDiaChiNhanHang();
	String dienThoai = khachHang.getSoDienThoai();
	String email = khachHang.getEmail();
	boolean dongYNhanMail = khachHang.isDangKyNhanTin();
%>
	<div class="container">
		<div class="text-center">
			<h1>THÔNG TIN TÀI KHOẢN</h1>
		</div>
		<form class="form" action="thay-doi-thong-tin" method="post">
			<div class="row">
				<div class="col-md-6">
					<h3>Thông tin khách hàng</h3>
					<div class="mb-3">
						<label for="hoVaTen" class="form-label">Họ và tên</label> <input
							type="text" class="form-control" id="hoVaTen" name="hoVaTen"
							value="<%=hoVaTen%>">
					</div>
					<div class="mb-3">
						<label for="gioiTinh" class="form-label">Giới tính</label> <select
							class="form-control" id="gioiTinh" name="gioiTinh">
							<option></option>
							<option value="Nam"
								<%=(gioiTinh.equals("Nam") ? "selected='selected'" : "")%>>Nam</option>
							<option value="Nữ"
								<%=(gioiTinh.equals("Nữ") ? "selected='selected'" : "")%>>Nữ</option>
							<option value="Khác"
								<%=(gioiTinh.equals("Khác") ? "selected='selected'" : "")%>>Khác</option>
						</select>
					</div>
					<div class="mb-3">
						<label for="ngaySinh" class="form-label">Ngày sinh</label> <input
							type="date" class="form-control" id="ngaySinh" name="ngaySinh"
							value=<%=ngaySinh%>>
					</div>
				</div>
				<div class="col-md-6">
					<h3>Địa chỉ khách hàng</h3>
					<div class="mb-3">
						<label for="diaChiKhachHang" class="form-label">Địa chỉ
							khách hàng</label> <input type="text" class="form-control"
							id="diaChiKhachHang" name="diaChiKhachHang"
							value="<%=diaChiKhachHang%>">
					</div>
					<div class="mb-3">
						<label for="diaChiMuaHang" class="form-label">Địa chỉ mua
							hàng</label> <input type="text" class="form-control" id="diaChiMuaHang"
							name="diaChiMuaHang" value="<%=diaChiMuaHang%>">
					</div>
					<div class="mb-3">
						<label for="diaChiNhanHang" class="form-label">Địa chỉ
							nhận hàng</label> <input type="text" class="form-control"
							id="diaChiNhanHang" name="diaChiNhanHang"
							value="<%=diaChiNhanHang%>">
					</div>
					<div class="mb-3">
						<label for="dienThoai" class="form-label">Điện thoại</label> <input
							type="tel" class="form-control" id="dienThoai" name="dienThoai"
							value="<%=dienThoai%>">
					</div>
					<div class="mb-3">
						<label for="email" class="form-label">Email</label> <input
							type="email" class="form-control" id="email" name="email"
							value="<%=email%>">
					</div>
					<div class="mb-3">
						<label for="dongYNhanMail" class="form-label">Đồng ý nhận
							bản tin</label> <input type="checkbox" class="form-check-input"
							id="dongYNhanMail" name="dongYNhanMail"
							<%=dongYNhanMail?"checked":""%>>
					</div>
					<input class="btn btn-primary form-control" type="submit"
						value="Lưu thông tin" id="submit">
				</div>
			</div>
		</form>
	</div>
</body>
</html>