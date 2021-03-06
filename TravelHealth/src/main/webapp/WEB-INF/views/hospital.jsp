<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Shuhao Guo">
    <title>Victoria Health Care Tourism</title>
    <%-- <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet"> --%>
    <link href="<c:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/prettyPhoto.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/animate.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/presets/preset1.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/hospital.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/responsive.css" />" rel="stylesheet">
	<link id="preset" rel="stylesheet" type="text/css" href="<c:url value="/resources/css/presets/preset1.css" />" >
	<link href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="https://cdn.datatables.net/1.10.11/css/dataTables.bootstrap.min.css" />" rel="stylesheet">
    <!--[if lt IE 9]>
	    <script src="js/html5shiv.js"></script>
	    <script src="js/respond.min.js"></script>
    <![endif]-->
    <link rel="shortcut icon" href="<c:url value="/resources/images/ico/favicon.ico" />" >
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<c:url value="/resources/images/ico/apple-touch-icon-144-precomposed.png" />" >
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<c:url value="/resources/images/ico/apple-touch-icon-114-precomposed.png" />" >
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<c:url value="/resources/images/ico/apple-touch-icon-72-precomposed.png" />" >
    <link rel="apple-touch-icon-precomposed" href="<c:url value="/resources/images/ico/apple-touch-icon-57-precomposed.png" />" >
</head><!--/head-->

<body>
  <div class="container">
	<header id="header">      
        <div class="navbar navbar-inverse navbar-fixed-top" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <a class="navbar-brand" href="/travel">
                    	<img src="<c:url value="/resources/images/presets/preset1/logo5.png" />" alt="logo">
                    </a>
                    
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                       	<li class="scroll"><a href="<%=request.getContextPath() %>">Home</a></li>
                        <li class="scroll active"><a href="<%=request.getContextPath() %>#services">Services</a></li>
                        <li class="scroll"><a href="<%=request.getContextPath() %>#about-us">About Us</a></li>
                        <li class="scroll"><a href="<%=request.getContextPath() %>#our-team">Our Team</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </header>
    <!--/#header-->
    
    <section id="body" class="container-fluid">
    	<div class="row">
    		<div class="features">
    			<div class="col-sm-7">
    			    <div class="search-area">
	    				<form id="form-search" class="form-horizontal" method="post" action="<%=request.getContextPath() %>/hospital/search" role="form">
							<div class="form-group">
								<div class="col-sm-7">
									<input type="text" id="input" name="input" class="form-control input-md" placeholder="Suburb/Zipcode" required>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-3">
										<select class="form-control input-md" id="medicalType" name="medicalType">
											<option value="MT" selected>Medical Type</option>
											<option value="Emergency">Emergency Hospital</option>
											<!-- <option value="General Practitioner">General Practitioner</option> -->
											<option value="Kid Emergency">Kid Emergency Hospital</option>
											<option value="Pharmacy">Pharmacy</option>
										</select>
									</div>
									<div class="col-sm-3">
										<select class="form-control input-md" id="language" name="language">
											<option value="LS" selected>Doctor Languages</option>
											<option value="Arabic">Arabic</option>
											<option value="Chinese">Chinese</option>
											<option value="English">English</option>
											<option value="Indian">Indian</option>
										</select>
									</div>
								</div>
							</div>
							<div class="form-group">
								<button class="btn btn-success btn-md" type="submit"><span class="glyphicon glyphicon-search"></span> Search</button>
							</div>
						</form>
					</div>
					
					<div class="result-area">
						<c:if test="${empty hospitals}">
							<p>Sorry, there is no result!</p>
							<p>Please enter new search conditions.</p>
						</c:if>
						<c:if test="${not empty hospitals }">
						    <table id="content" class="table table-striped table-bordered" cellspacing="0" width="100%">
						    	<thead>
						    		<tr>
						    			<th>Hospital Name</th>
						    			<th>Phone NO.</th>
						    			<th>Suburb</th>
						    			<th>Postcode</th>
						    			
						    		</tr>
						    	</thead>
						    	<tbody>
						    		<c:forEach items="${hospitals}" var="hospital">
							    		<tr>
							    			<td><a href="<%=request.getContextPath() %>/hospital/detail/${hospital['hospital_id']}" target="_blank">${hospital['hospital_name']}</a></td>
							    			<td>${hospital['phoneno']}</td>
							    			<td>${hospital['suburb']}</td>
							    			<td>${hospital['postcode']}</td>
							    		</tr>
						    		</c:forEach>
						    	</tbody>
						    </table>  
						</c:if>
						
					</div>
					<div class="transport">
						<p>Taxi? <a href="https://www.uber.com" target="_blank"><img src="<c:url value="/resources/images/uber.png" />" /></a> now!</p>
						
					
					<%-- <div class="row">
							<p>Journey Planner? <a href="https://ptv.vic.gov.au/journey#jpsearch%5Baction%5D=showPlanner" target="_blank"><img src="<c:url value="/resources/images/ptv_logo.png" />" /></a> now!</p></div> --%>
					</div>
    			</div>
    			<div class="col-sm-5">
    				<div id="map" class="map" style="height:590px;width:500px"></div>
    				<script src="https://maps.googleapis.com/maps/api/js?sensor=false" type="text/javascript"></script>
    				<!-- Add Google Map -->
    				<script>
    				  initMap();
    				  
    				  
				      function initMap() {
				    	var myLatLng = {lat: -37.831, lng: 144.962};
				        var map = new google.maps.Map(document.getElementById('map'), {
				          center: myLatLng,
				          zoom: 8
				        });
				        
				        var marker = new google.maps.Marker({
				            position: myLatLng,
				            map: map,
				            title: 'Hello World!'
				          });
				      }
				      
				    </script>
    			</div>
    		</div>
    	</div>
    </section>
    <!-- /#Search -->
    
    <footer id="footer" class="container-fluid bg-2">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                   <p>Copyright  @2016  <a target="_blank" href="http://mahara.infotech.monash.edu.au/mahara/view/view.php?id=2192">Daemon</a></p>
                </div>
                <div class="col-sm-6">
                    <p class="pull-right"> Designed by <a target="_blank" href="http://mahara.infotech.monash.edu.au/mahara/view/view.php?id=2192">Daemon</a></p>
                </div>
            </div>
        </div>
    </footer>
    <!--/#footer-->
  </div>
    <%-- <script type="text/javascript" src="<c:url value="/resources/js/jquery.js" />" ></script> --%>
    <%-- <script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js" />" ></script> --%>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
 	
  	<%-- <script type="text/javascript" src="<c:url value="/resources/js/modernizr.custom.86080.js" />" ></script> --%>
	<script type="text/javascript" src="<c:url value="/resources/js/smoothscroll.js" />" ></script>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery.isotope.min.js" />" ></script>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery.prettyPhoto.js" />" ></script>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery.parallax.js" />" ></script>
    <%-- <script type="text/javascript" src="<c:url value="/resources/js/main.js" />" ></script> --%>  
    <%-- <script type="text/javascript" src="<c:url value="/resources/js/switcher.js" />" ></script> --%>
   	<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.11/js/dataTables.bootstrap.min.js"></script>
    <!-- Data Table jQuery -->
    <script type="text/javascript">
    $(document).ready(function() {
        $('#content').DataTable({
        	stateSave: true,
        	scrollY: '40vh',
        	scrollCollapse: true,
        	"lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, 'All']],
        	"oLanguage": {
        		"sSearch": "Filter: "	
        	}
        });
    } );
    </script>
</body>
</html>