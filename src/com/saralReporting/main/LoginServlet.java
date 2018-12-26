package com.saralReporting.main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;

/*import javax.servlet.annotation.WebServlet;*/
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.saralReporting.bean.UserBean;
import com.saralReporting.dao.UserDAO;

/**
 * Servlet implementation class LoginServlet
 */
/*@WebServlet("/LoginServlet")*/
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// TODO Auto-generated method stub
		  response.setContentType("text/html");  
		    PrintWriter out = response.getWriter();
		try {
			
			
			System.out.println("You reached in servlet");
			UserBean user = new UserBean();
			user.setUsername(request.getParameter("un"));
			user.setPassword(request.getParameter("pw"));

			user = UserDAO.login(user);
			
			if (user.isValid()) {
				HttpSession session = request.getSession(true);
				 session = request.getSession(true);
				session.setAttribute("currentSessionUser", user);
				response.sendRedirect("index.jsp"); // logged-in page
				return;
			}
			else
			{
				/*response.sendRedirect("invalidLogin.jsp");*/ // error page
				String text = "Invalid UserName or Password. Please try again.";
			    response.setContentType("text/plain");  
			    response.setCharacterEncoding("UTF-8"); 
			    response.getWriter().write(text); 
				return;
			}

		}

		catch (Throwable theException) {
			System.out.println(theException);
		}
		out.close(); 
	}

}
