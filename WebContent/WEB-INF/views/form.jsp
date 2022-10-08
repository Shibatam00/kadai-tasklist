<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value='/css/formstyle.css'/>">

<c:if test="${errors != null}">
    <div id="flush_error">
    <c:forEach var="error" items="${errors}">
        *<c:out value="${error}" /><br/>
    </c:forEach>
    </div>
</c:if>

<label for="title">Your Task</label>
<br />
<input type="text" name="content" id="task" value="${task.content}">
<br />
<br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">Add!!</button>