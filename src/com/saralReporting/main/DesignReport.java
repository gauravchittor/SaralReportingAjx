package com.saralReporting.main;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
/*import javax.servlet.annotation.WebServlet;*/
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.saralReporting.dao.FetchServiceListDao;

/**
 * Servlet implementation class DesignReport
 */
/*@WebServlet("/DesignReport")*/
public class DesignReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("You reached in Design servlet");
		
		String action = request.getParameter("action");
		System.out.println("action is "+ action);
		
		if (action.equals("fetchService")){ 
			String deptId = request.getParameter("deptid");
			System.out.println("Value in Deptid" + deptId);
		    // to do rest of code..
			HashMap<String, String> hmreturn = FetchServiceListDao.fetchServiceList(deptId);
			
			String json = new Gson().toJson(hmreturn);

		    response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    response.getWriter().write(json);
		    
			/*request.setAttribute("hmreturn", hmreturn);
			request.getRequestDispatcher("index.jsp").forward(request, response);*/
		}
		
		if (action.equals("fetchColumns")){
			//will return services list along with columns
			String deptId = request.getParameter("deptid");
			System.out.println("Value in Deptid" + deptId);
			HashMap<String, String> hmreturn = FetchServiceListDao.fetchServiceList(deptId);
			
			
			//will return column list along as per selected service
			String selectedRecord = request.getParameter("serviceid");
			System.out.println("Value in Service ID : " + selectedRecord);
			HashMap<String, String> colReturn = FetchServiceListDao.fetchColumns(selectedRecord);
			/*request.setAttribute("colReturn", colReturn);
			request.setAttribute("hmreturn", hmreturn);
			request.setAttribute("departmentID", deptId);
			request.setAttribute("serviceID", selectedRecord);
			System.out.println("returned both");
			request.getRequestDispatcher("index.jsp").forward(request, response);*/
			
			String json = new Gson().toJson(colReturn);

		    response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    response.getWriter().write(json);
		}
		
	}

}
