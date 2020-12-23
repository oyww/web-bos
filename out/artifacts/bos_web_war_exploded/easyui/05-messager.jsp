<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>messager</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">

<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"></script>

</head>

<body>
	<script type="text/javascript">
	$(function(){
		
		$.messager.confirm("标题", "提示信息：你要点哪个？", function(b) {
			if (b) {
				$.messager.alert("标题", "内容:你点的是一般信息", "info");
				// 显示消息窗口顶部中心 
				$.messager.show({
					title : '欢迎信息',
					msg : '欢迎你点了这里，4秒后消失',
					showType : 'show',
					style : {
						right : '',
						top : document.body.scrollTop
								+ document.documentElement.scrollTop,
						bottom : ''
					}
				});
			} else {
				$.messager.alert("标题", "内容:你点的是错误信息", "error");
				$.messager.show({  	
					  title:'欢迎你点了错误信息',  	
					  msg:'信息5秒后消失',  	
					  timeout:5000,  	
					  showType:'slide' //平滑显示与消失 
					});
			}
		});
	});
	</script>

</body>

</html>