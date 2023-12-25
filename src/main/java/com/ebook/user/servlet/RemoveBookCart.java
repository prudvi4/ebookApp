package com.ebook.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ebook.dao.CartDAOImpl;
import com.ebook.db.DBConnect;

/**
 * Servlet implementation class RemoveBookCart
 */
@WebServlet("/RemoveBookCart")
public class RemoveBookCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bid = Integer.parseInt(request.getParameter("bid"));
		int uid = Integer.parseInt(request.getParameter("uid"));
		int cid = Integer.parseInt(request.getParameter("cid"));
		CartDAOImpl dao = new CartDAOImpl(DBConnect.getConnection());
		boolean remFlag = dao.remBookCartByBookId(bid, uid, cid);
		HttpSession session = request.getSession();
		if (remFlag) {
			session.setAttribute("succMsg", "Book removed from Cart");
			response.sendRedirect("cart.jsp");
		} else {
			session.setAttribute("failedMsg", "Book removed from Cart Failed");
			response.sendRedirect("cart.jsp");
		}
	}

}
