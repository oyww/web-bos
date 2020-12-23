<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ztree</title>

</head>

<!-- layout  -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<!-- ztree -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/ztree/jquery.ztree.all-3.5.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/js/ztree/zTreeStyle.css"
	type="text/css">
<body class="easyui-layout">
	<!-- 使用div描述区域 -->
	<div title="xxxx管理系统" style="height: 100px"
		data-options="region:'north'">北部</div>
	<div style="height: 100px" data-options="region:'south'">南部</div>
	<div title="系统菜单" style="width: 200px" data-options="region:'west'">
		<!-- accordion折叠面板 ,fit:true自适应填充父容器（整个展开）-->
		<div class="easyui-accordion" data-options="fit:true">
			<!-- 使用子div表示每个面板 -->
			<div data-options="iconCls:'icon-save'" title="面板1">
				<!-- 展示ztree效果 :使用标准json数据构造ztree-->
				<ul id="ztree2" class="ztree" ></ul>
				<script type="text/javascript">
					$(function() {
						//页面加载完成后，执行这段代码----动态创建ztree
						var setting2 = {
							data : {
								simpleData : {
									enable : true
								},
								
							},
							closable : true,
							check:{//启用勾选
								enable:true
							}
						};
						//构造节点数据，id指自己，pid指父节点的id
						var zNodes2 = [ {
							"id" : "1",
							"pId" : "0",
							"name" : "节点一"
						},//每个json对象表示一个节点数据
						{
							"id" : "2",
							"pId" : "1",
							"name" : "节点二"
						}, {
							"id" : "3",
							"pId" : "2",
							"name" : "节点三"
						//每个json对象表示一个节点数据
						} ];
						//调用API初始化ztree
						$.fn.zTree.init($("#ztree2"), setting2, zNodes2);
					});
				</script>
			</div>
			<!-- 使用子div表示每个面板 -->
			<div data-options="iconCls:'icon-edit'" title="面板2">
				<!-- 展示ztree效果 :使用标准json数据构造ztree-->
				<ul id="ztree1" class="ztree"></ul>
				<script type="text/javascript">
					$(function() {
						//页面加载完成后，执行这段代码----动态创建ztree
						var setting = {};
						//构造节点数据
						var zNodes = [ {
							"name" : "节点一",
							"children" : [ {
								"name" : "节点一_1"
							}, {
								"name" : "节点一_2"
							} ]
						},//每个json对象表示一个节点数据
						{
							"name" : "节点二"
						}, {
							"name" : "节点三",
							"children" : [ {
								"name" : "节点三_1"
							}, {
								"name" : "节点三_2"
							} ]
						//每个json对象表示一个节点数据
						} ];
						//调用API初始化ztree
						$.fn.zTree.init($("#ztree1"), setting, zNodes);
					});
				</script>
			</div>
			<!-- 使用子div表示每个面板 -->
			<div data-options="iconCls:'icon-cut'" title="面板3">

				<ul id="ztree3" class="ztree"></ul>
				<script type="text/javascript">
			$(function(){
				var setting3={data: {
					simpleData: {
						enable: true
					}
				},
				callback: {
					onClick: function(event, treeId, treeNode){
					    //通过判断有没有page属性或者是否是父节点确定是否执行添加tab操作
						if(treeNode.page!=undefined){
						    if(!treeNode.isParent){
						        console.info('not parent')
							}
								//返回#tabs1在面板选项卡中是否存在的布尔值
							var exist=$("#tabs1").tabs("exists",treeNode.name);
							if(!exist){
									$("#tabs1").tabs("add",{
									title : treeNode.name,
									iconCls : 'icon-edit',
									closable : true,//是否可以关闭
									/* 创建面板后新建一个iframe在里面打开链接src */
									content : '<iframe frameborder="0" height="100%" width="100%" src="'+treeNode.page+'"></iframe>'
								});
							}else{
								$("#tabs1").tabs("select",treeNode.name);
							}
						
						
						}
					}
				}

			};
				var url="${pageContext.request.contextPath}/json/menu.json";
				$.get(url,{},function(data){
					$.fn.zTree.init($("#ztree3"), setting3, data);
				},"json");
				
			});
			</script>

			</div>
			<div data-options="iconCls:'icon-add'" title="系统面板">
				<a id="but1" class="easyui-linkbutton">系统管理</a>
				<script type="text/javascript">
					$(function() {
						//绑定事件
						$("#but1")
								.click(
										function() {
											//判断是否存在，返回值Boolean
											var exist = $("#tabs1").tabs(
													"exists", '面板5');
											if (exist) {
												$("#tabs1").tabs("select",
														'面板5');
											} else {

												//调用tabs的add方法动态添加选项卡
												$("#tabs1")
														.tabs(
																"add",
																{
																	title : '面板5',
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
			<div data-options="iconCls:'icon-save',closable:true" title="面板1">111</div>
			<div data-options="iconCls:'icon-edit',closable:true" title="面板2">

				选项卡2</div>
			<div data-options="iconCls:'icon-cut',closable:true" title="面板3">333333</div>
			<div data-options="iconCls:'icon-back',closable:true" title="面板4">44444</div>
		</div>
	</div>

</body>
</html>