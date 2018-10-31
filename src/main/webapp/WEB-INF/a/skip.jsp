<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${name}</title>
    <link rel="stylesheet" type="text/css" href="../static/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../static/style/example.css"/>
</head>
<body>
<div class="row top">
    <div class="col-xs-3 heig" onClick="history.back(-1);">

        <span class="glyphicon glyphicon-arrow-left"></span>
    </div>
    <div class="col-xs-6 text-center heig"><b>${name}</b></div>
    <div class="col-xs-3 text-center heig" >

    </div>

</div>
<iframe name="myframe" id="myframe" src="${url}?srcid=[YOUR_FILE'S_ID_HERE]&pid=explorer&efh=false&a=v&chrome=false&embedded=true"
        width="100%" height="100%" frameborder="0"  ></iframe>
<script>
    var name="${name}"
    if(name=="民政刊物"||name=="磐安发布"||name=="辖区民警"||name=="商店详情"||name=="金华旅游锦囊"){
    location.href="${url}"
    }
</script>
</body>
</html>