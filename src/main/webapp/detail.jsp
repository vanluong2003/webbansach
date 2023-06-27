<%@page import="model.SanPham"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
<title>Chi tiết sản phẩm</title>
</head>
<style>
body{
    background-color: #edf1f5;
    margin-top:20px;
}
.card {
    margin-bottom: 30px;
}
.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 0 solid transparent;
    border-radius: 0;
}
.card .card-subtitle {
    font-weight: 300;
    margin-bottom: 10px;
    color: #8898aa;
}
.table-product.table-striped tbody tr:nth-of-type(odd) {
    background-color: #f3f8fa!important
}
.table-product td{
    border-top: 0px solid #dee2e6 !important;
    color: #728299!important;
}
</style>
<body>
<jsp:include page="menu.jsp"></jsp:include>
<%
SanPham sanPham =(SanPham) request.getAttribute("sanPham");
%>
<div class="container">
    <div class="card">
        <div class="card-body">
            <h3 class="card-title"><%=sanPham.getTenSanPham() %></h3>
            <h6 class="card-subtitle"><%=sanPham.getTacGia().getHoVaTen() %></h6>
            <div class="row">
                <div class="col-lg-5 col-md-5 col-sm-6">
                    <div class="white-box text-center"><img src="<%=sanPham.getImg()%>" class="img-responsive" width="500"></div>
                </div>
                <div class="col-lg-7 col-md-7 col-sm-6">
                    <h4 class="box-title mt-5">Mô tả sản phẩm</h4>
                    <p>Lorem Ipsum available,but the majority have suffered alteration in some form,by injected humour,or randomised words which don't look even slightly believable.but the majority have suffered alteration in some form,by injected humour</p>
                    <h2 class="mt-5">
                        <%=(int)sanPham.getGiaBan()%>đ
                        <small class="text-success">(<%=(int)((sanPham.getGiaNhap()/sanPham.getGiaBan())*100-100) %>%off)</small>
                    </h2>
                    <a class="btn btn-primary" style="white-space: nowrap;" href="gio-hang?maSanPham=<%=sanPham.getMaSanPham()%>">
						Thêm vào giỏ hàng
					</a>
                    <h6 class="box-title mt-5">Thể loại: <%=sanPham.getTheLoai().getTenTheLoai() %></h6>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
