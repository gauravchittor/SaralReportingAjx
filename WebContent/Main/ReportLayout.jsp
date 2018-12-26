<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.saralReporting.bean.UserBean"%>
<%@page import="java.util.HashMap"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="/error.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">


<head>
<title><tiles:getAsString name="title" /></title>
<tiles:insertAttribute name="cssFile"></tiles:insertAttribute>
</head>
<body class="no-skin">
<div id="header">
			<tiles:insertAttribute name="header" />
		</div>


<div id="body">
			<tiles:insertAttribute name="body" />
		</div>

</body>
</html>