<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="../layout/app.jsp">
    <c:param name="content">

        <c:choose>
            <c:when test="${task != null}">
                <h2>${task.id}の編集</h2>
                <form method="POST"
                    action="${pageContext.request.contextPath}/update">
                    <c:import url="form.jsp" />
                </form>
                <br/>
                <p>
                    <a href="${pageContext.request.contextPath}/index">一覧へ戻る</a>
                </p>
                <p>
                    <a href="#" onclick="confirmDestroy();return false">削除？</a>
                </p>
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