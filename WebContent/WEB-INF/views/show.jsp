<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="../layout/app.jsp">
    <c:param name="content">

        <c:choose>
            <c:when test="${tasks != null}">

                <h2>タスク${tasks.id}の詳細</h2>

                <table>
                    <tbody>
                        <tr>
                            <th>すること</th>
                            <td><c:out value="${tasks.content}" /></td>
                        </tr>
                        <tr>
                            <th>登録日時</th>
                            <td><fmt:formatDate value="${tasks.created_at}"
                                    pattern="yyyy/MM/dd HH:mm" /></td>
                        </tr>
                        <tr>
                            <th>更新日時</th>
                            <td><fmt:formatDate value="${tasks.updated_at}"
                                    pattern="yyyy/MM/dd HH:mm" /></td>
                        </tr>
                    </tbody>
                </table>
                <br />

                <p>
                    <a href="${pageContext.request.contextPath}/index">一覧へ戻る</a>
                </p>
                <p>
                    <a href="${pageContext.request.contextPath}/edit?id=${tasks.id}">編集する</a>
                </p>

            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした</h2>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>