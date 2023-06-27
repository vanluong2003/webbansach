<%@page import="model.KhachHang"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.DonHang"%>
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
<style type="text/css">
@media ( min-width : 1025px) {
	.h-custom {
		height: 100vh !important;
	}
}
</style>
<title>Giỏ hàng</title>
</head>
<body>
<%
	Object obj=session.getAttribute("khachHang");
	if(obj==null){	
%>
	<jsp:forward page="login.jsp"></jsp:forward>
<%	} %>
<%
	KhachHang khachHang=null;
	if(obj!=null){
		khachHang=(KhachHang)obj;
	}
	ArrayList<SanPham> listOrder =  (ArrayList<SanPham>)session.getAttribute("listOrder");
	double tongTien=0;
%>
<section class="h-100 h-custom" style="background-color: #eee;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col">
        <div class="card">
          <div class="card-body p-4">

            <div class="row">

              <div class="col-lg-7">
                <h5 class="mb-3"><a href="trang-chu" class="text-body"><i
                      class="fas fa-long-arrow-alt-left me-2"></i>Tiếp tục mua hàng</a></h5>
                <hr>

                <div class="d-flex justify-content-between align-items-center mb-4">
                  <div>
                    <p class="mb-1">Giỏ hàng</p>
                    <p class="mb-0">Hiện có <%=listOrder!=null?listOrder.size():0%> sản phẩm trong giỏ hàng</p>
                  </div>
                </div>
				<%
					if(listOrder!=null){
					for (SanPham sanPham : listOrder) { 
				%>
                <div class="card mb-3">
                  <div class="card-body">
                    <div class="d-flex justify-content-between">
                      <div class="d-flex flex-row align-items-center">
                        <div>
                          <img
                            src="<%=sanPham.getImg() %>"
                            class="img-fluid rounded-3" alt="Shopping item" style="width: 65px;">
                        </div>
                        <div class="ms-3">
                          <h5><%=sanPham.getTenSanPham() %></h5>
                          <p class="small mb-0"><%=sanPham.getTacGia().getHoVaTen()%></p>
                        </div>
                      </div>
                      <div class="d-flex flex-row align-items-center">
                        <!--  
                        <div style="width: 50px;">
                          <h5 class="fw-normal mb-0">soLuong</h5>
                        </div>
                        -->
                        <div style="width: 80px;">
                          <h5 class="mb-0"><%=(int)sanPham.getGiaBan() %>đ</h5>
                        </div>
                        <a href="#!" style="color: #cecece;"><i class="fas fa-trash-alt"></i></a>
                      </div>
                    </div>
                  </div>
                </div>
				<%
					tongTien+=sanPham.getGiaBan();
					}
				} 
				%>
              </div>
              <div class="col-lg-5">

                <div class="card bg-primary text-white rounded-3">
                  <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                      <h5 class="mb-0">Thông tin người đặt hàng</h5>
                      <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-6.webp"
                        class="img-fluid rounded-3" style="width: 45px;" alt="Avatar">
                    </div>

                    <form class="mt-4">
                      <div class="form-outline form-white mb-4">
                        <input type="text" id="typeName" class="form-control form-control-lg" siez="17"
                          value="<%=khachHang.getHoTen()%>" />
                        <label class="form-label" for="typeName" >Tên người đặt hàng</label>
                      </div>

                      <div class="form-outline form-white mb-4">
                        <input type="text" id="typeText" class="form-control form-control-lg" siez="17"
                          value="<%=khachHang.getDiaChiNhanHang()%>" minlength="19" maxlength="19" />
                        <label class="form-label" for="typeText">Địa chỉ nhận hàng</label>
                      </div>

                      <div class="row mb-4">
                        <div class="col-md-6">
                          <div class="form-outline form-white">
                            <input type="text" id="typeExp" class="form-control form-control-lg"
                              value="<%=khachHang.getSoDienThoai()%>" size="7" id="exp" minlength="7" maxlength="7" />
                            <label class="form-label" for="typeExp">Số điện thoại</label>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-outline form-white">
                            <input type="email" id="typeText" class="form-control form-control-lg"
                              value="<%=khachHang.getEmail()%>" size="1" minlength="3" maxlength="3" />
                            <label class="form-label" for="typeText">Email</label>
                          </div>
                        </div>
                      </div>

                    </form>

                    <hr class="my-4">

                    <div class="d-flex justify-content-between">
                      <p class="mb-2">Số tiền đặt hàng</p>
                      <p class="mb-2"><%=(int)tongTien %> đ</p>
                    </div>

                    <div class="d-flex justify-content-between">
                      <p class="mb-2">Thuế VAT</p>
                      <p class="mb-2"><%=(int)tongTien*10/100 %> đ</p>
                    </div>

                    <div class="d-flex justify-content-between mb-4">
                      <p class="mb-2">Cần thanh toán</p>
                      <p class="mb-2"><%=(int)tongTien*110/100 %> đ</p>
                    </div>
					<!-- 
                    <button type="submit" class="btn btn-info btn-block btn-lg">
                      <div class="d-flex justify-content-between">
                        <span></span>
                        <span>Đặt hàng <i class="fas fa-long-arrow-alt-right ms-2"></i></span>
                      </div>
                    </button>
					-->
					<a class="btn btn-light" style="white-space: nowrap;" href="dat-hang-thanh-cong?tongTien=<%=(int)tongTien*110/100%>">
						Đặt hàng
					</a>
                  </div>
                </div>

              </div>

            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>