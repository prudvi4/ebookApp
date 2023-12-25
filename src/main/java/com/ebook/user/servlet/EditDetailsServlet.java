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
 * Servlet implementation class EditDetailsServlet
 */
@WebServlet("/EditDetailsServlet")
public class EditDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String fullName = request.getParameter("fullname");
		String userName = request.getParameter("username");
		String email = request.getParameter("email");
		String number = request.getParameter("number");
		String password = request.getParameter("password");
		// String repassword = req.getParameter("repassword");
		HttpSession session = request.getSession();
		UserVO userValues = new UserVO();
		userValues.setId(id);
		userValues.setFullName(fullName);
		userValues.setUserName(userName);
		userValues.setEmail(email);
		userValues.setNumber(number);
		UserDAOImpl dao = new UserDAOImpl(DBConnect.getConnection());
		boolean checkFlag = dao.checkPassword(id, password);
		if (checkFlag) {
			boolean cheFlag = dao.updateProfileDetails(userValues);
			if (cheFlag) {
				session.setAttribute("succMsg", "Profile Update Successfully");
				response.sendRedirect("profiledetails.jsp");
			} else {
				session.setAttribute("failedMsg", "Something Error in Server..Please try again");
				response.sendRedirect("profiledetails.jsp");
			}
		} else {
			session.setAttribute("failedMsg", "Password is Incorrect..");
			response.sendRedirect("profiledetails.jsp");
		}

	}

}
