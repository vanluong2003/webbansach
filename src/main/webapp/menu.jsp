<%@page import="model.KhachHang"%>
<%@page import="model.TheLoai"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Object obj=session.getAttribute("khachHang");
	KhachHang khachHang=null;
	if(obj!=null){
		khachHang=(KhachHang)obj;
	}
%>
<!-- Begin Navbar -->
<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"> <img
				src="https://media.istockphoto.com/id/1034157536/vector/vector-design-element-for-book-store.jpg?s=612x612&w=0&k=20&c=NEoyiXWj5JqcgLB2B_A08dJyw5RpsNnmi8sIVlCiqZE="
				alt="Bootstrap" height="50">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="trang-chu">Trang chủ</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Thể loại </a>
						<ul class="dropdown-menu">
						<%
						ArrayList<TheLoai> listTL =  (ArrayList<TheLoai>)request.getAttribute("listTL");
						for (TheLoai theLoai : listTL) { 
						%>
							<li><a class="dropdown-item" href="the-loai?tenTheLoai=<%= theLoai.getTenTheLoai() %>"><%=theLoai.getTenTheLoai() %></a></li>
						<%} %>
						</ul>
					</li>
				</ul>
				<!-- Search -->
				<form class="d-flex" role="search" action="tim-kiem" method="get">
					<%	String txt = request.getAttribute("txt")==null?"":request.getAttribute("txt")+""; %>
					<input class="form-control me-2" type="text" value="<%=txt %>"
						placeholder="Nội dung tìm kiếm" aria-label="Search" name="txt">
					<button class="btn btn-outline-success" type="submit">Tìm</button>
				</form>
				<!-- End Search -->
				<div style="margin-left: 0.5em"></div>
					<%if(khachHang==null){ %>
					<a class="btn btn-primary" style="white-space: nowrap;" href="login.jsp">
						Đăng nhập
					</a>
					<%}else{ %>
					<div class="btn-group">
					<div>
					<a class="dropdown-item" href="gio-hang">
				<button type="button" class="btn btn-primary">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
 					<path
							d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path>
					</svg>
					Giỏ hàng
				</button>
				</a>
				</div>
				<div>
				<button type="button" class="btn btn-secondary dropdown-toggle"
							data-bs-toggle="dropdown" aria-expanded="false">
							Tài khoản</button>
						<ul class="dropdown-menu dropdown-menu-end">
							<li><a class="dropdown-item" href="changepassword.jsp">Đổi mật khẩu</a></li>
							<li><a class="dropdown-item" href="changeinfor.jsp">Thay đổi thông tin</a></li>
							<li><a class="dropdown-item" href="dang-xuat">Đăng xuất</a></li>
						</ul>
					</div>
				</div>
					<%} %>
			</div>
		</div>
	</nav>
<!-- End Navbar -->