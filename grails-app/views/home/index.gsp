<%@ page 
	import = "harbor.Asset"
	import = "harbor.Type"
	import = "harbor.Location" 
	import = "harbor.State"
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
	    var dataType = google.visualization.arrayToDataTable([      
	      ['Model', 'Count'],
	      <%
	        def types = Type.list()
	        types.each() { type ->
	        def asset = Asset.findAllByType(type)
	        if (asset.size() > 0) {
	        println "['${type.make} ${type.model} (${asset.size()})', " + asset.size() + "],"
	        }
	      }
	      %>
	    ]);

	    var dataState = google.visualization.arrayToDataTable([      
  	      ['State', 'Count'],
  	      <%
  	        def states = State.list(sort:"id", order:"asc")
  	        states.each() { state ->
  	        def assets = Asset.getAssetsByState(state)
  	        if (assets.size() > 0) {
  	        println "['${state.state} (${assets.size()})', " + assets.size() + "],"
  	        }
  	      }
  	      %>
  	    ]);

	    var typeOptions = {
  	      title: 'Assets by Type',
  	      is3D: true,
  	      chartArea:{left:20,top:30,width:"100%",height:"100%"},
  	   	 titleTextStyle: {fontSize: 18},
   	   	 allowHtml: true,
   	   	 fontName: 'Noto Sans'
  	    };
		
	    var stateOptions = {
	      title: 'Assets by State',
	      is3D: true,
	      chartArea:{left:20,top:30,width:"100%",height:"100%"},
	      colors:['#00a81c', '#e60000', '#ffc000', 'black', '#a0a0a0', '#900000', '#1e3f6c', '#5f5f5f', '#009aac'],
	      titleTextStyle: {fontSize: 18},
	      allowHtml: true,
	   	  fontName: 'Noto Sans'
	    };
	
	    var chart1 = new google.visualization.PieChart(document.getElementById('type-chart'));
	    chart1.draw(dataType, typeOptions);
	    var chart2 = new google.visualization.PieChart(document.getElementById('state-chart'));
	    chart2.draw(dataState, stateOptions);
	    
	
	    $(document).ready(function () {
	      $(window).resize(function(){
	        resize();
	      });
	    });
	    
	    function resize() {
	      var chart1 = new google.visualization.PieChart(document.getElementById('type-chart'));
	      chart1.draw(dataType, typeOptions);
	      var chart2 = new google.visualization.PieChart(document.getElementById('state-chart'));
		  chart2.draw(dataState, stateOptions);
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
		<div id="type-chart" style="width:49%; height: 320px; float:left;"></div>
		<div id="state-chart" style="width:49%; height: 320px; float:right;"></div>
		<div id="stats" style="clear:both; padding: 20px;">
			<h3>Total Assets: ${Asset.list().size()}</h3><br>
			<h3>Total Locations: ${Location.list().size()}</h3><br>
			<h3>Total States: ${State.list().size()}</h3><br>
			<h3>Total Types: ${Type.list().size()}</h3>
		</div>
		</div>
	<div id="options">
		<g:render template="/home/sidebar" />
	</div>
</div>
</body>
</html>