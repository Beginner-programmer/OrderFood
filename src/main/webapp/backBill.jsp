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
    <title>订单管理</title>
    <!-- 引入 layui.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layui.css">
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
        <th>订单编号</th>
        <th>下单时间</th>
        <th>下单人</th>
        <th>订单价格</th>
        <th>订单状态</th>
        <th>支付状态</th>
        <th>支付时间</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="allo" items="${sessionScope.get('allo')}">
    <tr>
        <td>${allo.getOrderid()}</td>
        <td>${allo.getOrdertime()}</td>
        <td>${allo.getOrdername()}</td>
        <td>${allo.getOrderprice()}</td>
        <td>
            <c:if test="${allo.getPrderstate()==1}">未完成</c:if>
            <c:if test="${allo.getPrderstate()==2}">未完成</c:if>
        </td>
        <td>
            <c:if test="${allo.getPaystate()==1}">未完成</c:if>
            <c:if test="${allo.getPaystate()==2}">未完成</c:if>
        </td>
        <td>${allo.getPaytime()}</td>
    </tr>
    </c:forEach>
    </tbody>
</table>
<!-- 引入 layui.js -->
<script src="${pageContext.request.contextPath}/js/layui.js"></script>
<script src="./layui/layui.js"></script>
</body>
</html>
