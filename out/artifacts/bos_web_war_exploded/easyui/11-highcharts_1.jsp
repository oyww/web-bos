<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>highcharts</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script src="${pageContext.request.contextPath }/js/highcharts/highcharts.js"></script>
<script src="${pageContext.request.contextPath }/js/highcharts/modules/exporting.js"></script>
<script type="text/javascript">
	$(function(){
		//页面加载完成后，动态创建图表
		$("#test").highcharts({
			/* 简化去掉修饰部分 */
			title: {
	            text: '各浏览器份额'
	        },
	        series: [{
	            type: 'pie',
	            name: '浏览器占比',
	            data: [
	                ['Firefox',   45.0],
	                ['IE',       26.8],
	                ['Safari',    8.5],
	                ['Opera',     6.2],
	                ['Others',   0.7]
	            ]
	        }]
		});
	});
	
	$(function () {
		$('#test2').highcharts({
			chart: {
				plotBackgroundColor: null,
				plotBorderWidth: null,
				plotShadow: false
			},
			title: {
				text: '这是标题'
			},
			tooltip: {
				headerFormat: '提示信息{series.name}<br>',
				pointFormat: '{point.name}:<br> <b>{point.percentage:.1f}%</b>'
			},
			plotOptions: {
				pie: {
					allowPointSelect: true,
					cursor: 'pointer',
					dataLabels: {
						enabled: true,
						// 通过 format 或 formatter 来格式化数据标签显示
						//format: '值: {point.y} 占比 {point.percentage} %',
						formatter: function() {
							//this 为当前的点（扇区）对象，可以通过  console.log(this) 来查看详细信息
							return '<span style="color: ' + this.point.color + '"> 值：' + this.y + '，占比' + this.percentage + '%</span>';
						}
					},
					showInLegend: true  // 显示在图例中
				}
			},
			series: [{
				type: 'pie',
				name: '浏览器访问量占比',
				data: [
					['Firefox',   45.0],
					['IE',       26.8],
					{
						name: 'Chrome',
						y: 12.8,
						sliced: true,
						selected: true
					},
					['Safari',    8.5],
					['Opera',     6.2],
					['其他',   0.7]
				]
			}]
		});
	});
</script>
</head>
<body>
	<div id="test" style="float: left"></div>
	<div id="test2" style="min-width:600px;height:600px;float: right"></div>
</body>
</html>