package com.ebook.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ebook.dao.BookDAOImpl;
import com.ebook.dao.CartDAOImpl;
import com.ebook.db.DBConnect;
import com.ebook.entity.BookVO;
import com.ebook.entity.CartVO;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int bid = Integer.parseInt(request.getParameter("bid"));
			int uid = Integer.parseInt(request.getParameter("uid"));

			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
			BookVO book = dao.getBookById(bid);

			CartVO cartValues = new CartVO();
			CartDAOImpl cart = new CartDAOImpl(DBConnect.getConnection());
			cartValues.setUid(uid);
			cartValues.setBid(bid);
			cartValues.setBookName(book.getBookname());
			cartValues.setAuthorName(book.getAuthor());
			cartValues.setPrice(Double.parseDouble(book.getPrice()));
			cartValues.setTotalprice(Double.parseDouble(book.getPrice()));
			boolean addFlag = cart.addCart(cartValues);
			HttpSession session = request.getSession();
			if (addFlag) {
				session.setAttribute("addCart", "Book Added to Cart");
				response.sendRedirect("newbooks.jsp");
				// System.out.println("add cart success");
			} else {
				session.setAttribute("addFailedCart", "Book Added Failed to Cart");
				response.sendRedirect("index.jsp");
				// System.out.println("add cart failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
