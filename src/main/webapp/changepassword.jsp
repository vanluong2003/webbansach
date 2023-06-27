<%@page import="model.KhachHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=divice-width, initial-scale=1, shrink-to-fit=no">
	<title>Đổi mật khẩu</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
	<style>
		.rq{
			color: red;
		}
	</style>
</head>
<%
	String baoLoiMatKhau = request.getAttribute("baoLoi")==null?"":request.getAttribute("baoLoi")+"";
%>
<body>
<%
	Object obj=session.getAttribute("khachHang");
	if(obj==null){	
%>
	<jsp:forward page="login.jsp"></jsp:forward>
<%	} %>
	<div class="container">
	<br/>
		<div class="text-center">
			<h1>ĐỔI MẬT KHẨU</h1>
		</div>
		<div style="display: flex; justify-content: center; align-items: center;">
		<span style="color: red">
			<%=baoLoiMatKhau%>
		</span>
		</div>
		<form action="doi-mat-khau" method="POST">
			<div class="row mb-4" style="display: flex; justify-content: center; align-items: center;">
				<div class="col-md-6">
					<div class="form-outline form-white">
						<label for="matKhauHienTai" class="form-label">Mật khẩu
							hiện tại</label> <input type="password" class="form-control"
							id="matKhauHienTai" name="matKhauHienTai">
					</div>
				</div>
			</div>
			<div class="row mb-4" style="display: flex; justify-content: center; align-items: center;">
				<div class="col-md-6">
					<div class="form-outline form-white">
						<label for="matKhauMoi" class="form-label">Mật khẩu mới</label> <input
						type="password" class="form-control" id="matKhauMoi"
						name="matKhauMoi">
					</div>
				</div>
			</div>
			<div class="row mb-4" style="display: flex; justify-content: center; align-items: center;">
				<div class="col-md-6">
					<div class="form-outline form-white">
						<label for="matKhauNhapLai" class="form-label">Nhập lại mật khẩu mới</label>
					<input type="password" class="form-control" id="matKhauNhapLai"
						name="matKhauNhapLai">
					</div>
				</div>
			</div>
			<div style="display: flex; justify-content: center; align-items: center;">
				<button type="submit" class="btn btn-primary" >Lưu mật khẩu</button>
			</div>
		</form>
	</div>
</body>
</html>