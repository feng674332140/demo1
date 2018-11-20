<%--
  Created by IntelliJ IDEA.
  User: wangyinglong
  Date: 2018/11/17
  Time: 4:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>智慧门牌</title>
</head>
<body>
${buID}
<%
    Integer buID= (Integer) request.getAttribute("buID");
    response.setHeader("Refresh","0;url=http://192.168.1.203:8080/#/buID="+buID);
%>
</body>
</html>
