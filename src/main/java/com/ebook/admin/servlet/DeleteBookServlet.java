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

/**
 * Servlet implementation class DeleteBookServlet
 */
@WebServlet("/DeleteBookServlet")
public class DeleteBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			HttpSession session = req.getSession();
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
			boolean delFlag = dao.delBooks(id);

			if (delFlag) {
				session.setAttribute("succMsg", "Book Deleted Successfully");
				resp.sendRedirect("admin/allbooks.jsp");
			} else {
				session.setAttribute("failedMsg", "Book Deleted Failed");
				resp.sendRedirect("admin/allbooks.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
