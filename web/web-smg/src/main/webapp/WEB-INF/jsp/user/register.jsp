<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../path.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
</head>
<body>
</body>
<form action="${path}/user/register" method="post">
	<input type="text" name="user_name" /> 
	<input type="password" name="password" /> 
	<input type="password" name="password_confirm" />
	<input type="submit" title="提交"/>
</form>
</html>