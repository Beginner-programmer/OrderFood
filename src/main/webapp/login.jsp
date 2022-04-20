<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: Wangbaba
  Date: 2021/9/29
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" type="">
    <title>Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
</head>
<body <c:if test="${requestScope.get('mess')!=null}">onload="altmess()"</c:if>>
<!--登录账号或密码密码错误模态框-->
<div class="modal fade" tabindex="-1" id="smmodal" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <p style="color: #bd2130;font-size: 25px;margin:auto;text-align: center;">${requestScope.get('mess')}</p>
            </div>
        </div>
    </div>
</div>
<input type="hidden" class="msg" value="${requestScope.get('mess')}">
<div class="materialContainer">
    <div class="box">
        <form action="${pageContext.request.contextPath}/login" method="post"/>
        <div class="title">登 录</div>
        <div class="input">
            <label for="name">用户名</label>
            <input type="text" name="username" id="name" required="required">
            <span class="spin"></span>
        </div>
        <div class="input">
            <label for="pass">密码</label>
            <input type="password" name="password" id="pass" required="required">
            <span class="spin"></span>
        </div>
        <div class="button login">
            <button id="login">
                <span>登录</span>
                <i class="fa fa-check"></i>
            </button>
        </div>
        </form>
    </div>

    <div class="overbox">
        <div class="material-button alt-2">
            <span class="shape"></span>
        </div>
        <form action="${pageContext.request.contextPath}/reg" method="post" id="regfrom"/>
        <div class="title">注册</div>
        <div class="input">
            <label for="regname">用户名<span style="font-size: 15px;color:#fff3cd;">请输入5-10位字母</span></label>
            <input type="text" pattern="[A-Za-z]{3,5}" title="3-5位字母" name="username" id="regname" required="required">
            <span class="spin"></span>
        </div>
        <div class="input">
            <label for="regpass">密码<span style="font-size: 15px;color: #fff3cd;">请输入5-12位字母或数字</span></label>
            <input type="password" pattern="[a-zA-Z0-9]{5,12}" title="5-12位字母或数字" name="password" id="regpass"
                   required="required">
            <span class="spin"></span>
        </div>
        <div class="input">
            <label for="telephone">联系电话<span style="font-size: 15px;color: #fff3cd;">请输入您的手机号码</span></label>
            <input type="text" pattern="[1][3,4,5,7,8][0-9]{9}" title="请输入您的手机号码" name="telephone" id="telephone"
                   required="required">
            <span class="spin"></span>
        </div>
        <div class="button">
            <button id="reg">
                <span>注册</span>
            </button>
        </div>
        </form>
    </div>
</div>
<script>
    function altmess() {
        $("#smmodal").modal('show');
    }
</script>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/login.js"></script>
</body>
</html>
