package com.ebook.user.servlet;

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
@WebServlet("/AddOldBookServlet")
@MultipartConfig
public class AddOldBookServlet extends HttpServlet {
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
			String userEmail = request.getParameter("userEmail");
			Part part = request.getPart("bimg");
			String fileName = part.getSubmittedFileName();

			BookVO books = new BookVO(bookName, author, price, "Old Book", "Active", fileName, userEmail);
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
				response.sendRedirect("selloldbooks.jsp");
			} else {
				session.setAttribute("failedMsg", "Book Added Failed");
				response.sendRedirect("selloldbooks.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
