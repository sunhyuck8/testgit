<%@ page  contentType="text/html; charset=UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%
 	RuntimeException e= (RuntimeException)request.getAttribute("e");
 %>
<!DOCTYPE html>
<script>
	var msg = "<c:out value='${msg}'/>"; 
	var url = "<c:out value='${url}'/>"
	var e = "<c:out value='${e}'/>"
	alert(msg+e);
	location.href=url;
</script>
