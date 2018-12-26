<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
		<title>Saral Reporting Login Page</title>
		<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/md5.min.js"></script> --%>
		<script type="text/javascript" src="http://www.myersdaily.org/joseph/javascript/md5.js"></script>
		<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
		<script type="text/javascript">
	        MyFunction = function(){
	        	 var passwrd = $("#pass").val();
	        	 var newpass = md5(passwrd);
	        	 $("#pass").val(newpass);
	        }
    </script>			
		
	</head>

	<body>
		<% 
					response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
					response.setHeader("Pragma", "no-cache");
					response.setDateHeader("Expiresponse", 0);
		%>
		<form action="${pageContext.request.contextPath}/LoginServlet" method="post">

			Please enter your username 	<input type="text" name="un"/><br>		
		
			Please enter your password
			<input type="password" id="pass" name="pw"/>
			
			<input type="submit" value="Login" onclick="javascript:MyFunction()"/>
		</form>
	</body>
</html>