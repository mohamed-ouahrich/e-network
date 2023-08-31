<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.user == null}">
    <%
        response.sendRedirect("login");
    %>
<%--    <jsp:forward page="login/index.jsp"></jsp:forward>--%>
</c:if>
<c:if test="${sessionScope.user != null}">
    <%
        response.sendRedirect("home");
    %>
</c:if>
