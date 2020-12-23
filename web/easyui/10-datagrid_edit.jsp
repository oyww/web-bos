<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>datagrid_edit</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
	<!-- 需要展示效果的table -->
	 需要展示效果的table
	<table id="Mytesttable"></table>
	<script type="text/javascript">
	$(function(){
		$("#Mytesttable").datagrid({
			//定义标题行所有的列
			columns:[[
				{width:150,title:"编号",field:"id",checkbox:true},/* 不要忘记json后面的：号，更不要画蛇添足在 checkbox:true时添加编辑属性*/
				{width:150,title:"名字",field:"name",editor:{type:'validatebox',options:{required:true}}},//所有字符required:true校验
				{width:150,title:"年龄",field:"age",editor:{type:'numberbox',options:{required:true}}},//只能输入数字required:true校验
				{width:150,title:"地址",field:"address",editor:{type:'combotree',options:{}}},//下拉宽
				{width:150,title:'日期',field:'date',editor:{type:'datebox',options:{}}}//日期
				]],
			url:'${pageContext.request.contextPath }/json/datagrid_data.json',
			pagination:true,
			toolbar:"#tb",
			onAfterEdit:onEndEdit/* 为结束编辑事件绑定方法，有三个参数rowIndex, rowData, changesrow，Index: 编辑行索引   rowData: 对应的记录编辑行   changes: 更改的字段/值对 */
		});
	});
	function doDelete(){
		$.messager.alert("","标签onclick属性绑定单击事件（函数），移除被选中的行","warning");
		var rows = $("#Mytesttable").datagrid("getSelections");
		for(var i=0;i<rows.length;i++){
			var row = rows[i];
	   		 //获得指定行对象的索引
	   		 var myIndex = $("#Mytesttable").datagrid("getRowIndex",row);
	   		 $("#Mytesttable").datagrid("deleteRow",myIndex);
	   		 
		}
	}
	function doEdit(){
		//获得选中的行对象
	   	 var rows = $("#Mytesttable").datagrid("getSelections");
		for(var i=0;i<rows.length;i++){
			var row = rows[i];
	   		 //获得指定行对象的索引
	   		var myIndex = $("#Mytesttable").datagrid("getRowIndex",row);

	   		 $("#Mytesttable").datagrid("beginEdit",myIndex);
		}
	   	 
	   	
	    
	}
	function doShow(){
		$.messager.alert("",$("#qName").val(),"info");
	}
	function doAdd(){
		var lastindex=$("#Mytesttable").datagrid("getRows").length;
		$("#Mytesttable").datagrid("insertRow",{index:lastindex,row:{}});
		$("#Mytesttable").datagrid("beginEdit",lastindex);
	}
	function doRestore(){
		var rows=$("#Mytesttable").datagrid("getSelections");
		for(var i=0;i<rows.length;i++){
			//获得被选中的行对象
			var row=rows[i];
			//获得指定行对象的索引
	   		 var myIndex = $("#Mytesttable").datagrid("getRowIndex",row);
	   		 $("#Mytesttable").datagrid("endEdit",myIndex);
		}
		
	}
	function doView(){
		$("#Mytesttable").datagrid("clearSelections");
		var rows = $("#Mytesttable").datagrid("getRows");
		for(var i=0;i<rows.length;i++){
			//获得被选中的行对象
			var row=rows[i];
			//获得指定行对象的索引
	   		var reg = row.name;
			var str=$("#qName").val();
	   		if(reg.indexOf(str) != -1&str.length>0){
	   			$("#Mytesttable").datagrid("checkRow",i);//查到了就选中该行
	   			
	   		}
			
		}
		
	}
	function onEndEdit(index,data,change){
		console.info('第'+index+"行结束编辑了, "+'执行过编辑的值，也许没有修改过内容：'+data.name+"，发生变化后的值 "+change.name);
		var info=change.name;
		//if((typeof(info))=='undefined'){//不同的判空方法
		if(!info){//不同的判空方法
			$.messager.alert("","没有修改过","error");
		}
		
	}
	</script>
		<div id="tb">
			<a onclick="doView()" id="button-view" href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
			<a onclick="doAdd()" id = 'button-add' href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true">添加</a>
			<a onclick="doEdit()" id ='button-edit' href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true">编辑</a>
			<a onclick="doDelete()" id='button-delete' href="#" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">移除</a>
			<a onclick="doRestore()" id='button-save' href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true">还原/取消编辑</a>
			名称：<input type="text" name="standard.name"  id="qName" /> 
			<a onclick="doShow()"  id="standardQueryBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>  
		</div>

</body>
</html>