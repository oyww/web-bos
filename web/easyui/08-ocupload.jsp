<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ocupload</title>
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
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.ocupload-1.1.2.js"></script>
</head>
<body>
	<!-- 不刷新页面上传原理 -->
	<iframe style="display: none;" name="upload"></iframe>
	<form action="xxx" target="upload" method="post" enctype="multipart/form-data">
	<input type="file" name="myfile">
	<input type="submit" value="上传" >	
	</form>
	<hr>
	<br>
	<!-- jquery一键上传的演示， jquery和ocupload插件是核心-->
	<script type="text/javascript">
	$(function(){
		
		$("#minibutton").upload({//页面加载时提供id获得元素动态添加上面的类似标签，实现不刷新上传
				action : "xxxx",
				name : "myfileupload"
			});
		});
	</script>
	<a id="minibutton" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">上传</a>
</body>
</html>