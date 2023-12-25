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
 * Servlet implementation class LogServlet
 */
@WebServlet("/LogServlet")
public class LogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDAOImpl daoImpl = new UserDAOImpl(DBConnect.getConnection());
		;
		HttpSession session = request.getSession();
		try {
			String userName = request.getParameter("username");
			String password = request.getParameter("password");

			// System.out.println(userName + " " + password);

			if ("admin@username".equals(userName) && "admin".equals(password)) {
				UserVO userAdm = new UserVO();
				userAdm.setFullName("Admin");
				session.setAttribute("userobj", userAdm);
				response.sendRedirect("admin/home.jsp");
			} else {

				UserVO user = daoImpl.getUser(userName, password);

				if (user != null) {
					session.setAttribute("userobj", user);
					response.sendRedirect("index.jsp");
				} else {
					session.setAttribute("failedMsg", "Invalid Username or Password");
					response.sendRedirect("login.jsp");
				}
				response.sendRedirect("home.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
