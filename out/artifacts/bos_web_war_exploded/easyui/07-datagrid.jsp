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
	<!-- 方式一：将静态HTML渲染为datagrid样式 -->
	<table class="easyui-datagrid">
		<thead>
			<tr>
				<th data-options="field:'id'">编号</th>
				<th data-options="field:'name'">姓名</th>
				<th data-options="field:'age'">年龄</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>001</td>
				<td>小明</td>
				<td>90</td>
			</tr>
			<tr>
				<td>002</td>
				<td>老王</td>
				<td>3</td>
			</tr>
		</tbody>
	</table>

	<hr>
	<!-- 方式二：发送ajax请求获取json数据创建datagrid -->
	<!-- 通过url（可以是Action地址）找到文件自动匹配field字段生成表格数据 -->
	<table
		data-options="url:'${pageContext.request.contextPath }/json/datagrid_data.json'"
		class="easyui-datagrid">
		<thead>
			<tr>
				<th data-options="field:'id'">编号</th>
				<th data-options="field:'name'">姓名</th>
				<th data-options="field:'age'">年龄</th>
				<th data-options="field:'xxx'">xxx</th>
			</tr>
		</thead>
	</table>

	<hr>
	<!-- 方式三：使用easyUI提供的API创建datagrid -->
	++++++++++++++++++++++++++++++++++++++
	<table id="mytable">
	</table>
	<!-- 方式三：使用easyUI提供的API创建datagrid -->
	<script type="text/javascript">
		$(function(){
			//页面加载完成后，创建数据表格datagrid
			$("#mytable").datagrid({
				//定义标题行所有的列
				columns:[[
				          {title:'编号',field:'id',checkbox:true},
				          {title:'姓名',field:'name'},
				          {title:'年龄',field:'age'},
				          {title:'地址',field:'address'}
				          ],[
					          {title:'编xxx',field:'id'},
					          {title:'姓xxx',field:'name'},
					          {title:'年xxx',field:'age'},
					          {title:'地xxx',field:'address'}
					          ]],
				//指定数据表格发送ajax请求的地址
				url:'${pageContext.request.contextPath }/json/datagrid_data.json',
				//左边显示行号
				rownumbers:true,
				//只能选一行
				singleSelect:true,
				//定义工具栏
				toolbar:[
				         {text:'添加',iconCls:'icon-add',
				        	 //为按钮绑定单击事件
				        	 handler:function(){
				        		 $.messager.alert("","add...工具栏handler属性绑定单击事件（函数）","warning");
				         	 }
				         },
				         {text:'删除',iconCls:'icon-remove'},
				         {text:'修改',iconCls:'icon-edit'},
				         {text:'查询',iconCls:'icon-search'}
				         ],
				//显示分页条
				pagination:true,
				pageList:[3,5,7,10,20]
			});
		});
	</script>
	<hr>
	************************************************************
	<table id="Mytesttable"></table>
	<script type="text/javascript">
	$(function(){
		$("#Mytesttable").datagrid({
			//定义标题行所有的列
			columns:[[
				{title:"编号",field:"id",checkbox:true},
				{title:"名字",field:"name"},
				{title:"年龄",field:"age"},
				{title:"地址",field:"address"}
				]],
			url:'${pageContext.request.contextPath }/json/datagrid_data.json',
			
			
			pagination:true,
			toolbar:["#tb",//同名属性后面完会覆盖前面的
					{text:'保存',iconCls:'icon-add',//混用不能再一行,因为有中括号[]
			        	 //为按钮绑定单击事件
			        	 handler:function(){
			        		 $.messager.alert("","add...工具栏handler属性绑定单击事件（函数）","warning");
			         	 }
			         }]
		});
	});
	function doDelete(){
		$.messager.alert("","标签onclick属性绑定单击事件（函数）","warning");
	}
	</script>
		<div id="tb">
		名称<input type="text" name="standard.name"  id="qName" /> 
			<a id="standardQueryBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>
		<div style="margin-bottom:5px">
			<a onclick="doView()" id="button-view" href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
			<a onclick="doAdd()" id = 'button-add' href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true">添加</a>
			<a onclick="doedit()" id ='button-edit' href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true">编辑</a>
			<a onclick="doDelete()" id='button-delete' href="#" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">移除</a>
			<a onclick="doRestore()" id='button-save' href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true">还原</a>
			<input type="text" name="standard.name"  id="search" /> 
		</div>
		</div>
</body>
</html>