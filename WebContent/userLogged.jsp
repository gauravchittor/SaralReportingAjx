<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html;"
    pageEncoding="ISO-8859-1"
    import="com.saralReporting.bean.UserBean"
    %>
    <%@page import="java.util.*"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
   "http://www.w3.org/TR/html4/loose.dtd">

   <html>

      <head>
      	<meta http-equiv="Content-Type" 
            content="text/html; charset=windows-1256">
         		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>Dashboard - Saral Report</title>
      </head>
	
       <body>
       
         
          <center>
          <div id="div1" style="overflow:auto;  display:none; margin-top: 30px; type:hidden">
            <% UserBean currentUser = (UserBean)(session.getAttribute("currentSessionUser"));%><br/>
            Welcome <%= currentUser.getFirstName()%><br/>
            Login ID : <%= currentUser.getSign_no()%><br/>
            User ID : <%= currentUser.getUser_id()%><br/>
            Department Name : <%= currentUser.getDepartment_level_name()%><br/>
            Department ID : <%= currentUser.getDepartment_id()%><br/>
            Designation ID : <%= currentUser.getDesignation_id()%><br/>
            Designation Name : <%= currentUser.getDesignation_name()%><br/>
            Role Assigned : <%= currentUser.getRole_list()%><br/>
            HashMap mp = currentUser.getRole_list();
      <!--  request.setAttribute("mp", mp);
            pageContext.setAttribute("mp", mp); -->
            
          <%-- Role Assigned :  <% HashMap mp = currentUser.getRole_list();
             Iterator it = mp.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry pair = (Map.Entry)it.next();
                System.out.println(pair.getKey() + " = " + pair.getValue());
                /* it.remove(); // avoids a ConcurrentModificationException */
            } %>
            
             --%>
 		</div>
         </center>
         
           <%@ include file="index.jsp" %>
	</body>
	
   </html>
