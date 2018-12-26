	<%@page import="com.saralReporting.bean.UserBean"%>
				<% UserBean currentUser = (UserBean)(session.getAttribute("currentSessionUser"));
					if (currentUser.getUser_id()==null || currentUser.getUser_id()=="")
					response.sendRedirect("LoginPage.jsp");
				%>
				
	
	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="main-container ace-save-state" id="main-container">
			<script type="text/javascript">
				try{ace.settings.loadState('main-container')}catch(e){}
			</script>

			<div id="sidebar" class="sidebar                  responsive                    ace-save-state">
				<script type="text/javascript">
					try{ace.settings.loadState('sidebar')}catch(e){}
				</script>
				

				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						<button class="btn btn-success">
							<i class="ace-icon fa fa-signal"></i>
						</button>

						<button class="btn btn-info">
							<i class="ace-icon fa fa-pencil"></i>
						</button>

						<button class="btn btn-warning">
							<i class="ace-icon fa fa-users"></i>
						</button>

						<button class="btn btn-danger">
							<i class="ace-icon fa fa-cogs"></i>
						</button>
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>
				</div><!-- /.sidebar-shortcuts -->

				<ul class="nav nav-list">
					<li class="active">
						<a href="index.html">
							<i class="menu-icon fa fa-tachometer"></i>
							<span class="menu-text"> Dashboard </span>
						</a>

						<b class="arrow"></b>
					</li>
				</ul><!-- /.nav-list -->

				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>
			</div>

			<div class="main-content">
				<div class="main-content-inner">
					<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">Home</a>
							</li>
							<li class="active">Dashboard</li>
						</ul><!-- /.breadcrumb -->

						<div class="nav-search" id="nav-search">
							<form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>
							</form>
						</div><!-- /.nav-search -->
					</div>

					<div class="page-content">
						<div class="ace-settings-container" id="ace-settings-container">
							<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
								<i class="ace-icon fa fa-cog bigger-130"></i>
							</div>

							<div class="ace-settings-box clearfix" id="ace-settings-box">
								<div class="pull-left width-50">
									<div class="ace-settings-item">
										<div class="pull-left">
											<select id="skin-colorpicker" class="hide">
												<option data-skin="no-skin" value="#438EB9">#438EB9</option>
												<option data-skin="skin-1" value="#222A2D">#222A2D</option>
												<option data-skin="skin-2" value="#C6487E">#C6487E</option>
												<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
											</select>
										</div>
										<span>&nbsp; Choose Skin</span>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-navbar" autocomplete="off" />
										<label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-sidebar" autocomplete="off" />
										<label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-breadcrumbs" autocomplete="off" />
										<label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" autocomplete="off" />
										<label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-add-container" autocomplete="off" />
										<label class="lbl" for="ace-settings-add-container">
											Inside
											<b>.container</b>
										</label>
									</div>
								</div><!-- /.pull-left -->

								<div class="pull-left width-50">
									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover" autocomplete="off" />
										<label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact" autocomplete="off" />
										<label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight" autocomplete="off" />
										<label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
									</div>
								</div><!-- /.pull-left -->
							</div><!-- /.ace-settings-box -->
						</div><!-- /.ace-settings-container -->

						<div class="page-header">
							<h1>
								Dashboard
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									overview &amp; stats
								</small>
							</h1>
						</div><!-- /.page-header -->

						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="alert alert-block alert-success">
									<button type="button" class="close" data-dismiss="alert">
										<i class="ace-icon fa fa-times"></i>
									</button>

									<i class="ace-icon fa fa-check green"></i>

									Welcome to
									<strong class="green">
										Saral Haryana Reporting Application.
										<small>(v1.0)</small>
									</strong>
								</div>

								

								<div class="hr hr32 hr-dotted">
								
								</div>
								<div id="reportSection">
								<div id="reprt1" style="width:410px; height:200px; float: left;">
									
									<%-- <% UserBean currentUser = (UserBean)(session.getAttribute("currentSessionUser"));%> --%>
									<input type="hidden" name="deptid" value="<%= currentUser.getDepartment_id()%>" id="deptid"/>
									<label><%= currentUser.getDepartment_level_name()%></label> <br/>
									<input type="submit" id="desrpt" value="Design Report"/>

									
								</div>
								<div id="reprt2" style="overflow:scroll; height:200px; width:700px; float:right; display:none;">
									<%-- <form action="${pageContext.request.contextPath}/DesignReport?action=fetchColumns" method="post"> --%>
										
										Please select Service below :
											<select id="selectedRecord" name="selectedRecord" style="width: 600px">
												<option value="0">Please Select</option>
											</select>
											<input type="submit" id="getcol" value="Get Columns"/>

								</div>
								</div>
								<div id="selcol" style="display: none;">
								<div id="ContentPlaceHolder1_CheckBoxList1" style="overflow:scroll; height:300px; width:550px; float:left;">
									<!-- <form action="" method="post"> -->
										
										Please select Columns below : <br/>
										<!-- <input type="checkbox" name="colmn" value="0" onchange="javascript:initialise12()"> 
												 <label for="0">Sample Col</label><br> -->
												<%-- <c:forEach var="colReturn" items="${colReturn}">
												 <input type="checkbox" name="colmn" value="${colReturn.getKey()}"> 
												 <label for="${colReturn.getKey()}">${colReturn.getValue()}</label><br>
												</c:forEach> --%>
												
												<!-- <input type="button" value="Submit"/> -->
									<!-- </form> -->
								</div>
								
								<div id="sortable1" style="overflow:scroll; height:300px; width:560px; float: left;">
								<ul id="sortable" class="cus-jquery-tabs" style="cursor: pointer;">
								</ul>
				  				</div>
				  				<div name="container">
				  				<H1 align="center" >Please fill the required details to design report</H1><br /> <br />
									<div id="customReportDesigner"
										style="overflow: scroll; height: 600px; width: 90%; float: right;">
										<form <%-- action="${pageContext.request.contextPath}/SaveReport" --%> id="mycustreport" method="post" enctype="multipart/form-data">
											<input type="hidden" id="hddnJSON" name="hddnJSON"/>
											<input type="hidden" id="departmentID" name="departmentID" value=""/>
											<input type="hidden" id="serviceID" name="serviceID" value=""/>
											<input type="hidden" id="userID" name="userID" value="<%=currentUser.getUser_id()%>"/>
											<input type="hidden" id="selectedColList" name="selectedColList"/>
											<!-- <table>
												<tr><td>Enter Report Name : </td><td><input type="text" name="rpName"  required="required" /></td></tr>
												<tr><td>Select table Color : </td><td><input class="jscolor" name="rpColor" value="FFFFFF"  /></td></tr>
												<tr><td>Enter Tool-tip : </td><td><input type="text" name="tooltip" /></td></tr>
												<tr><td>Enter Background text : </td><td><input type="text" id="bgtext" name="bgtext"/></td></tr>
												<tr><td>Enter Background text : </td><td><input href="#closebutton" type="text" class="closebutton_open" id="closebutton_open" /></td></tr>  
												<tr><td>Enter Report Header Text : </td><td><input type="text" name="rpHeader"  /></td></tr>
												<tr><td>Enter CK Report Header Text : </td><td><textarea class="textarea" id="rpckHeader" name="rpckHeader"></textarea>
												    	<script>
												    	 CKEDITOR.replace('rpckHeader');
												    	</script>
												</td></tr>
												<tr><td>Enter Report Footer Text : </td><td><input type="text" name="rpFooter"  /></td></tr>
												<tr><td>Upload Header Image: </td><td><input type="file" name="rpHeaderImg" size="50"/></td></tr>
												<tr><td>Upload Footer Image: </td><td><input type="file" name="rpFooterImg" size="50" /></td></tr>
												<tr><td>Select Group By : </td><td><input type="text" name="rpGrpBy" /><select name="rpGrpBy" id="rpGrpBy" name="Titel" >
												<option value="0">Please Select</option>
												</select>
												</td></tr>
												<tr><td>WHERE CONDITION : </td><td><input type="text" name="rpWhrCondition" /></td></tr>
												<tr><td><input type="submit" value="Save Report Design" onclick="javascript:MyJsonFunction()"/></td></tr>
											</table> -->
											<div class="form-group">
										      <label class="control-label col-sm-4" for="rpName">Report Name:</label>
										      <div class="col-sm-8">          
										        <input type="text" class="form-control" id="rpName" placeholder="Enter Report Name" name="rpName" required="required">
										      </div>
										    </div>
											<div class="form-group">
										      <label class="control-label col-sm-4" for="rpColor"> Table Color:</label>
										      <div class="col-sm-8">          
										        <input class="jscolor form-control" id="rpColor" name="rpColor" value="FFFFFF">
										      </div>
										    </div>
											<div class="form-group">
										      <label class="control-label col-sm-4" for="tooltip"> Tool-tip:</label>
										      <div class="col-sm-8">          
										        <input type="text" class="form-control" id="tooltip" placeholder="Enter Tool-tip" name="tooltip">
										      </div>
											</div>
											
											<div class="form-group">
										      <label class="control-label col-sm-4" for="bgtext">Report Background text:</label>
										      <div class="col-sm-8">          
										        <input type="text" class="form-control" id="bgtext" placeholder="Enter Background text " name="bgtext">
										      </div>
											</div>	
											
<!-- 											<div class="form-group">
										      <label class="control-label col-sm-4" for="rpHeader">Report Header Text:</label>
										      <div class="col-sm-8">          
										        <input type="text" class="form-control" id="rpHeader" placeholder="Enter Report Header Text" name="rpHeader">
										      </div>
											</div>

											<script>
												CKEDITOR.replace('rpHeader');
											</script>
												 -->

											
											<div class="form-group">
										      <label class="control-label col-sm-4" for="rpGrpBy">  Select Group By:</label>
										      <div class="col-sm-8">          
												<select class="form-control" name="rpGrpBy" id="rpGrpBy" >
																						<option value="0">Please Select</option>
												</select>
										      </div>
											</div>
											<input  class="form-group" type="hidden" name="grpIdName" id="grpIdName" />
											<div class="form-group">
										      <label class="control-label col-sm-4" for="rpWhrCondition">WHERE CONDITION :</label>
										      <div class="col-sm-8">          
										        <input type="text" class="form-control" id="rpWhrCondition" placeholder="Enter Where Condition" name="rpWhrCondition">
										      </div>
											</div>	
																						<div class="form-group">
										      <label class="control-label col-sm-4" for="rpHeader">Report Header Text:</label>
										      <div class="col-sm-8">          
										        <input type="text" class="form-control" id="rpHeader" placeholder="Enter Report Header Text" name="rpHeader">
										      </div>
											</div>

											<script>
												CKEDITOR.replace('rpHeader');
											</script>
											
											<div class="form-group">
										      <label class="control-label col-sm-4" for="rpFooter">  Report Footer Text:</label>
										      <div class="col-sm-8">          
										        <input type="text" class="form-control" id="rpFooter" placeholder="Enter Report Footer Text" name="rpFooter">
										      </div>
											</div>
											<script>
												CKEDITOR.replace('rpFooter');
											</script>
											
											<input type="submit" value="Save Report Design" onclick="javascript:MyJsonFunction()"/>
											
										</form>
										<div id="customDesign" style="width:400px;">
							        	
							       		</div>
										
									</div>
								</div>
							</div>
				  				<div id="MarkAggregationAndGrouping" class="cus-setting-panel-div" style="display: none;">
							        <div class="cus-setting-panel" style="width: 400%; background: ">
							            Setting Panel
							            <img src="../img/settings-gears.png" class="img-responsive cus-setting-gear" />
							            <a style="cursor: pointer;" onclick="javascript: ClosePopUpMysettings(this);">
							                <img src="../img/close.png" class="img-responsive cus-close" /></a>
							        </div>
							        <div class="cus-settingbody" style="width: 100%; padding: 10px;">
							            <div id="MarkAggregationAndGrouping_Header" style="color: red; font-weight: bold; margin-bottom: 10px;"></div>
							            <label for="AggregationCheckbox">
							                <input id="EnableAggregation" type="checkbox" name="vehicle" value="AggregationCheckbox" />
							                Enable Aggregation</label><br />
							            <label for="InputParameterCheckbox">
							                <input id="InputParameter" type="checkbox" name="vehicle" value="InputParameterCheckbox" />
							                Input Parameter</label><br />
							            <label for="OutputParameterCheckbox">
							                <input id="OutputParameter" type="checkbox" name="vehicle" value="OutputParameterCheckbox" />
							                Output Parameter</label><br />
							            <label style="display: none;" for="GroupingCheckbox">
							                <input style="display: none;" id="EnableGrouping" type="checkbox" name="vehicle" value="GroupingCheckbox" />
							                Enable Grouping</label><br />
							            <input type="button" id="btnsetAggregationAndGrouping" value="Apply" class="cus-setting-apply" onclick="javascript: SaveGRoupingAndAggregation(this);" />
							            <div id="MarkAggregationAndGrouping_Status"></div>
							        </div>
							        
							    </div> 
							    <br/> <br/> <br/> <br/>
							    
				  				

								<!-- <div class="hr hr32 hr-dotted"></div> -->
								<div id="JSONTEXT" style="color: black; font-size: 20px; text-decoration: double;  display: none;"></div>

						<div id="ajaxSpinnerImage"
							style="position: fixed; top: 0px; right: 0px; width: 100%; height: 100%; background-color: #000000; background-image: url('images/ajax-loadern.gif'); background-repeat: no-repeat; background-position: center; z-index: 10000000; opacity: 0.4; filter: alpha(opacity = 30)">
						</div>

<!-- 						code to show ckeditor in a new window popup
								<div id="closebutton" class="well" style="display:none;">
    								<h4>Welcome in 	popup</h4>
    								<p>Hello Gaurav.</p>
    								<textarea class="textarea" id="rpckpop" name="rpckpop"></textarea>
    								<script>
									   	 CKEDITOR.replace('rpckpop');
									</script>
								</div> -->
								
								
								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
						
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->

			<div class="footer">
				<div class="footer-inner">
					<div class="footer-content">
						<span class="bigger-120">
							<span class="blue bolder">Saral Reporting</span>
							 &copy; NIC Haryana
						</span>

						&nbsp; &nbsp;
						<span class="action-buttons">
							<a href="#">
								<i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-rss-square orange bigger-150"></i>
							</a>
						</span>
					</div>
				</div>
			</div>
			</div>