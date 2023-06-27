package controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.DonHangDAO;
import model.DonHang;
import model.KhachHang;
import model.SanPham;

/**
 * Servlet implementation class OrderSuccess
 */
@WebServlet("/dat-hang-thanh-cong")
public class OrderSuccess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderSuccess() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		KhachHang khachHang= (KhachHang)session.getAttribute("khachHang");
		String maDonHang=System.currentTimeMillis()+"";
		int soTien=Integer.parseInt(request.getParameter("tongTien"));
		String ngayDatHang = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		DonHang donHang= new DonHang(maDonHang, khachHang, khachHang.getDiaChiMuaHang(), khachHang.getDiaChiNhanHang(), soTien, Date.valueOf(ngayDatHang));
		
		DonHangDAO dhDAO=new DonHangDAO();
		dhDAO.insert(donHang);
		ArrayList<SanPham> listOrder = new ArrayList<SanPham>();
		session.setAttribute("listOrder", listOrder);
		
		request.getRequestDispatcher("success.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
