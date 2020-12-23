<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>datagrid</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
		<script type="text/javascript">
 
		$(function(){
			
			
			$('#dg').datagrid({
				fit:false,
				border:true,
				singleSelect:true,
				fitColumns:true,
				url : "${pageContext.request.contextPath}/standard/list",
				columns : [ [
					{
						field : 'id',
						title : '编号',
						width : 100
					},
					{
						field : 'name',
						title : '名称',
						width : 200
					},
					{
						field : 'minWeight',
						title : '最小重量',
						width : 200
					},
					{
						field : 'maxWeight',
						title : '最大重量',
						width : 200
					},
					{
						field : 'minLength',
						title : '最小长度',
						width : 200
					},
					{
						field : 'maxLength',
						title : '最大长度',
						width : 200
					}
				   
				] ],
				toolbar:"#tb",
				
				pagination:true,
				pageNumber:1,
				pageSize:3,
				pageList:[3,6,9]
		});
 
 
		$("#standardQueryBtn").click(function(){
			
			$("#dg").datagrid("load",{
				"standard.name": $("#qName").val(),
				
			});
 
		});
			
		});
	</script>
		<table id="dg"></table>  
	<div id="tb">
		名称<input type="text" name="standard.name"  id="qName" /> 
			<a id="standardQueryBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>  
			<a id="2standardQueryBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>
			<a id="3standardQueryBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>
		<a onclick="doView()" id="button-view" href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		<a id="4standardQueryBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>
	</div>
</body>
</html>