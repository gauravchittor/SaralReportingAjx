<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<head>
<title><tiles:getAsString name="title" />
</title>
<tiles:insertAttribute name="cssFile"></tiles:insertAttribute>


	
		
</head>
<body>
	<div>
			<tiles:insertAttribute name="js" />
		</div>
<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
	

		

	
	<div id="footer">
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>