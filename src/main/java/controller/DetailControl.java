package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.SanPhamDAO;
import database.TheLoaiDAO;
import model.SanPham;
import model.TheLoai;

/**
 * Servlet implementation class DetailControl
 */
@WebServlet("/chi-tiet-san-pham")
public class DetailControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String maSanPham=request.getParameter("maSanPham");
		SanPhamDAO sanPhamDAO= new SanPhamDAO();
		SanPham sanPham= new SanPham(maSanPham, null, null, 0, 0, 0, 0, 0, null, "", "", "");
		sanPham=sanPhamDAO.selectById(sanPham);
		TheLoaiDAO theLoaiDAO=new TheLoaiDAO();
		ArrayList<TheLoai> listTL = theLoaiDAO.selectAll();
		
		request.setAttribute("sanPham", sanPham);
		request.setAttribute("listTL", listTL);

		request.getRequestDispatcher("detail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
