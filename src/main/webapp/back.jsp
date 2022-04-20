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
    <title>后台操作</title>
    <!-- 引入 layui.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layui.css">
    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
</head>
<body <c:if test="${sessionScope.get('backmsg')!=null}">onload="msg()"</c:if>>

<%--后台操作信息提示模态框--%>
<div class="modal fade" tabindex="-1" id="msg" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <c:if test="${sessionScope.get('backmsg')==0}">
                    <p style="color: #bd2130;font-size: 25px;margin:auto;text-align: center;">输入项为空</p>
                </c:if>
                <c:if test="${sessionScope.get('backmsg')==1}">
                    <p style="color:#1c7430;font-size: 25px;margin:auto;text-align: center;">添加成功</p>
                </c:if>
                <c:if test="${sessionScope.get('backmsg')==2}">
                    <p style="color: #bd2130;font-size: 25px;margin:auto;text-align: center;">添加失败</p>
                </c:if>
                <c:if test="${sessionScope.get('backmsg')==3}">
                    <p style="color:#1c7430;font-size: 25px;margin:auto;text-align: center;">修改成功</p>
                </c:if>
                <c:if test="${sessionScope.get('backmsg')==4}">
                    <p style="color: #bd2130;font-size: 25px;margin:auto;text-align: center;">修改失败</p>
                </c:if>
                <c:if test="${sessionScope.get('backmsg')==5}">
                    <p style="color:#1c7430;font-size: 25px;margin:auto;text-align: center;">删除成功</p>
                </c:if>
                <c:if test="${sessionScope.get('backmsg')==6}">
                    <p style="color: #bd2130;font-size: 25px;margin:auto;text-align: center;">删除失败</p>
                </c:if>
                ${sessionScope.remove('backmsg')}
            </div>
        </div>
    </div>
</div>

<%--修改用户权限模态框--%>
<div class="modal fade" id="updatar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updataro"><i class="fa fa-low-vision" style="font-size:36px"></i>修改用户权限
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="${pageContext.request.contextPath}/updatauroot" method="post">
                <div class="modal-body">
                    <%--  用户姓名--%>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">用户姓名：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" placeholder="请输入需要修改权限的用户名" name="rname" />
                        </div>
                    </div>
                    <%--   修改权限           --%>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">权限选择：</label>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" id="inlineCheckbox1" name="rid" value="1">
                            <label class="form-check-label" for="inlineCheckbox1">管理员</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" id="inlineCheckbox2" name="rid" value="2">
                            <label class="form-check-label" for="inlineCheckbox2">普通用户</label>
                        </div>
                    </div>
                    <div style="margin-left: 73%;">
                        <button type="submit" class="btn btn-primary" style="margin-left: 52%;">提交</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<%--新增菜品分类模态框--%>
<div class="modal fade" id="addfty" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addft"><i class="fa fa-low-vision" style="font-size:36px"></i>新增菜品分类
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="${pageContext.request.contextPath}/addfoodtype" method="post">
                <div class="modal-body">
                    <%--  菜品名字--%>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">菜品分类名字：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" placeholder="请输入需要新增菜品分类的名字" name="typename">
                        </div>
                    </div>
                    <div style="margin-left: 73%;">
                        <button type="submit" class="btn btn-primary" style="margin-left: 52%;">提交</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<%--新增菜品模态框--%>
<div class="modal fade" id="addfood" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addf"><i class="fa fa-low-vision" style="font-size:36px"></i>新增菜品
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="${pageContext.request.contextPath}/addfood" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <%--  菜品名字--%>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">菜品名字：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" placeholder="请输入需要添加菜品的名字" name="foodname" />
                        </div>
                    </div>
                    <%--  菜品信息--%>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">菜品详情：</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" id="exampleFormControlTextarea1" name="foodinf"
                                      placeholder="请输入需要添加菜品的简略信息" rows="3"></textarea>
                        </div>
                    </div>
                    <%--  上传图片--%>
                    <div class="form-group row">
                        <label for="exampleFormControlFile1">菜品图片：</label>
                        <input type="file" class="form-control-file" id="exampleFormControlFile1" name="fileName" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" style="width: 55%;margin-left: 20%;">
                    </div>
                    <%--      菜品价格：--%>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">菜品价格：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" placeholder="请输入菜品价格"
                                   pattern="\d{1,4}(\.\d{1,2})?$" name="price"
                                   title="请输入正确的价格格式"/>
                        </div>
                    </div>
                    <%--    菜品分类--%>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">菜品分类：</label>
                        <select class="form-control" name="foodtype" style="width: 60%; margin-left: 3%;">
                            <c:forEach var="fty" items="${sessionScope.get('allft')}">
                                <option value="${fty.getId()}">${fty.getTyname()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div style="margin-left: 73%;">
                        <button type="submit" class="btn btn-primary" style="margin-left: 52%;">提交</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<%--修改菜品分类模态框--%>
<div class="modal fade" id="updatafty" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updatatyf"><i class="fa fa-low-vision" style="font-size:36px"></i>修改菜品分类
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="${pageContext.request.contextPath}/updatafty" method="post">
                <div class="modal-body">
                    <%--  菜品分类原名字--%>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">菜品分类原名字：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" placeholder="请输入需要修改分类的名字" name="typename">
                        </div>
                    </div>
                        <%--  菜品分类新名字--%>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">菜品分类新名字：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" placeholder="请输入需要修改分类的名字" name="newtypename">
                            </div>
                        </div>
                    <div style="margin-left: 73%;">
                        <button type="submit" class="btn btn-primary" style="margin-left: 52%;">提交</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<%--删除菜品分类模态框--%>
<div class="modal fade" id="delfoodt" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="delfoodty"><i class="fa fa-low-vision" style="font-size:36px"></i>删除菜品分类
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="${pageContext.request.contextPath}/delfty" method="post">
                <div class="modal-body">
                    <%--  菜品分类名字--%>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">菜品分类名字：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" placeholder="请输入需要删除分类的名字" name="typename">
                        </div>
                    </div>
                    <div style="margin-left: 73%;">
                        <button type="submit" class="btn btn-primary" style="margin-left: 52%;">提交</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<%--删除菜品模态框--%>
<div class="modal fade" id="delfood" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="delf"><i class="fa fa-low-vision" style="font-size:36px"></i>删除菜品
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="${pageContext.request.contextPath}/delfood" method="post">
                <div class="modal-body">
                    <%--  菜品名字--%>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">菜品名字：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" placeholder="请输入需要删除菜品的名字" name="foodname">
                        </div>
                    </div>
                    <div style="margin-left: 73%;">
                        <button type="submit" class="btn btn-primary" style="margin-left: 52%;">提交</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<div>
    <div class="row">
        <a href="#" class="layui-btn"
           style="width: 50%;height: 300px;font-size: xxx-large;  line-height: 5;" onclick="updataroot()">修改用户权限</a>
        <a href="#" class="layui-btn layui-btn-normal"
           style="width: 50%;margin-left: 0%;height: 300px;font-size: xxx-large;line-height: 5;" onclick="addfty()">新增菜品分类</a>
    </div>
    <div class="row">
        <a href="#" class="layui-btn layui-btn-normal"
           style="width: 50%;height: 300px;font-size: xxx-large; line-height: 5;" onclick="addfood()">新增菜品</a>
        <a href="#" class="layui-btn"
           style="width: 50%;margin-left: 0%;height: 300px;font-size: xxx-large;line-height: 5;" onclick="updatatyf()">修改菜品分类</a>
    </div>
    <div class="row">
        <a href="#" class="layui-btn layui-btn-warm"
           style="width: 50%;height: 300px;font-size: xxx-large;line-height: 5;" onclick="delfoodty()">删除菜品分类</a>
        <a href="#" class="layui-btn layui-btn-danger"
           style="width: 50%;margin-left: 0%;height: 300px;font-size: xxx-large;line-height: 5;" onclick="delfood()">删除菜品</a>
    </div>
</div>
<!-- jQery -->
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
<!-- bootstrap js -->
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<!-- 引入 layui.js -->
<script src="${pageContext.request.contextPath}/js/layui.js"></script>
<script src="./layui/layui.js"></script>
<script>
    function msg(){
        $("#msg").modal('show');
    }
    function updataroot() {
        $("#updatar").modal('show');
    }

    function addfty() {
        $("#addfty").modal('show');
    }

    function addfood() {
        $("#addfood").modal('show');
    }

    function updatatyf() {
        $("#updatafty").modal('show');
    }

    function delfoodty() {
        $("#delfoodt").modal('show');
    }

    function delfood() {
        $("#delfood").modal('show');
    }
</script>
</body>
</html>
