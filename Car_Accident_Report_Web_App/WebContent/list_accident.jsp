<%@page import="com.car_accident.controller.DB_Manager"%>
<%@page import="com.car_accident.model.Accident"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Accident Record</title>
</head>

<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<script src="semantic/dist/jquery-3.1.1.min.js"></script>
<script src="semantic/dist/semantic.min.js"></script>
<%! LinkedList<Accident> accidents = new LinkedList<>();%>

<%
accidents = DB_Manager.get_all_accident();
%>
<body>
<!-- Menu -->
			<div class="ui secondary fixed menu" style="background-color: white;">
				<a class="active item" href="list_accident.jsp"> List View </a> <a
					class="item" href="map_accident.jsp"> Map View </a>
			</div>
			<!-- End Menu -->
	<div class="ui grid">
		<div class="three wide column"></div>
		<div class="ten wide column">

			<!-- Body -->
			<table class="ui celled table">
			<thead>
				<tr>
					<th>ID</th>
					<th>Latitude</th>
					<th>Longitude</th>
					<th>Date</th>
				</tr>
			</thead>
			<tbody>
					<%
						for (Accident accident : accidents) {
					%>
					<tr>
						<td><label><%out.print(accident.getId());%></label></td>
						<td><label><%out.print(accident.getLatitude());%></label></td>
						<td><label><%out.print(accident.getLongitude());%></label></td>
						<td><label><%out.print(accident.getDateTime()); %></label></td>

					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<!-- End Body -->
		</div>
		<div class="three wide column"></div>
	</div>
</body>
</html>