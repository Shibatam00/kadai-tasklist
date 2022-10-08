<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value='formstyle.css'/>">
<link href="https://fonts.googleapis.com/earlyaccess/nicomoji.css"
    rel="stylesheet">
<c:import url="../layout/app.jsp">
    <c:param name="content">

        <c:choose>
            <c:when test="${task != null}">

                <form method="POST" id="form"
                    action="${pageContext.request.contextPath}/update">
                    <h2>Do edit to task.${task.id}</h2>
                    <c:import url="form.jsp" />
                    <p>
                        <a href="${pageContext.request.contextPath}/index">←Back</a>
                    </p>
                    <p>
                        <a href="#" onclick="confirmDestroy();return false">Delete</a>
                    </p>
                </form>
                <br />

                <form method="POST"
                    action="${pageContext.request.contextPath}/destroy">
                    <input type="hidden" name="_token" value="${_token}" />
                </form>

                <script>
                    function confirmDestroy() {
                        if (confirm("削除しますか？") == true) {
                            document.forms[1].submit();
                        } else {
                            alert("キャンセルしました");
                        }
                    }
                </script>

            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした</h2>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>