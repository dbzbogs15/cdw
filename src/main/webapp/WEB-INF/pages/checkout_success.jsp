<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html">
<html">
<head>
    <%@include file="component/header.jsp" %>
    <script type="text/javascript" src="/resources/layouts/fontpage/js/jquery.elevatezoom.js"></script>
    <script type="text/javascript" src="/resources//layouts/fontpage/js/gohome.js"></script>
    <link href="/resources/layouts/fontpage/css/draggable.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="/resources/layouts/fontpage/css/users.css" type="text/css"/>
</head>
<body>
<div id="main_contener">
    <%@include file="component/navbar_product.jsp" %>
    <div id="container">
        <div class="pathway">
            <ul>
                <li><a href="/" title="Trang chủ">Trang chủ</a></li>
                <li>Thông báo</li>
            </ul>
        </div>
    </div>
    <div class="clear"></div>
    <div id="container">
        <div id="cart_container" style="width: inherit" class="cart_container">
            <div class="block" id="module_productscart">
                <div id="showempty"></div>
                <div class="blockcontent" id="showcart">
                    <hr style="border-top: 1px solid #999"/>
                    <h2 style="color: red">${message}</h2>
                </div>
            </div>
            <hr>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div id="footer">
    <%@include file="component/footer.jsp" %>
</div>
</body>
</html>