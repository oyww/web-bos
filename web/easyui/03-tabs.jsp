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
			<div data-options="iconCls:'icon-add'" title="系统面板">
				<a id="but1" class="easyui-linkbutton">系统管理</a>
				<script type="text/javascript">
					$(function(){
						//绑定事件
						$("#but1").click(function(){
							//判断是否存在，返回值Boolean
							var exist=$("#tabs1").tabs("exists",'系统管理');
							if(exist){
								$("#tabs1").tabs("select",'系统管理');
							}else{
								
									//调用tabs的add方法动态添加选项卡
									$("#tabs1").tabs("add", {
									title : '系统管理',
									iconCls : 'icon-edit',
									closable : true,
									content : '<iframe frameborder="0" height="100%" width="100%" src="https://www.baidu.com"></iframe>'
								});
								
							}
						});
					});
				</script>
				
			</div>
		</div>
		
	</div>
	



	<div style="width: 100px" data-options="region:'east'">东部</div>
	<div data-options="region:'center'">
	<!-- 制作tabs选项卡面板 -->
		<div id="tabs1" class="easyui-tabs" data-options="fit:true">
			<!-- 使用子div表示每个面板 -->
			<div data-options="iconCls:'icon-save',content:'文本区域支持html标签<a href=\'#\'>点击</a>'" title="面板1" >111</div>
			<div data-options="iconCls:'icon-edit',closable:true" title="面板2">222222</div>
			<div data-options="iconCls:'icon-cut'" title="面板3">333333</div>
			<div data-options="iconCls:'icon-back'" title="面板4">44444</div>
		</div>
	</div>

</body>
</html>