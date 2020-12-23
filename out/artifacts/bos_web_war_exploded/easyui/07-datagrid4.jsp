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
		<input id="input1" type=text name=param1 value='hello'
			onclick="$('#input1').val('')"> <input id="input2" type=text
			name=param2 value='hello' onclick="$('#input2').val('')"> <input
			id="input3" type=text name=param3 value='hello'
			onclick="$('#input3').val('')"> <input type=submit>
	</form>
	<script type=text/javascript>
		function refreshDg() {
			var grid = $('#dataDg');
			//返回数据区域
			var data = grid.datagrid('getData');
			if (data.rows.length <= 0) {
				return;
			}
			for (var i = 0; i < data.rows.length; i++) {
				var dataRow = data.rows[i];
				var resUuid = dataRow['uuid'];
				if (resUuid == '12345678') {
					$('#dataDg').datagrid('updateRow', {
						index : i,
						row : {
							"loginAcc" : 'admin'
						}
					});
					break;
				}
			}
		}
		$('#dataDg').datagrid('updateRow', {
		    index: 2,
		    row: {
		        "loginAcc": 'admin'
		    }
		});
	</script>

</body>
</html>