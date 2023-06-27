<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=divice-width, initial-scale=1, shrink-to-fit=no">
	<title>Đăng ký</title>
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
	String baoLoi = request.getAttribute("baoLoi")==null?"":request.getAttribute("baoLoi")+"";
	
	String tenDangNhap = request.getAttribute("tenDangNhap")==null?"":request.getAttribute("tenDangNhap")+"";
	String hoVaTen = request.getAttribute("hoVaTen")==null?"":request.getAttribute("hoVaTen")+"";
	String gioiTinh = request.getAttribute("gioiTinh")==null?"":request.getAttribute("gioiTinh")+"";
	String ngaySinh = request.getAttribute("ngaySinh")==null?"":request.getAttribute("ngaySinh")+"";
	String diaChiKhachHang = request.getAttribute("diaChiKhachHang")==null?"":request.getAttribute("diaChiKhachHang")+"";
	String diaChiMuaHang = request.getAttribute("diaChiMuaHang")==null?"":request.getAttribute("diaChiMuaHang")+"";
	String diaChiNhanHang = request.getAttribute("diaChiNhanHang")==null?"":request.getAttribute("diaChiNhanHang")+"";
	String dienThoai = request.getAttribute("dienThoai")==null?"":request.getAttribute("dienThoai")+"";
	String email = request.getAttribute("email")==null?"":request.getAttribute("email")+"";
	String dongYNhanMail = request.getAttribute("dongYNhanMail")==null?"":request.getAttribute("dongYNhanMail")+"";
%>
<body>
<%
	Object obj=session.getAttribute("khachHang");
	if(obj!=null){	
%>
	<jsp:forward page="trang-chu"></jsp:forward>
<%	} %>
<div class="container">
	<div class="text-center"><h1>ĐĂNG KÝ TÀI KHOẢN</h1></div>
	<div class="rq"><%=baoLoi %></div>
	<form class="form" action="dang-ky" method="post">
	<div class="row">
	<div class="col-md-6">
		<h3>Tài khoản</h3>
		<div class="mb-3">
			<label for="tenDangNhap" class="form-label">Tên đăng nhập</label><span class="rq">*</span>
			<input type="text" class="form-control" id="tenDangNhap" name="tenDangNhap" required="required" value="<%=tenDangNhap%>">
		</div>
		<div class="mb-3">
			<label for="matKhau" class="form-label">Mật khẩu</label><span class="rq">*</span>
			<input type="password" class="form-control" id="matKhau" name="matKhau" required="required" onkeyup="kiemTraMatKhau()">
		</div>
		<div class="mb-3">
			<label for="matKhauNhapLai" class="form-label">Nhập lại mật khẩu</label><span class="rq">*</span>
			<span id="msg" class="rq"></span>
			<input type="password" class="form-control" id="matKhauNhapLai" name="matKhauNhapLai" required="required" onkeyup="kiemTraMatKhau()">
		</div>
		<h3>Thông tin khách hàng</h3>
		<div class="mb-3">
			<label for="hoVaTen" class="form-label">Họ và tên</label> 
			<input type="text" class="form-control" id="hoVaTen" name="hoVaTen" value="<%=hoVaTen %>">
		</div>
		<div class="mb-3">
			<label for="gioiTinh" class="form-label">Giới tính</label> 
			<select class="form-control" id="gioiTinh" name="gioiTinh">
				<option></option>
				<option value="Nam"<%=(gioiTinh.equals("Nam")?"selected='selected'":"") %>>Nam</option>
				<option value="Nữ"<%=(gioiTinh.equals("Nữ")?"selected='selected'":"") %>>Nữ</option>
				<option value="Khác"<%=(gioiTinh.equals("Khác")?"selected='selected'":"") %>>Khác</option>
			</select>
		</div>
		<div class="mb-3">
			<label for="ngaySinh" class="form-label">Ngày sinh</label> 
			<input type="date" class="form-control" id="ngaySinh" name="ngaySinh" value=<%=ngaySinh%>>
		</div>
	</div>
	<div class="col-md-6">
		<h3>Địa chỉ khách hàng</h3>
		<div class="mb-3">
			<label for="diaChiKhachHang" class="form-label">Địa chỉ khách hàng</label> 
			<input type="text" class="form-control" id="diaChiKhachHang" name="diaChiKhachHang" value="<%=diaChiKhachHang %>">
		</div>
		<div class="mb-3">
			<label for="diaChiMuaHang" class="form-label">Địa chỉ mua hàng</label> 
			<input type="text" class="form-control" id="diaChiMuaHang" name="diaChiMuaHang" value="<%=diaChiMuaHang %>">
		</div>
		<div class="mb-3">
			<label for="diaChiNhanHang" class="form-label">Địa chỉ nhận hàng</label> 
			<input type="text" class="form-control" id="diaChiNhanHang" name="diaChiNhanHang" value="<%=diaChiNhanHang %>">
		</div>
		<div class="mb-3">
			<label for="dienThoai" class="form-label">Điện thoại</label> 
			<input type="tel" class="form-control" id="dienThoai" name="dienThoai" value="<%=dienThoai %>">
		</div>
		<div class="mb-3">
			<label for="email" class="form-label">Email</label> 
			<input type="email" class="form-control" id="email" name="email" value="<%=email %>">
		</div>
		<div class="mb-3">
			<label for="dongYDieuKhoan" class="form-label">Đồng ý với <a>điều khoản công ty</a><span class="rq">*</span></label> 
			<input type="checkbox" class="form-check-input" id="dongYDieuKhoan" name="dongYDieuKhoan">
		</div>
		<div class="mb-3">
			<label for="dongYNhanMail" class="form-label">Đồng ý nhận bản tin</label> 
			<input type="checkbox" class="form-check-input" id="dongYNhanMail" name="dongYNhanMail" value=<%=(dongYNhanMail.equals("on"))?"on":"off"%>>
		</div>
		<input class="btn btn-primary form-control" type="submit" value="Đăng ký" id="submit">
	</div>
	</div>
	</form>
</div>
</body>
<script>
	function kiemTraMatKhau(){
		var matKhau=document.getElementById("matKhau").value;
		var matKhauNhapLai=document.getElementById("matKhauNhapLai").value;
		if(matKhau!=matKhauNhapLai){
			document.getElementById("msg").innerHTML="- Mật khẩu không khớp!";
			return false;
		}else{
			document.getElementById("msg").innerHTML="";
			return true;
		}
	}
</script>
</html>