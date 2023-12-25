package com.ebook.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ebook.dao.BookDAOImpl;
import com.ebook.db.DBConnect;
import com.ebook.entity.BookVO;

/**
 * Servlet implementation class BooksUpdServlet
 */
@WebServlet("/BooksUpdServlet")
public class BooksUpdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String bookName = request.getParameter("bname");
			String author = request.getParameter("author");
			String price = request.getParameter("price");
			String status = request.getParameter("status");

			BookVO books = new BookVO();
			books.setBookId(id);
			books.setBookname(bookName);
			books.setAuthor(author);
			books.setPrice(price);
			books.setStatus(status);
			HttpSession session = request.getSession();
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
			boolean editFlag = dao.updBooks(books);

			if (editFlag) {
				session.setAttribute("succMsg", "Book Edited Successfully");
				response.sendRedirect("admin/allbooks.jsp");
			} else {
				session.setAttribute("failedMsg", "Book Edited Failed");
				response.sendRedirect("admin/allbooks.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}