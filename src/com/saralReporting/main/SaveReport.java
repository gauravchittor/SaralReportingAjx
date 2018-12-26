package com.saralReporting.main;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/* required when saving images in database
 * import java.io.File;  
import javax.servlet.http.Part;*/

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import com.google.gson.Gson;
import com.saralReporting.bean.ReportBean;
import com.saralReporting.dao.SaveReportDesignDao;

/**
 * Servlet implementation class SaveReport
 */
/* @WebServlet("/SaveReport") */
@MultipartConfig
public class SaveReport extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		ReportBean report = new ReportBean();

		System.out.println("reached in Save Design report servlet");
		Long departmentID = Long.parseLong(request.getParameter("departmentID"));
		Long serviceID = Long.parseLong(request.getParameter("serviceID"));
		System.out.println("service ID is :" + serviceID);
		System.out.println("dep ID is :" + departmentID);
		report.setReport_name(request.getParameter("rpName"));
		report.setTable_color(request.getParameter("rpColor"));
		report.setDepartment_id(departmentID);
		report.setService_id(serviceID);
		report.setUser_id(request.getParameter("userID"));
		report.setVersion_no((long) 0); // need to get front end
		report.setDesignation_id((long) 111); // need to get front end
		report.setTooltip(request.getParameter("tooltip"));
		report.setWhere_condition(request.getParameter("rpWhrCondition"));
		/* report.setGrouping(request.getParameter("rpGrpBy")); */
		String grpby = request.getParameter("grpIdName");
		if(grpby.equals("0-Please Select")){
			report.setGrouping("");
		}else {
			report.setGrouping(grpby);
		}
		
		/*report.setGrouping(request.getParameter("grpIdName"));*/
		System.out.println("Group by :" + report.getGrouping());
		report.setBackground_text(request.getParameter("bgtext"));
		report.setFilter(""); // need to discuss
		report.setHaving(""); // need to discuss
		report.setTable_format(""); // need to discuss
		report.setFooter_image_id(""); // need to discuss
		report.setFooter_image_id(""); // need to discuss
		report.setReport_header(request.getParameter("rpHeader"));
		report.setReport_footer(request.getParameter("rpFooter"));

		String selectedColList = request.getParameter("selectedColList");
		System.out.println("Selected selectedColList list : " + selectedColList);
		HashMap<String, String> hml = new HashMap<>();
		try {
			JSONArray jsonArrObject = new JSONArray(selectedColList);
			System.out.println("jsonob " + jsonArrObject);
			int len = jsonArrObject.length();
			for (int i = 0; i < len; i++) {
				JSONObject objc = jsonArrObject.getJSONObject(i);
				String col_name = objc.getString("key");
				String col_id = objc.getString("Value");
				hml.put(col_name, col_id);
				System.out.println("col Name :" + col_name + "col id :" + col_id);
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}

		report.setSelectedColmn(hml);
		String msg = "";
		// pass parameter and control to DAO layer
		try {
			msg = SaveReportDesignDao.insertData(report);
			System.out.println("msg response from dao layer" + msg);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// code for images uploaded in the form
		/*
		 * Part rpHeaderImg = request.getPart("rpHeaderImg"); Part rpFooterImg =
		 * request.getPart("rpFooterImg"); System.out.println("name" +
		 * rpHeaderImg.getName()); System.out.println(rpHeaderImg.getSize());
		 * System.out.println(rpHeaderImg.getContentType());
		 * System.out.println(rpFooterImg.getName());
		 * System.out.println(rpFooterImg.getSize());
		 * System.out.println(rpFooterImg.getContentType());
		 */
		System.out.println("I am going to send this json response");
		String json = new Gson().toJson(msg);
		response.setContentType("application/json");
		// response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}

}
