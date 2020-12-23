<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>layout</title>

</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<body class="easyui-layout">
<!-- 使用div描述区域 -->
<div title="xxxx管理系统" style="height: 100px" data-options="region:'north'">北部</div>
<div style="height: 100px" data-options="region:'south'">南部</div>
<div title="系统菜单" style="width: 100px" data-options="region:'west'">西部</div>
<div style="width: 100px" data-options="region:'east'">东部</div>
<div data-options="region:'center'">中部</div>

</body>
</html>