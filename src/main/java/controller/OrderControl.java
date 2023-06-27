package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.SanPhamDAO;
import database.TheLoaiDAO;
import model.DonHang;
import model.SanPham;
import model.TheLoai;

/**
 * Servlet implementation class OrderControl
 */
@WebServlet("/gio-hang")
public class OrderControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//DonHang donHang =  (DonHang)session.getAttribute("donHang");
		String maSanPham = request.getParameter("maSanPham");
		ArrayList<SanPham> listOrder = (ArrayList<SanPham>)session.getAttribute("listOrder");
		if(listOrder==null) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		if(maSanPham!=null) {
			SanPhamDAO sanPhamDAO = new SanPhamDAO();
			SanPham sanPham= new SanPham(maSanPham, null, null, 0, 0, 0, 0, 0, null, "", "", "");
			sanPham=sanPhamDAO.selectById(sanPham);
			listOrder.add(sanPham);
		}
		//donHang.getListSP().add(sanPham);
		//session.setAttribute("donHang", donHang);
		
		TheLoaiDAO theLoaiDAO=new TheLoaiDAO();
		ArrayList<TheLoai> listTL = theLoaiDAO.selectAll();
		
		request.setAttribute("listTL", listTL);
		session.setAttribute("listOrder", listOrder);
		request.getRequestDispatcher("cart.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
