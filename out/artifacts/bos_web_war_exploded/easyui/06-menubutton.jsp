<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menubutton</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">

<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"></script>

</head>

<body>
	<a href="javascript:void(0)" id="mb" class="easyui-menubutton" data-options="menu:'#menuitem',iconCls:'icon-edit'">控制面板</a>---------
	<!-- 制作菜单 -->
	<a data-options="iconCls:'icon-help',menu:'#menuitem'" class="easyui-menubutton">控制面板</a>
	<div id="menuitem">
		<div class="menu-sep"></div>
		<div onclick="$.messager.alert(222,1111,'warning')" data-options="iconCls:'icon-edit'">修改密码</div>
		<div class="menu-sep"></div>
		<div>联系管理员</div>
		<div class="menu-sep"></div>
		<div>退出系统</div>
	</div>


</body>

</html>