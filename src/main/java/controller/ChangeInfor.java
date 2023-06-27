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

/**
 * Servlet implementation class ChangeInfor
 */
@WebServlet("/thay-doi-thong-tin")
public class ChangeInfor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeInfor() {
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
		
		HttpSession session = request.getSession();
		
		String hoVaTen=request.getParameter("hoVaTen");
		String gioiTinh=request.getParameter("gioiTinh");
		String ngaySinh=request.getParameter("ngaySinh");
		String diaChiKhachHang=request.getParameter("diaChiKhachHang");
		String diaChiMuaHang=request.getParameter("diaChiMuaHang");
		String diaChiNhanHang=request.getParameter("diaChiNhanHang");
		String dienThoai=request.getParameter("dienThoai");
		String email=request.getParameter("email");
		String dongYNhanMail=request.getParameter("dongYNhanMail");
		
		KhachHang kh=(KhachHang)session.getAttribute("khachHang");
		KhachHangDAO khachHangDAO=new KhachHangDAO();
		KhachHang kh_new=new KhachHang(kh.getMaKhachHang(), kh.getTenDangNhap(), kh.getMatKhau(), gioiTinh, hoVaTen, diaChiKhachHang, diaChiNhanHang, diaChiMuaHang, Date.valueOf(ngaySinh), dienThoai, email, (dongYNhanMail==null)?false:true);
		khachHangDAO.update(kh_new);
		session.setAttribute("khachHang", kh_new);
		
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/success.jsp");
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
