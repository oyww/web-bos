<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>accordion</title>

</head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<body class="easyui-layout">
	<!-- 使用div描述区域 -->
	<div title="xxxx管理系统" style="height: 100px"
		data-options="region:'north'">北部</div>
	<div style="height: 100px" data-options="region:'south'">南部</div>
	<div title="系统菜单" style="width: 100px" data-options="region:'west'">
		<!-- accordion折叠面板 ,fit:true自适应填充父容器（整个展开）-->
		<div class="easyui-accordion" data-options="fit:true">
			<!-- 使用子div表示每个面板 -->
			<div data-options="iconCls:'icon-save'" title="面板1">111</div>
			<div data-options="iconCls:'icon-edit'" title="面板2">222222</div>
			<div data-options="iconCls:'icon-cut'" title="面板3">333333</div>
			<div data-options="iconCls:'icon-back'" title="面板4">44444</div>
		</div>
		
	</div>
	



	<div style="width: 100px" data-options="region:'east'">东部</div>
	<div data-options="region:'center'">中部</div>

</body>
</html>