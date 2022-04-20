<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Insert title here</title>
</head>
<body>

<form  action="${pageContext.request.contextPath}/addfood" method="post"  enctype="multipart/form-data" >
  <table>
    <tr>
      <td>上传者</td>
      <td>
        <input type="text" name="uname" value="" />
      </td>
    </tr>
    <tr>
      <td>上传者</td>
      <td>
        <input type="file" name="fileName" />
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>
        <input type="submit"  value="上传头像" />
      </td>
    </tr>
  </table>
</form>
</body>
</html>