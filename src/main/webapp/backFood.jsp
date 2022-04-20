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
    <title>菜单管理</title>
    <!-- 引入 layui.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layui.css">
    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
</head>
<body>
<%--修改食物信息模态框--%>
<div class="modal fade" id="updatafood" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updataf"><i class="fa fa-low-vision" style="font-size:36px"></i>修改菜品信息
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="${pageContext.request.contextPath}/updatafood" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <%--  菜品id--%>
                    <input id="foodid" type="hidden" name="foodid">
                    <%--  菜品名字--%>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">菜品名字：</label>
                        <div class="col-sm-8">
                            <input type="text" id="foodname" class="form-control" name="foodname">
                        </div>
                    </div>
                    <%--  菜品信息--%>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">菜品详情：</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" id="foodinf" name="foodinf" rows="3"></textarea>
                        </div>
                    </div>
                    <%--  上传图片--%>
                    <div class="form-group row">
                        <label for="exampleFormControlFile1">菜品图片：</label>
                        <input type="file" name="fileName" class="form-control-file" id="exampleFormControlFile1"
                               accept="image/gif,image/jpeg,image/jpg,image/png,image/svg"
                               style="width: 55%;margin-left: 20%;">
                    </div>
                    <%--      菜品价格：--%>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">菜品价格：</label>
                        <div class="col-sm-8">
                            <input type="text" id="price" class="form-control" pattern="\d{1,4}(\.\d{1,2})?$"
                                   name="price"
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

<%--修改菜品状态模态框--%>
<div class="modal fade" id="updatafstate" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updatafs"><i class="fa fa-low-vision" style="font-size:36px"></i>修改菜品状态
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="${pageContext.request.contextPath}/updatastate" method="post">
                <div class="modal-body">
                    <%--   修改状态           --%>
                    <%--  菜品名字--%>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">菜品名字：</label>
                        <div class="col-sm-9">
                            <input type="text" id="foodn" name="foodn" class="form-control" value="" readonly>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">状态选择：</label>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" id="state1" name="state" value="1">
                            <label class="form-check-label" for="state1">正常</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" id="state2" name="state" value="2">
                            <label class="form-check-label" for="state2">沽清</label>
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

<!--食物分类-->
<h3>食物分类：</h3>
<table class="layui-table" style="text-align: center">
    <colgroup>
        <col width="150">
        <col width="200">
        <col>
    </colgroup>
    <tbody>
    <tr>
        <c:forEach var="allft" items="${sessionScope.get('allft')}">
            <td>${allft.getTyname()}</td>
        </c:forEach>
    </tr>
    </tbody>
</table>
<!--食物-->
<h3 style="margin-top: 5%;">菜品信息：</h3>
<table class="layui-table" style="text-align: center;">
    <colgroup>
        <col width="150">
        <col width="200">
        <col>
    </colgroup>
    <thead>
    <tr>
        <th>图片</th>
        <th>名字</th>
        <th>信息</th>
        <th>价格</th>
        <th>分类</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="allf" items="${sessionScope.get('allf')}" varStatus="xb">
        <%--  食物id--%>
        <input id="fid${xb.index}" type="hidden" name="id" value="${allf.getId()}">
        <tr>
            <td><img id="img${xb.index}" src="${pageContext.request.contextPath}/${allf.getPicture()}"></td>
            <td id="fname${xb.index}">${allf.getFoodname()}</td>
            <td id="finf${xb.index}" style="width: 20%;">${allf.getFoodinf()}</td>
            <td id="fp${xb.index}">${allf.getPrice()}</td>
            <td>
                <c:forEach var="allft" items="${sessionScope.get('allft')}">
                    <c:if test="${allft.getId()==allf.getFoodtypeid()}">
                        ${allft.getTyname()}
                    </c:if>
                </c:forEach></td>
            <td id="state${xb.index}">
                <c:if test="${allf.getState()==1}">正常</c:if>
                <c:if test="${allf.getState()==2}">沽清</c:if>
            </td>
            <td style="width: 23%;">
                <a href="#" class="layui-btn layui-btn-normal layui-btn-sm"
                   onclick="updatafinf('${xb.index}')">修改菜品信息</a>
                <a href="#" class="layui-btn layui-btn-warm layui-btn-sm" onclick="updatafs('${xb.index}')">修改菜品状态</a>
            </td>
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
<script>
    function updatafinf(x) {
        var id = $("#fid"+x).attr("value")
        var fname = $("#fname" + x).text();
        var finf = $("#finf" + x).text();
        var price = $("#fp" + x).text();
        $("#foodid").attr("value", id);
        $("#foodname").attr("value", fname);
        $("#foodinf").text(finf);
        $("#price").attr("value", price);
        $("#updatafood").modal('show');
    }

    function updatafs(x) {
        var fname = $("#fname" + x).text();
        var state = $("#state" + x).text();
        $("#foodn").attr("value", fname);
        if (state == "正常") {
            $("#state1").attr("checked", true);
        } else {
            $("#state2").attr("checked", true);
        }
        $("#updatafstate").modal('show');
    }
</script>
</body>
</html>
