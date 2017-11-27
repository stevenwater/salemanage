<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Path Variable test</title>
</head>
<body>
	<ul>
		<c:forEach var="fun" items="${funs }">
			<li>
				<a href="<c:out value='${fun.url}' />"> 
					<fmt:message key="${fun.key}"/>
				</a>
			</li>
		</c:forEach>
	</ul>
</body>
</html>