package com.ebook.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ebook.dao.UserDAOImpl;
import com.ebook.db.DBConnect;
import com.ebook.entity.UserVO;

/**
 * Servlet implementation class ForPasswordServlet
 */
@WebServlet("/ForPasswordServlet")
public class ForPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDAOImpl daoImpl = new UserDAOImpl(DBConnect.getConnection());
		HttpSession session = request.getSession();
		String userName = request.getParameter("username");

		UserVO user = daoImpl.getUserPassword(userName);

		if (user != null) {
			session.setAttribute("userobj", user);
			response.sendRedirect("forgotPassword.jsp");
		} else {
			session.setAttribute("failedMsg", "Invalid UserName");
			response.sendRedirect("forgotPassword.jsp");
		}

	}

}
