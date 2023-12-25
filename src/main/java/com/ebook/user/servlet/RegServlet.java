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
 * Servlet implementation class RegServlet
 */
@WebServlet("/RegServlet")
public class RegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		try {
			String fullName = req.getParameter("fullname");
			String userName = req.getParameter("username");
			String email = req.getParameter("email");
			String number = req.getParameter("number");
			String password = req.getParameter("password");
			// String repassword = req.getParameter("repassword");
			String check = req.getParameter("check");

			if (check != null) {
				UserVO userValues = new UserVO();
				userValues.setFullName(fullName);
				userValues.setUserName(userName);
				userValues.setEmail(email);
				userValues.setNumber(number);
				userValues.setPassword(password);

				UserDAOImpl daoImpl = new UserDAOImpl(DBConnect.getConnection());
				boolean addRegFlag = daoImpl.addUser(userValues);
				if (addRegFlag) {
					// System.out.println("Data Inserted Success");
					session.setAttribute("succMsg", "Account Created Successfully");
					resp.sendRedirect("register.jsp");
				} else {
					// System.out.println("Data Inserted Failed");
					session.setAttribute("failedMsg", "Something Error in Server..Please try again");
					resp.sendRedirect("register.jsp");
				}
			} else {
				session.setAttribute("checkMsg", "Please Agree Terms & Conditions...");
				resp.sendRedirect("register.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
