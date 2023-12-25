package com.ebook.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ebook.dao.BookDAOImpl;
import com.ebook.db.DBConnect;

/**
 * Servlet implementation class DeleteOldBookById
 */
@WebServlet("/DeleteOldBookById")
public class DeleteOldBookById extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bid = Integer.parseInt(request.getParameter("bid"));
		String email = request.getParameter("email");
		BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
		boolean delFlag = dao.deleteAllOldBookByUserId(email, bid);
		HttpSession session = request.getSession();
		if (delFlag) {
			session.setAttribute("succMsg", "Old Book Deleted Successfully");
			response.sendRedirect("editselloldbooks.jsp");
		} else {
			session.setAttribute("failedMsg", "Old Book Deleted Failed");
			response.sendRedirect("editselloldbooks.jsp");
		}
	}

}
