<%--
  Created by IntelliJ IDEA.
  User: Wangbaba
  Date: 2021/12/3
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>用户管理</title>
    <!-- 引入 layui.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layui.css">
    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
</head>
<body>
<h1>全部用户:</h1>
<table class="layui-table" style="text-align: center">
    <colgroup>
        <col width="150">
        <col width="200">
        <col>
    </colgroup>
    <thead>
    <tr>
        <th>用户名</th>
        <th>密码</th>
        <th>权限</th>
        <th>姓名</th>
        <th>手机号</th>
        <th>性别</th>
        <th>地址</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="allu" items="${sessionScope.get('allu')}">
        <tr>
            <td>${allu.getUname()}</td>
            <td>${allu.getPassword()}</td>
            <td>
                <c:if test="${allu.getRid()==1}">管理员</c:if>
                <c:if test="${allu.getRid()==2}">普通用户</c:if>
            </td>
            <td>${allu.getName()}</td>
            <td>${allu.getTelephone()}</td>
            <td>${allu.getSex()}</td>
            <td>${allu.getAddress()}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<!-- jQery -->
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
<!-- bootstrap js -->
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<!-- 引入 layui.js -->
<script src="${pageContext.request.contextPath}/js/layui.js"></script>
<script src="./layui/layui.js"></script>
</body>
</html>
