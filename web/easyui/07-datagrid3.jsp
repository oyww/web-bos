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
	<form>
		<input id="input1" type=text name=param1 value='hello' onclick="$('#input1').val('')">
		<input id="input2" type=text name=param2 value='hello' onclick="$('#input2').val('')">
		<input id="input3" type=text name=param3 value='hello' onclick="$('#input3').val('')">
		<input type=submit>
	</form>
	<script type=text/javascript>
		function writes(str) {
			document.write(str);
		}
		str = location.search.substr(1);
		arr = str.split('&');
		for (i in arr) {
			param = arr[i].split('=');
			writes(param[0] + '=' + param[1] + '<br>');
			writes('param=' + str+'<br>');
		}
	</script>

</body>
</html>