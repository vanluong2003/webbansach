package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import database.KhachHangDAO;
import model.KhachHang;
import util.MaHoa;


/**
 * Servlet implementation class Register
 */
@WebServlet("/dang-ky")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String tenDangNhap=request.getParameter("tenDangNhap");
		String matKhau=request.getParameter("matKhau");
		String matKhauNhapLai=request.getParameter("matKhauNhapLai");
		String hoVaTen=request.getParameter("hoVaTen");
		String gioiTinh=request.getParameter("gioiTinh");
		String ngaySinh=request.getParameter("ngaySinh");
		String diaChiKhachHang=request.getParameter("diaChiKhachHang");
		String diaChiMuaHang=request.getParameter("diaChiMuaHang");
		String diaChiNhanHang=request.getParameter("diaChiNhanHang");
		String dienThoai=request.getParameter("dienThoai");
		String email=request.getParameter("email");
		String dongYDieuKhoan=request.getParameter("dongYDieuKhoan");
		String dongYNhanMail=request.getParameter("dongYNhanMail");
		
		request.setAttribute("tenDangNhap", tenDangNhap);
		request.setAttribute("hoVaTen", hoVaTen);
		request.setAttribute("gioiTinh", gioiTinh);
		request.setAttribute("ngaySinh", ngaySinh);
		request.setAttribute("diaChiKhachHang", diaChiKhachHang);
		request.setAttribute("diaChiMuaHang", diaChiMuaHang);
		request.setAttribute("diaChiNhanHang", diaChiNhanHang);
		request.setAttribute("dienThoai", dienThoai);
		request.setAttribute("email", email);
		request.setAttribute("dongYNhanMail", dongYNhanMail);
		
		request.setAttribute("hoVaTen1", hoVaTen);

		String url="";
		String baoLoi="";
		KhachHangDAO khachHangDAO=new KhachHangDAO();
		if(khachHangDAO.kiemTraTenDangNhap(tenDangNhap)) {
			baoLoi+="<div>Tên đăng nhập đã tồn tại. Vui lòng chọn tên đăng nhập khác</div><br/>";
		}
		if(matKhau.length()<6) {
			baoLoi+="<div>Mật khẩu phải gồm ít nhất 6 kí tự</div><br/>";
		}else if(!matKhau.equals(matKhauNhapLai)){
			baoLoi+="<div>Nhập lại mật khẩu chưa chính xác</div><br/>";
		}else {
			matKhau=MaHoa.toSHA1(matKhau);
		}
		if(dongYDieuKhoan==null) {
			baoLoi+="<div>Vui lòng đồng ý điều khoản để đăng ký tài khoản</div>";
		}
		if(baoLoi.length()==0) {
			String maKhachHang=System.currentTimeMillis()+"";
			url="/success.jsp";
			KhachHang khachHang=new KhachHang(maKhachHang, tenDangNhap, matKhau, gioiTinh, hoVaTen, diaChiKhachHang, diaChiNhanHang, diaChiMuaHang, Date.valueOf(ngaySinh), dienThoai, email, (dongYNhanMail==null)?false:true);
			khachHangDAO.insert(khachHang);
		}else {
			url="/register.jsp";
			request.setAttribute("baoLoi", baoLoi);
		}
		RequestDispatcher rd=getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
