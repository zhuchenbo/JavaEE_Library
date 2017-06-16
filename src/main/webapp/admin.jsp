<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/15
  Time: 14:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>管理员</title>
    <style>
        @import "css/style.css";
    </style>
    <script>
        function del() {
            return confirm('是否要删除？');
        }
    </script>
</head>
<body>
<c:if test="${sessionScope.role ne '管理员'}">
    <c:redirect url="default.jsp"/>
</c:if>
<h1>管理员</h1>
${sessionScope.username}
<p><a href="user?action=logout">注销</a></p>
<hr>
<form action="book" method="post">
    <input type="hidden" name="action" value="add">
    <input type="text" name="title" placeholder="书名"><br>
    <input type="text" name="author" placeholder="作者"><br>
    <input type="text" name="pub" placeholder="出版社"><br>
    <input type="date" name="time" placeholder="出版时间"><br>
    <input type="text" name="price" placeholder="定价"><br>
    <input type="text" name="amount" placeholder="数量"><br>
    <input type="submit" value="添加">
</form>
<hr>
<table>
    <tr>
        <th>序号</th>
        <th>标题</th>
        <th>作者</th>
        <th>出版社</th>
        <th>出版时间</th>
        <th>定价</th>
        <th>数量</th>
        <th colspan="2">操作</th>
    </tr>
    <c:forEach var="book" items="${sessionScope.books}" varStatus="vs">
        <tr>
            <td>${vs.count}</td>
            <td>${book.title}</td>
            <td>${book.author}</td>
            <td>${book.pub}</td>
            <td>${book.time}</td>
            <td>${book.price}</td>
            <td>${book.amount}</td>
            <td><a href="book?action=queryById&id=${book.id}">编辑</a></td>
            <td><a href="book?action=remove&id=${book.id}" onclick="return del()">删除</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>