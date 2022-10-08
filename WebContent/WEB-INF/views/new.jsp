<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value='css/formstyle.css'/>">
<link href="https://fonts.googleapis.com/earlyaccess/nicomoji.css"
    rel="stylesheet">
<c:import url="../layout/app.jsp">
    <c:param name="content">

        <form method="POST" id="form"
            action="${pageContext.request.contextPath}/create">
            <h2>NEW</h2>
            <c:import url="form.jsp" />
            <p>
                <a href="${pageContext.request.contextPath}/index">←Back</a>
            </p>
        </form>



    </c:param>
</c:import>