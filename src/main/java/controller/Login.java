package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.DonHangDAO;
import database.KhachHangDAO;
import model.DonHang;
import model.KhachHang;
import model.SanPham;
import util.MaHoa;

/**
 * Servlet implementation class Login
 */
@WebServlet("/dang-nhap")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tenDangNhap=request.getParameter("tenDangNhap");
		String matKhau=request.getParameter("matKhau");
		matKhau=MaHoa.toSHA1(matKhau);
		
		KhachHangDAO khachHangDAO=new KhachHangDAO();
		KhachHang khachHang=khachHangDAO.kiemTraDangNhap(tenDangNhap,matKhau);
		
		String url="";
		if(khachHang!=null) {
			HttpSession session=request.getSession();
			session.setAttribute("khachHang", khachHang);
			//DonHang donHang = new DonHang();
			ArrayList<SanPham> listOrder = new ArrayList<SanPham>();
			//session.setAttribute("donHang", donHang);
			session.setAttribute("listOrder", listOrder);
			url="/trang-chu";
		}else {
			String baoLoi="";
			request.setAttribute("baoLoi", "Tên đăng nhập hoặc Mật khẩu không chính xác");
			url="/login.jsp";
		}
		RequestDispatcher rd=getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
