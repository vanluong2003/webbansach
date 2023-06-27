package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.KhachHangDAO;
import model.KhachHang;
import util.MaHoa;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/doi-mat-khau")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String matKhauHienTai=request.getParameter("matKhauHienTai");
		String matKhauMoi=request.getParameter("matKhauMoi");
		String matKhauNhapLai=request.getParameter("matKhauNhapLai");
		
		String url="";
		String baoLoi="";
		
		HttpSession session =request.getSession();
		KhachHang khachHang=(KhachHang)session.getAttribute("khachHang");
		String tmp=MaHoa.toSHA1(matKhauHienTai);
		if(!tmp.equals(khachHang.getMatKhau())) {
			baoLoi+="<div>Mật khẩu hiện tại không đúng</div><br/>";
		}else if(matKhauMoi.length()<6) {
			baoLoi+="<div>Mật khẩu phải gồm ít nhất 6 kí tự</div><br/>";
		}else if(!matKhauMoi.equals(matKhauNhapLai)){
			baoLoi+="<div>Nhập lại mật khẩu chưa chính xác</div><br/>";
		}else {
			matKhauMoi=MaHoa.toSHA1(matKhauMoi);
			khachHang.setMatKhau(matKhauMoi);
		}
		
		if(baoLoi.length()==0) {
			url="/success.jsp";
			KhachHangDAO khachHangDAO=new KhachHangDAO();
			khachHangDAO.updateMatKhau(khachHang);
		}else {
			url="/changepassword.jsp";
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
