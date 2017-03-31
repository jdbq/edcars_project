<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta charset="utf-8" />
<link rel="icon" type="image/png" href="assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>EDCARS|Admin Panel</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />

<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="assets/css/animate.min.css" rel="stylesheet" />

<link href="assets/css/light-bootstrap-dashboard-blue.css"
	rel="stylesheet" type="text/css" title="blue" />
<link href="assets/css/light-bootstrap-dashboard-azure.css"
	rel="stylesheet" type="text/css" title="azure" />
<link href="assets/css/light-bootstrap-dashboard-green.css"
	rel="stylesheet" type="text/css" title="green" />
<link href="assets/css/light-bootstrap-dashboard-orange.css"
	rel="stylesheet" type="text/css" title="orange" />
<link href="assets/css/light-bootstrap-dashboard-purple.css"
	rel="stylesheet" type="text/css" title="purple" />
<link href="assets/css/light-bootstrap-dashboard-red.css"
	rel="stylesheet" type="text/css" title="red" />
<link href="assets/css/light-bootstrap-dashboard-black.css"
	rel="stylesheet" type="text/css" title="black" />

<link href="assets/css/demo.css" rel="stylesheet" />

<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300'
	rel='stylesheet' type='text/css'>
<link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
<script>
	var style_cookie_name = "style";
	var style_cookie_duration = 120;
	var style_domain = document.domain;
	function switch_style(css_title) {
		var i, link_tag;
		for (i = 0, link_tag = document.getElementsByTagName("link"); i < link_tag.length; i++) {
			if ((link_tag[i].rel.indexOf("stylesheet") != -1)
					&& link_tag[i].title) {
				link_tag[i].disabled = true;
				if (link_tag[i].title == css_title) {
					link_tag[i].disabled = false;
				}
			}
			set_cookie(style_cookie_name, css_title, style_cookie_duration,
					style_domain);
		}
	}

	function set_style_from_cookie() {
		var css_title = get_cookie(style_cookie_name);
		if (css_title.length) {
			switch_style(css_title);
		}
	}

	function set_cookie(cookie_name, cookie_value, lifespan_in_days,
			valid_domain) {
		var domain_string = valid_domain ? ("; domain=" + valid_domain) : '';
		document.cookie = cookie_name + "=" + encodeURIComponent(cookie_value)
				+ "; max-age=" + 60 * 60 * 24 * lifespan_in_days + "; path=/"
				+ domain_string;
	}

	function get_cookie(cookie_name) {
		var cookie_string = document.cookie;
		if (cookie_string.length != 0) {
			var cookie_value = cookie_string.match('(^|;)[\s]*' + cookie_name
					+ '=([^;]*)');
			return decodeURIComponent(cookie_value[2]);
		}
		return '';
	}
</script>
</head>

<body onload="set_style_from_cookie()">

	<div class="wrapper">
		<div class="sidebar" data-color data-image="assets/img/sidebar.jpg">
			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="#" class="simple-text"> EDCARS | ADMIN PANEL </a>
				</div>

				<ul class="nav">
					<li><a href="indexTables.html"> <i class="pe-7s-graph"></i>
							<p>Overview</p>
					</a></li>
					<li class="active"><a href="generateTables.html"> <i
							class="pe-7s-note2"></i>
							<p>Manage Inventory</p>
					</a></li>
					<li><a href="transactionRedirect.html"> <i
							class="pe-7s-ribbon"></i>
							<p>Appointment/ meet-up</p>
					</a></li>
					<li><a href="faqsResult.html"> <i class="pe-7s-science"></i>
							<p>Manage Website</p>
					</a></li>
				</ul>
			</div>
		</div>

		<div class="main-panel">
			<nav class="navbar navbar-default navbar-fixed">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#navigation-example-2">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Manage Inventory</a>
				</div>

			</div>
			</nav>


			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="header">
									<h4 class="title">Update Inventory Record</h4>
								</div>
								<div class="content">
									<div class=form-group>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<p class="bg-danger text-center text-danger">${errorMessage}</p>
												</div>
											</div>
										</div>
										<form action="inventoryUpdate.html" method="post">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label>Input the plate number</label> <input type="text"
															pattern="([A-Z]{3}?[0-9]{3})|([A-Z]{3}?[0-9]{4})"
															title="Format: ABC123 or ABC1234" class="form-control"
															name="id" readonly value="${id}" />
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label><input type="checkbox" name="fields"
															value="plateNumber" checked> car plate number </label> <input
															type="text"
															pattern="([A-Z]{3}?[0-9]{3})|([A-Z]{3}?[0-9]{4})"
															title="Format: ABC123 or ABC1234" class="form-control"
															name="plateNumber" />
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label><input type="checkbox" name="fields"
															value="carBrand"> car brand <input type="text"
															class="form-control" pattern="[A-Za-z]+"
															title="Letters only!" class="form-control"
															name="carBrand" />
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label><input type="checkbox" name="fields"
															value="carModel"> car model </label> <input type="text"
															class="form-control" pattern="[A-Za-z]+"
															title="Letters only!" class="form-control"
															name="carModel" />
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label><input type="checkbox" name="fields"
															value="carType"> car type </label> <input type="text"
															class="form-control" pattern="[A-Za-z]+"
															title="Letters only!" class="form-control" name="carType" />
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label><input type="checkbox" name="fields"
															value="carColour"> car Colour </label> <input type="text"
															class="form-control" pattern="[A-Za-z]+"
															title="Letters only!" class="form-control"
															name="carColour" />
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label><input type="checkbox" name="fields"
															value="carYear"> car year </label> <input type="text"
															pattern="[0-9]{4}" title="Input only year! e.g. 2017"
															class="form-control" name="carYear" />
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label><input type="checkbox" name="fields"
															value="carStatus"> car status </label> <select
															class="form-control" name="carStatus" required>
															<option value="Available">Available</option>
															<option value="Unavailable">Unavailable</option>
														</select>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label><input type="checkbox" name="fields"
															value="carPrice"> car price </label> <input type="text"
															pattern="(0\.((0[1-9]{1})|([1-9]{1}([0-9]{1})?)))|(([1-9]+[0-9]*)(\.([0-9]{1,2}))?)"
															title="Enter only valid price!" class="form-control"
															name="carPrice" />
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label><input type="checkbox" name="fields"
															value="expenses">Expenses / repair: </label> <input
															type="text"
															pattern="(0\.((0[1-9]{1})|([1-9]{1}([0-9]{1})?)))|(([1-9]+[0-9]*)(\.([0-9]{1,2}))?)"
															title="Enter only valid price!" class="form-control"
															name="Expenses" />
													</div>
												</div>
											</div>
											<!--  -->
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label><input type="checkbox" name="fields"
															value="motorNo" /> Motor no: </label> <input type="text"
															pattern="[A-Z0-9]+" title="Enter only valid motor no!"
															class="form-control" name="motorNo" />
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label><input type="checkbox" name="fields"
															value="serialNo" /> Serial no: </label> <input type="text"
															pattern="[A-Z0-9]+" title="Enter only valid serial no!"
															class="form-control" name="serialNo" />
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label><input type="checkbox" name="fields"
															value="fileNo" /> File no: </label> <input type="text"
															pattern="([0-9]{4}-[0-9]{11})" title="numbers only!"
															class="form-control" name="fileNo" />
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label><input type="checkbox" name="fields"
															value="crNo" /> C.R. no: </label> <input type="text"
															pattern="[0-9]+" title="numbers only!"
															class="form-control" name="crNo" />
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label><input type="checkbox" name="fields"
															value="carImage"> car image </label> <input type="file"
															class="form-control" name="carImage" />
													</div>
												</div>

											</div>
											<button type="submit"
												class="btn btn-info btn-fill pull-right">Submit</button>
											<div class="clearfix"></div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/js/bootstrap-checkbox-radio-switch.js"></script>
<script src="assets/js/chartist.min.js"></script>
<script src="assets/js/bootstrap-notify.js"></script>
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script src="assets/js/light-bootstrap-dashboard.js"></script>
<script src="assets/js/demo.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		demo.initChartist();

	});
</script>

</html>
