
<!-- bootstrap & fontawesome -->
		<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.saralReporting.bean.UserBean"%>
<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css" />
		<link rel="stylesheet" href="css/jquery-ui.css" />

		<!-- page specific plugin styles -->
	<!-- <script src="https://code.jquery.com/jquery-3.3.1.js"></script> -->
		<!-- text fonts -->
		<link rel="stylesheet" href="assets/css/fonts.googleapis.com.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="css/popup.css" />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
			
		<script src="assets/js/jquery-2.1.4.min.js"></script>
		<script src="ckeditor/ckeditor.js"></script>
		<script src="js/jquery.popupoverlay.js"></script>
		<!-- <script src="js/jquery-3.3.1.js"></script> -->
		<script src="js/jquery-ui.js"></script>
		<script src="js/jscolor.js"></script>
		<!-- <script src="js/jquery.min.js"></script>  -->

		<!-- <![endif]-->

		<!--[if IE]>
<script src="assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="assets/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->

		<!--[if lte IE 8]>
		  <script src="assets/js/excanvas.min.js"></script>
		<![endif]-->
		<script src="assets/js/jquery-ui.custom.min.js"></script>
		<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="assets/js/jquery.easypiechart.min.js"></script>
		<script src="assets/js/jquery.sparkline.index.min.js"></script>
		<script src="assets/js/jquery.flot.min.js"></script>
		<script src="assets/js/jquery.flot.pie.min.js"></script>
		<script src="assets/js/jquery.flot.resize.min.js"></script>

		<!-- ace scripts -->
		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
	        MyJsonFunction = function(){
	        	 var abc = $("#JSONTEXT").text(); 
	             $("#selectedColList").val(abc); 
	             
	             var nvg = $("#rpGrpBy").val();
	             var nmg = $("#rpGrpBy option:selected").text();
	             var tobesave = nvg + "-" + nmg;
	             $("#grpIdName").val(tobesave);
	             
	             /* var desc = CKEDITOR.instances['rpckHeader'].getData(); */
	             var desc = CKEDITOR.instances['rpHeader'].getData();
	             $("#rpHeader").val(desc);
	             
	             var desc1 = CKEDITOR.instances['rpFooter'].getData();
	             $("#rpFooter").val(desc1);

	        }
    	</script>
		
		<script type="text/javascript">
			jQuery(function($) {
			
			  //flot chart resize plugin, somehow manipulates default browser resize event to optimize it!
			  //but sometimes it brings up errors with normal resize event handlers
			  $.resize.throttleWindow = false;
			
			 	/////////////////////////////////////
				$(document).one('ajaxloadstart.page', function(e) {
					$tooltip.remove();
				});
			
				
				//Android's default browser somehow is confused when tapping on label which will lead to dragging the task
				//so disable dragging when clicking on label
				var agent = navigator.userAgent.toLowerCase();
				if(ace.vars['touch'] && ace.vars['android']) {
				  $('#tasks').on('touchstart', function(e){
					var li = $(e.target).closest('#tasks li');
					if(li.length == 0)return;
					var label = li.find('label.inline').get(0);
					if(label == e.target || $.contains(label, e.target)) e.stopImmediatePropagation() ;
				  });
				}
			
				$('#tasks').sortable({
					opacity:0.8,
					revert:true,
					forceHelperSize:true,
					placeholder: 'draggable-placeholder',
					forcePlaceholderSize:true,
					tolerance:'pointer',
					stop: function( event, ui ) {
						//just for Chrome!!!! so that dropdowns on items don't appear below other items after being moved
						$(ui.item).css('z-index', 'auto');
					}
					}
				);
				$('#tasks').disableSelection();
				$('#tasks input:checkbox').removeAttr('checked').on('click', function(){
					if(this.checked) $(this).closest('li').addClass('selected');
					else $(this).closest('li').removeClass('selected');
				});
			
			
				//show the dropdowns on top or bottom depending on window height and menu position
				$('#task-tab .dropdown-hover').on('mouseenter', function(e) {
					var offset = $(this).offset();
			
					var $w = $(window)
					if (offset.top > $w.scrollTop() + $w.innerHeight() - 100) 
						$(this).addClass('dropup');
					else $(this).removeClass('dropup');
				});
			
			})
		</script>
		
		
		<!-- ace settings handler -->
		

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="assets/js/html5shiv.min.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]-->
		
		
		<!--Script for checkbox addition and removal from another div  -->
		
		<script type="text/javascript">
	  var addition = [];
      var querystring = '';
      var Declarequerystring = '';
      var wherequerystring = '';
      $(document).ready(function () {
    	  
    	  $('#closebutton').popup({
    	        closebutton: true
    	    });
    	  
    	  //ajax spinner starts
    	  $("#ajaxSpinnerImage").hide();
    	  $(document)
          .ajaxStart(function () {
               $("#ajaxSpinnerImage").show();
          })
          .ajaxStop(function () {
               $("#ajaxSpinnerImage").hide();
          });
    	  //ajax spinner ends here
    	
    	
    		$('#desrpt').click(function() {
    			$.ajax({
    				type : "post",
    				url : 'DesignReport',
    				data : {
    					deptid : $('#deptid').val(),
    					action : "fetchService"
    				},
    				success : function(responseJson) {
    					console.log(responseJson);
    					$("#reprt2").show();
    					 var $select = $("#selectedRecord");                         
    				        $select.find("option").remove();
    				        $("<option>").val(0).text("Please Select").appendTo($select);		
    				        $.each(responseJson, function(key, value) {              
    				            $("<option>").val(key).text(value).appendTo($select); 
    				        });
    				}
    			});
    		});
    		
    		$('#getcol').click(function() {
    			$.ajax({
    				type : "post",
    				url : 'DesignReport',
    				data : {
    					deptid : $('#deptid').val(),
    					serviceid: $('#selectedRecord').val(),
    					action : "fetchColumns"
    				},
    				success : function(responseJson1) {
    					$("#selcol").show();
    					console.log(responseJson1);
    					$('#ContentPlaceHolder1_CheckBoxList1').empty();
    						   $.each(responseJson1, function(key, value) {               
    				            /*  $('#ContentPlaceHolder1_CheckBoxList1').append('<input name="colmn" type="checkbox" value="'+ key +'"/> '+ value +'<br/>'); */
    				           $('#ContentPlaceHolder1_CheckBoxList1').append('<input type="checkbox"  name="colmn" value="'+ key +'"/> ' +  '<label for="'+ key +'" > '+ value +'</label>' +'<br/>');
    				         
    				        });
    						   
    						   $('#departmentID').val($('#deptid').val());
    						   $('#serviceID').val($('#selectedRecord').val());
    							abc();	       
    				}
    			});
    		});
    		
 		   $('#mycustreport').submit(function (e){
 			 			 e.preventDefault();
			            $.ajax({
			                type: "post",
			                url: "SaveReport",
			                data: $(this).serialize(),
							success:function(result){
								console.log("My ajax 1");
								console.log(result);
								 $('#customDesign').text(result);
								 console.log("My ajax");
								 e.preventDefault();
							}
			            });
			        });
    		   
        var url = document.URL;
		function abc(){
			$('#ContentPlaceHolder1_CheckBoxList1').find('input[type="checkbox"]').on('change', function () {
			
      		  if ($(this).prop("checked") == true) {
            var number = $(this).next('label').text();
            var index = addition.map(function (e) { return e.key; }).indexOf(number); // check if exists in array
            if (index !== -1) {
                var numberTobeusedRandomly = 1;
                var next_suggested_Name = $(this).next('label').text() + "_" + numberTobeusedRandomly;
                while (addition.map(function (e) { return e.key; }).indexOf(next_suggested_Name) !== -1) {
                    numberTobeusedRandomly = numberTobeusedRandomly + 1;
                    next_suggested_Name = $(this).next('label').text() + "_" + numberTobeusedRandomly;
                }
                //
                var AnotherFieldName = prompt('"' + $(this).next('label').text() + '"' + " field is already taken !! Kindly enter another Name for this field.", next_suggested_Name);
                if (AnotherFieldName != null) {
                    //addition[AnotherFieldName] = $(this).val();
                    if (addition.map(function (e) { return e.key; }).indexOf(AnotherFieldName) !== -1) {
                        $(this).prop("checked", false);
                        $(this).next('label').css('color', 'black');
                        alert('Choose another field name !!');
                    }
                    else {
                        $(this).next('label').text(AnotherFieldName);
                        $(this).next('label').css('color', 'red');
                        AppendToSortable('ul#sortable', '<li InputParameter="0" OutputParameter="0" isactive="0" aggregation="0" grouping="0" ondblclick="javascript:CheckAggregationandGrouping(this);" key="' + $(this).next('label').text() + '" value="' + $(this).val() + '" class="ui-state-default tagme ui-sortable-handle ui-draggable ui-draggable-handle"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>' + $(this).next('label').text() + '<span a="a" class="cus-li-label disable-label">A</span><span In="In" class="cus-li-label disable-label">I</span><span Ou="Ou" class="cus-li-label disable-label">O</span><span style="display:none;"  g="g" class="cus-li-label disable-label">G</span></li>', $(this).next('label').text(), $(this).val());

                    }
                }
                else {
                    $(this).prop("checked", false);
                    $(this).next('label').css('color', 'black');
                }
            }
            else {

                $(this).next('label').css('color', 'blue');
                //add item to tag system
                AppendToSortable('ul#sortable', '<li isactive="0" InputParameter="0" OutputParameter="0" aggregation="0" grouping="0" ondblclick="javascript:CheckAggregationandGrouping(this);" key="' + $(this).next('label').text() + '" value="' + $(this).val() + '" class="ui-state-default tagme ui-sortable-handle ui-draggable ui-draggable-handle"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>' + $(this).next('label').text() + '<span a="a" class="cus-li-label disable-label">A</span><span In="In" class="cus-li-label disable-label">I</span><span Ou="Ou" class="cus-li-label disable-label">O</span><span style="display:none;"  g="g" class="cus-li-label disable-label">G</span></li>', $(this).next('label').text(), $(this).val());
            }
        }
        else {
            //debugger;
            //delete addition[$(this).next('label').text()];
            $(this).next('label').css('color', 'black');
            DeleteFromSortable($(this).val(), $(this).next('label').text());
        }

        $('#ContentPlaceHolder1_dsfkjsfbsdfjbsfskdjfbsdkbfsdjbfsjkbfkjbkfjbkjsbfsdkjbfjkdsfsjhbfdkuyhvfeuhkhvdvkjhbfkjhbjhbdfkuyufdjbhjhbfdvkjkjbhvfdjbvfjbjbjbxcxvvdfjhbhb').val(JSON.stringify(addition));
        $('#JSONTEXT').html(JSON.stringify(addition));
        /* var abc = $("#JSONTEXT").text(); */
        $("#hddnJSON").val(JSON.stringify(addition));
        initSelBox_Product();
        //alert(text);
    	});
		}
      });

      
      //append selected columns in dropdown list
      function initSelBox_Product() {
    	var titelliste= $("#hddnJSON").val();
   		var o = JSON.parse(titelliste);
    	console.log(o);
    	$('#rpGrpBy').empty();
    	
    	var newOption1 = $('<option/>');
		newOption1.text("Please Select");
		newOption1.attr('value', "0");
		$('#rpGrpBy').append(newOption1);

		var length = (o.length);
		for(var j = 0; j < length; j++)
			{
				var newOption = $('<option/>');
				newOption.text(o[j].key);
				newOption.attr('value', o[j].Value);
				$('#rpGrpBy').append(newOption);
			}
		}
//append to sortable list
function AppendToSortable(element, item, key, value) {
    $(element).append(item);
    var addition_Property = {};
    addition_Property['key'] = key;
    addition_Property['Value'] = value;
    addition_Property['Ag'] = "0";
    addition_Property['Gr'] = "0";
    addition_Property['In'] = "0";
    addition_Property['Ou'] = "0";
    addition.push(addition_Property);
    //

    $("#sortable").sortable({
        change: function (event, ui) {
            // alert($(ui.item).attr('key'));
            // alert($(ui.item).attr('value'));
            // drop and rebuild addition array again as per new alignment

        },
        stop: function (event, ui) {
            checkifeventofdragisAlive = '1';
            addition = [];
            $(this).parent().find('li').each(function (index, item) {
                var addition_Property = {};
                addition_Property['key'] = $(this).attr('key');
                addition_Property['Value'] = $(this).attr('value');
                addition_Property['Ag'] = $(this).attr('aggregation');
                addition_Property['Gr'] = $(this).attr('grouping');
                addition_Property['In'] = $(this).attr('InputParameter');
                addition_Property['Ou'] = $(this).attr('OutputParameter');
                addition.push(addition_Property);
            });
            $('#ContentPlaceHolder1_dsfkjsfbsdfjbsfskdjfbsdkbfsdjbfsjkbfkjbkfjbkjsbfsdkjbfjkdsfsjhbfdkuyhvfeuhkhvdvkjhbfkjhbjhbdfkuyufdjbhjhbfdvkjkjbhvfdjbvfjbjbjbxcxvvdfjhbhb').val(JSON.stringify(addition));
            $('#JSONTEXT').html(JSON.stringify(addition));
            event.stopPropagation();
            event.stopImmediatePropagation();
            checkifeventofdragisAlive = '0';
        }
    });
}

//code for Aggregation and Grouping
		var checkifeventofdragisAlive = '0';
        function CheckAggregationandGrouping(element) {
            if (checkifeventofdragisAlive == '0') {
                $('span.loading_Personal').html('');
                $('ul#sortable').find('li').attr('isactive', '0');
                $(element).attr('isactive', '1');
                $('#EnableGrouping').prop('checked', $(element).attr('grouping') == '1' ? true : false); // set filled value
                $('#EnableAggregation').prop('checked', $(element).attr('aggregation') == '1' ? true : false);
                $('#OutputParameter').prop('checked', $(element).attr('OutputParameter') == '1' ? true : false);
                $('#InputParameter').prop('checked', $(element).attr('InputParameter') == '1' ? true : false);
                $('#MarkAggregationAndGrouping_Status').html('');
                $('#MarkAggregationAndGrouping_Header').html('');
                $('#MarkAggregationAndGrouping_Header').html($(element).attr('key'));
                $('#loadingwholepage').show();
                $(element).css('z-index', '999999');
                var destination = $(element).offset();
                $('#MarkAggregationAndGrouping').css({ top: destination.top - ($('#MarkAggregationAndGrouping').height()), left: destination.left });
                $('#MarkAggregationAndGrouping').show(800);
            }
        };



//code to remove selected item from list
        function DeleteFromSortable(value, key) {

            var index = addition.map(function (e) { return e.key; }).indexOf(key);
            //delete addition[key];
            //var index = array.indexOf(item);
            if (index !== -1) addition.splice(index, 1);
            var elementToRemove = 'ul#sortable > li[key="' + key + '"][value="' + value + '"]';
            $(elementToRemove).remove();
        }
	
        function ClosePopUpMysettings(element) {
            $('#loadingwholepage').hide(1000);
            $('#MarkAggregationAndGrouping').hide(200);
            $('#MarkAggregationAndGrouping_Header').html('');
            $('#EnableGrouping').prop('checked', false);
            $('#EnableAggregation').prop('checked', false);
            $('span.loading_Personal').html('');
        }
        function SaveGRoupingAndAggregation(element) {
            $('span.loading_Personal').html('Saving....');
            $('#MarkAggregationAndGrouping_Status').html('Saving....');
            $('#loadingwholepage').hide(1000);
            //if (index !== -1) addition.splice(index, 1);
            //debugger;
            var index = addition.map(function (e) { return e.key; }).indexOf($('ul#sortable').find('li[isactive="1"]').attr('key'));
            if ($('#EnableGrouping').prop("checked") == true) {
                $('ul#sortable').find('li[isactive="1"]').attr('grouping', '1');
                addition[index].Gr = "1";
                $('ul#sortable').find('li[isactive="1"]').find('span[g="g"]').removeClass('disable-label').addClass('enable-label');
            }
            else {
                $('ul#sortable').find('li[isactive="1"]').attr('grouping', '0');
                addition[index].Gr = "0";
                $('ul#sortable').find('li[isactive="1"]').find('span[g="g"]').removeClass('enable-label').addClass('disable-label');
            }
            if ($('#EnableAggregation').prop("checked") == true) {
                $('ul#sortable').find('li[isactive="1"]').attr('aggregation', '1');
                addition[index].Ag = "1";
                $('ul#sortable').find('li[isactive="1"]').find('span[a="a"]').removeClass('disable-label').addClass('enable-label');
            }
            else {
                $('ul#sortable').find('li[isactive="1"]').attr('aggregation', '0');
                addition[index].Ag = "0";
                $('ul#sortable').find('li[isactive="1"]').find('span[a="a"]').removeClass('enable-label').addClass('disable-label');
            }

            //input and output
            if ($('#InputParameter').prop("checked") == true) {
                $('ul#sortable').find('li[isactive="1"]').attr('InputParameter', '1');
                addition[index].In = "1";
                $('ul#sortable').find('li[isactive="1"]').find('span[In="In"]').removeClass('disable-label').addClass('enable-label');
            }
            else {
                $('ul#sortable').find('li[isactive="1"]').attr('InputParameter', '0');
                addition[index].In = "0";
                $('ul#sortable').find('li[isactive="1"]').find('span[In="In"]').removeClass('enable-label').addClass('disable-label');
            }

            if ($('#OutputParameter').prop("checked") == true) {
                $('ul#sortable').find('li[isactive="1"]').attr('OutputParameter', '1');
                addition[index].Ou = "1";
                $('ul#sortable').find('li[isactive="1"]').find('span[Ou="Ou"]').removeClass('disable-label').addClass('enable-label');
            }
            else {
                $('ul#sortable').find('li[isactive="1"]').attr('OutputParameter', '0');
                addition[index].Ou = "0";
                $('ul#sortable').find('li[isactive="1"]').find('span[Ou="Ou"]').removeClass('enable-label').addClass('disable-label');
            }
            $('ul#sortable').find('li').attr('isactive', '0'); // deactivate all
            //reset
            $('#MarkAggregationAndGrouping').hide(200);
            $('#MarkAggregationAndGrouping_Header').html('');
            $('#EnableGrouping').prop('checked', false);
            $('#EnableAggregation').prop('checked', false);
            $('#InputParameter').prop('checked', false);
            $('#OutputParameter').prop('checked', false);
            $('span.loading_Personal').html('');
            $('#ContentPlaceHolder1_dsfkjsfbsdfjbsfskdjfbsdkbfsdjbfsjkbfkjbkfjbkjsbfsdkjbfjkdsfsjhbfdkuyhvfeuhkhvdvkjhbfkjhbjhbdfkuyufdjbhjhbfdvkjkjbhvfdjbvfjbjbjbxcxvvdfjhbhb').val(JSON.stringify(addition));
            $('#JSONTEXT').html(JSON.stringify(addition));
        }
        $(function () {
            $("#sortable").sortable({
                change: function (event, ui) {
                    // alert($(ui.item).attr('key'));
                    // alert($(ui.item).attr('value'));
                    // drop and rebuild addition array again as per new alignment
                },
                stop: function (event, ui) {
                    checkifeventofdragisAlive = '1';
                    addition = [];
                    $(this).parent().find('li').each(function (index, item) {
                        var addition_Property = {};
                        addition_Property['key'] = $(this).attr('key');
                        addition_Property['Value'] = $(this).attr('value');
                        addition_Property['Ag'] = $(this).attr('aggregation');
                        addition_Property['Gr'] = $(this).attr('grouping');
                        addition_Property['In'] = $(this).attr('InputParameter');
                        addition_Property['Ou'] = $(this).attr('OutputParameter');
                        addition.push(addition_Property);
                    });
                    $('#ContentPlaceHolder1_dsfkjsfbsdfjbsfskdjfbsdkbfsdjbfsjkbfkjbkfjbkjsbfsdkjbfjkdsfsjhbfdkuyhvfeuhkhvdvkjhbfkjhbjhbdfkuyufdjbhjhbfdvkjkjbhvfdjbvfjbjbjbxcxvvdfjhbhb').val(JSON.stringify(addition));
                    $('#JSONTEXT').html(JSON.stringify(addition));
                    //$("selectedColList").val(JSON.stringify(addition));
                    event.stopPropagation();
                    event.stopImmediatePropagation();
                    checkifeventofdragisAlive = '0';
                }
            });
            $("#sortable").disableSelection();
        });
	
	
	//code to add and remove as array
	/* 	$(function() {
			$(":checkbox").change(function() {
				var arr = $(":checkbox:checked").map(function() {
					return $(this).next().html();
				}).get();
				
				$("#selectcol").html(arr.join(', '));
			});
		});

		function ToggleBGColour(item) {
			var td = $(item).parent();
			if (td.is('.rowSelected'))
				td.removeClass("rowSelected");
			else
				td.addClass("rowSelected");
		}
 */	
 
 </script>
		
		<div id="roleModal" class="modal fade" role="dialog" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header header-border'">
				<button type="button" class="close" data-dismiss="modal"> X </button>
				<% UserBean currentUser = (UserBean)(session.getAttribute("currentSessionUser"));%>
				<h4 class="modal-title">Assigned Role to the user- <%= currentUser.getFirstName()%></h4>
			</div>
			<div class="modal-body">
			<html>
				<body>
					<div class="col-lg-12">
									<li class="list-group-item">
									<% HashMap mp = currentUser.getRole_list();
									Iterator it = mp.entrySet().iterator(); %>
								 	<% 	while (it.hasNext()) {
									Map.Entry pair = (Map.Entry)it.next(); %>
										<ul>
										<% out.println(pair.getValue());%>
										</ul>
									<%	} %>
									</li>
					</div>
  
				</body>
				</html>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">
					<i class="fa fa-times-circle"></i>&nbsp;Close
				</button>
			</div>
		</div>

	</div>
</div>


<script>

function roles(){
	//var url = "viewUserRoles.do?OWASP_CSRFTOKEN=M0HF-6I7H-S0NS-8KX9-G0U9-TUCN-EDUR-FHA9";
	//$("#roleFrame").attr('src', url);
	$("#roleModal").modal();
}

/* $(document).ready(function () {

    $('#spinner').bind("ajaxSend", function() {
        $(this).show();
    }).bind("ajaxComplete", function() {
        $(this).hide();
    });

}); */
</script>

<!-- <script src="js/design.js"></script> -->