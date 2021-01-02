<%@page import="java.sql.Timestamp"%>
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

<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<script src="semantic/dist/jquery-3.1.1.min.js"></script>
<script src="semantic/dist/semantic.min.js"></script>

 <style>
    #map{
      height:400px;
      width:100%;
    }
  </style>
</head>



<%! LinkedList<Accident> accidents = new LinkedList<>();%>

<%
accidents = DB_Manager.get_all_accident();
//float lat = 33.939875f;
//float lng = -84.52069416666667f;
%>

<body>
<!-- Menu -->
	<div class="ui secondary fixed menu" style="background-color: white;">
		<a class="item" href="list_accident.jsp"> List View </a> <a
			class="active item" href="map_accident.jsp"> Map View </a>
			</div>
<!-- End Menu -->
	<div class="ui grid">
		<div class="three wide column"></div>
		<div class="ten wide column">
		
		<div  id="map"></div>
		
		<script type="text/javascript">
		function initMap(){
			 // Map options
		      var options = {
		        zoom:8,
		        center:{lat:33.7490,lng:-84.3880}
		      }
		   // New map
		      var map = new google.maps.Map(document.getElementById('map'), options);
		var markers = [
			<%for(Accident accident: accidents){%>
			{
		      coords:{lat:<%out.print(accident.getLatitude());%>, lng:<%out.print(accident.getLongitude());%>},
		      iconImage:'semantic/accident.png',
		      content:'<label><%out.print("Id: "+accident.getId()+"	Date: "+accident.getDateTime());%></label>'
		    },
			<%}%>
		];
		
		// Loop through markers
	      for(var i = 0;i < markers.length;i++){
	        // Add marker
	        console.log("added a marker");
	        addMarker(markers[i]);
	      }
		
		// Add Marker Function
	      function addMarker(props){
	        var marker = new google.maps.Marker({
	          position:props.coords,
	          map:map
	        });

	        // Check for customicon
	        if(props.iconImage){
	          // Set icon image
	          marker.setIcon(props.iconImage);
	        }

	        // Check content
	        if(props.content){
	          var infoWindow = new google.maps.InfoWindow({
	            content:props.content
	          });

	          marker.addListener('click', function(){
	            infoWindow.open(map, marker);
	          });
	        }
	      }
		}
		</script>
		
		<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_Key&callback=initMap">
</script>
		</div>
		<div class="three wide column"></div>
	</div>

</body>
</html>
