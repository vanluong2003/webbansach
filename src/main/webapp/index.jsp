<%@page import="model.TheLoai"%>
<%@page import="model.SanPham"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.KhachHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Book Store</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
</head>
<style>
#product {
	zoom: 0.91; /* Thu nhỏ tỉ lệ 80% */
	transform: scale(0.91); /* Thu nhỏ tỉ lệ 80% */
}

.rq {
	color: red;
}

#two-lines {
	display: inline-block;
	width: 100%;
	line-height: 1.5; /* Điều chỉnh khoảng cách giữa các dòng */
	max-height: 3em; /* Chiều cao tối đa là 2 dòng */
	overflow: hidden;
	text-overflow: ellipsis;
	/* Hiển thị dấu ba chấm khi văn bản bị cắt ngắn */
}
</style>
<body>
<jsp:include page="menu.jsp"></jsp:include>
	<!-- Page Content -->
	<div class="mt-3" style="margin-left: 20px; margin-right: 30px;">
		<div class="row">
			<div class="col-md-12">
				<!-- Slider -->
			<div class="col md-12" style="margin-left: 100px; margin-right: 100px;">
				<div id="carouselExampleControlsNoTouching" class="carousel slide"
					data-bs-touch="false">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img
								src="https://salt.tikicdn.com/cache/w1080/ts/tikimsp/12/63/83/2b78e78724bcb1fe55dffaecd2e0e04e.png.webp"
								class="d-block w-100" alt="..." height="400">
						</div>
						<div class="carousel-item">
							<img
								src="https://salt.tikicdn.com/cache/w1080/ts/tikimsp/75/e6/eb/8ece4a231c9c2c17a87ebd300b5b8f34.png.webp"
								class="d-block w-100" alt="..." height="400">
						</div>
						<div class="carousel-item">
							<img
								src="https://salt.tikicdn.com/cache/w1080/ts/tikimsp/f0/3a/5c/220b71028facfc9fb0d18e9a0a8f983b.png.webp"
								class="d-block w-100" alt="..." height="400">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleControlsNoTouching"
						data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleControlsNoTouching"
						data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				</div>
				<!-- End Slider -->
		
				<!-- Products -->
				<div class="row" id="product">
					<%
					ArrayList<SanPham> listSP =  (ArrayList<SanPham>)request.getAttribute("listSP");
					for (SanPham sanPham : listSP) { 
					%>
					<div class="col-md-2">
						<div class="card" style="width: 17rem; height: 25rem;">
							<img 
								src="<%=sanPham.getImg()%>"
								class="card-img-top" alt="..." height="300">
							<div class="card-body">
								<h5 class="card-title" >
								<a class="link-offset-2 link-offset-3-hover link-underline link-underline-opacity-0 link-underline-opacity-75-hover" 
									href="chi-tiet-san-pham?maSanPham=<%=sanPham.getMaSanPham() %>"><%=sanPham.getTenSanPham() %></a>
								</h5>
								<div class="card-text"><span style="font-weight: bold;">Giá bán: </span><span class="rq" style="font-weight: bold;"><%=(int)sanPham.getGiaBan() %>đ</span> <span style="text-decoration: line-through;"><%=(int)sanPham.getGiaGoc() %>đ</span>
								</div>
								<!--<a href="gio-hang?maSanPham=<%=sanPham.getMaSanPham()%>" class="btn btn-primary">Add to Cart</a>-->
							</div>
						</div>
					</div>
					<% } %>				
				</div>
				<!-- End Products -->
			</div>
		</div>
	</div>
	<!-- End Page Content -->
	<br/>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
