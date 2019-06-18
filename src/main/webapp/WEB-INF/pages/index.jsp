<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
    <%@include file="component/header.jsp" %>
    <link href="/resources/layouts/fontpage/css/home.css" type="text/css" rel="stylesheet"/>
</head>

<body>
<div id="main_contener">
    <div id="header">
        <div class="block banner "
             id="banner_TopHeader">
            <div class="blockcontent"></div>
        </div>
    </div>
    <div id="header">
        <%@include file="component/navbar.jsp" %>
        <div id="mainmenu">
            <div id="container">
                <!-- Main menu -->
                <%@include file="component/main_menu.jsp" %>
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <div class="clear"></div>
    <div id="container">

    </div>
    <div class="clear"></div>
    <!-- note.jsp -->
    <div id="container">
        <div id="mainbanner">
            <%@include file="component/main_banner.jsp" %>
        </div>
        <div class="sortable"
             id="layoutGroup1">
            <div class="block" id="module_newproducts">
                <%@include file="component/new_product.jsp" %>
            </div>

            <div class="block" id="module_publishing">
                <%@include file="component/best_seller.jsp" %>
            </div>
            <%--            <div class="block" id="module_bestseller">--%>
            <%--                <%@include file="component/publishing.jsp"%>--%>
            <%--            </div>--%>
            <div class="block" id="module_topcategories">
                <%@include file="component/top_categories.jsp" %>
            </div>
            <div class="block " id="content_seohome">
                <%@include file="component/content_bottom.jsp" %>
            </div>
        </div>
    </div>
    <div class="clear"></div>
    <div id="footer">
        <%@include file="component/footer.jsp" %>
    </div>
</div>
</body>
</html>
