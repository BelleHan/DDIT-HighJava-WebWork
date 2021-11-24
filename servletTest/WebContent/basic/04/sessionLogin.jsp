<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session 연습</title>
</head>
<body>

<form method="post" 
	action="<%=request.getContextPath()%>/sessionLogin.do">
<table style="margin:0 auto;">
<tr>
	<td> ID : </td>
	<td> <input type="text" name="userId" placeholder="ID를 입력하세요"></td>
</tr>
<tr>
	<td> PASS : </td>
	<td> <input type="password" name="pass" placeholder="PassWord를 입력하세요"></td>
</tr>
<tr>
	<td colspan="2" style="text-align:center;"> 
		<input type="submit" value="Login"></td>
</tr>

</table>
</form>

</body>
</html>