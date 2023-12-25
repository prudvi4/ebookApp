package com.ebook.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.ebook.dao.BookDAOImpl;
import com.ebook.db.DBConnect;
import com.ebook.entity.BookVO;

/**
 * Servlet implementation class BooksAddServlet
 */
@WebServlet("/BooksAddServlet")
@MultipartConfig
public class BooksAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String bookName = request.getParameter("bname");
			String author = request.getParameter("author");
			String price = request.getParameter("price");
			String categories = request.getParameter("categories");
			String status = request.getParameter("status");
			Part part = request.getPart("bimg");
			String fileName = part.getSubmittedFileName();

			BookVO books = new BookVO(bookName, author, price, categories, status, fileName, "admin");
			// System.out.println(books);

			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());

			boolean addbookFlag = dao.addBooks(books);
			HttpSession session = request.getSession();
			if (addbookFlag) {
				// Getting Upload Photo of Books
				String path = "C:\\Users\\user\\eclipse-workspace\\EBook_Application(JDBC+JSP+MYSQL+SERVLET)\\src\\main\\webapp\\book";
				File file = new File(path);
				part.write(path + File.separator + fileName);

				session.setAttribute("succMsg", "Book Added Successfully");
				response.sendRedirect("admin/addbooks.jsp");
			} else {
				session.setAttribute("failedMsg", "Book Added Failed");
				response.sendRedirect("admin/addbooks.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
