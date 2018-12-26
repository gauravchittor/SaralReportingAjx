<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
	<%@page import="com.saralReporting.bean.UserBean"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Saral Reporting</title>
</head>
<body>
	<% 
					UserBean currentUser = (UserBean)(session.getAttribute("currentSessionUser"));
					if (currentUser.getUser_id()==null || currentUser.getUser_id()==""){
					response.sendRedirect("LoginPage.jsp");
					}
					response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
					response.setHeader("Pragma", "no-cache");
					response.setDateHeader("Expiresponse", 0);
	%>
<%-- <% response.setHeader("") %> 
UserBean currentUser = (UserBean)(session.getAttribute("currentSessionUser"));
					if (currentUser.getUser_id()==null || currentUser.getUser_id()==""){
					response.sendRedirect("LoginPage.jsp");
					} --%>
<tiles:insertDefinition name="myapp.homepage" />
</body>
</html>