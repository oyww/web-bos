<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>combobox</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.ocupload-1.1.2.js"></script>
</head>
<body>
	<!-- 传统方式-->
	<select class="easyui-combobox">
		<option value="111">小黑</option>
		<option>小白</option>
		<option>小红</option>
	</select>
	<br>
	<hr>
	 <!-- easyUI方式 -->
	 <!-- 	1.该column默认显示的是value值，如果有return函数，则显示return值。
			2.并且valueField必须是唯一，否则textField不能显示。
			3.同理，datagrid每个column的field值必须是唯一，否则其他column显示不出来。 -->
			
	<input id="functioncombobox" data-options="url:'${pageContext.request.contextPath }/json/combobox.json',
			valueField:'id',
			textField:'name',
			editable:false" 
			class="easyui-combobox"><!-- editable:false不可输入内容 -->
			
			
	 <br>
	<hr>
	<input class="easyui-combobox" data-options="
	url:'${pageContext.request.contextPath }/json/combobox.json',
	valueField:'id',
			textField:'name'">
</body>
</html>