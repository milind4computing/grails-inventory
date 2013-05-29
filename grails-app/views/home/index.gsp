<%@ page 
	import = "harbor.Asset"
	import = "harbor.Type"
	import = "harbor.Location" 
%>
<html>
<head>
	<title>Harbor Dashboard</title>
	<meta name="layout" content="main"/>
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
    google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(drawChart);
    function drawChart() {
	    var data = google.visualization.arrayToDataTable([      
	      ['Model', 'Count'],
	      <%
	        def types = Type.list()
	        types.each() { type ->
	        def asset = Asset.findAllByType(type)
	        if (asset.size() > 0) {
	        println "['${type.type}', " + asset.size() + "],"
	        }
	      }
	      %>
	    ]);
	
	    var options = {
	      title: 'Assets by Model',
	      is3D: true,
	      chartArea:{left:20,top:0,width:"100%",height:"75%"}
	    };
	
	    var chart = new google.visualization.PieChart(document.getElementById('type-chart'));
	    chart.draw(data, options);
	
	    $(document).ready(function () {
	      $(window).resize(function(){
	        resize();
	      });
	    });
	    
	    function resize() {
	      var chart = new google.visualization.PieChart(document.getElementById('type-chart'));
	      chart.draw(data, options);
	    }
    }
</script>
</head>
<body>  
<div id="dashboard">
	<div id="main-content">
		<h1>Dashboard</h1>
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<div id="type-chart" style="width:100%; height: 500px; z-index:0;"></div>
		</div>
	<div id="options">
		<g:render template="/home/sidebar" />
	</div>
</div>
</body>
</html>