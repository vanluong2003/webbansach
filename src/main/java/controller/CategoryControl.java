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
 * Servlet implementation class CategoryControl
 */
@WebServlet("/the-loai")
public class CategoryControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TheLoaiDAO theLoaiDAO=new TheLoaiDAO();
		ArrayList<TheLoai> listTL = theLoaiDAO.selectAll();
		
		String tenTheLoai=request.getParameter("tenTheLoai");
		TheLoai theLoai = theLoaiDAO.selectByName(tenTheLoai);
		
		SanPhamDAO sanPhamDAO=new SanPhamDAO();
		ArrayList<SanPham> listSP = sanPhamDAO.selectByCategory(theLoai.getMaTheLoai());
		
		//b2 set data to JSP
		request.setAttribute("listSP", listSP);
		request.setAttribute("listTL", listTL);
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
