<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@include file="component/header.jsp" %>
    <script type="text/javascript" src="/resources/layouts/fontpage/js/jquery.elevatezoom.js"></script>
    <script type="text/javascript" src="/resources//layouts/fontpage/js/gohome.js"></script>
    <link href="/resources/layouts/fontpage/css/draggable.css" type="text/css" rel="stylesheet"/>
    <link href="/resources/layouts/fontpage/css/products.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="/resources/css/springbook.css"/>
</head>
<body>
<div id="main_contener">
    <%@include file="component/navbar_product.jsp" %>
    <div id="container">
        <div class="pathway">
            <ul>
                <li>
                    <a href="/" title="Trang chủ">Trang chủ</a>
                </li>
                <li>${tendanhmuc}</li>
            </ul>
        </div>
    </div>
    <div class="clear"></div>
    <div id="container">
        <div class="sortable"
             id="layoutGroup3">
            <div class="block"
                 id="module_categories">
                <h2>Danh mục</h2>
                <div class="blockcontent">
                    <ul>
                        <c:forEach items="${categories}" var="category">
                            <li>
                                <a href="/category/${category.parentCategory.id}/sub/${category.id}"
                                   title="${category.name}">
                                        ${category.name}
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <div class="sortable"
             id="layoutGroup4">
            <div class="block"
                 id="module_listproducts">
                <h1>${tendanhmuc}</h1>
                <div class="intro"></div>
                <div class="clear"></div>
                <div class="pagesright">
                    <div class="views">
                        <a class="active fa fa-th-large" href="/danh-muc/1/sach-kinh-te.html?page=1"
                           title="Xem danh sách theo dạng lưới">
                        </a>
                        <a class=" fa fa-th-list" href="/danh-muc/1/sach-kinh-te.html?page=1&view=1"
                           title="Xem theo dạng danh sách">
                        </a>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
                <div class="blockcontent">
                    <c:forEach
                            items="${listBook}"
                            var="book">
                        <div class="product_contener">
                            <div class="products">
                                <div class="image">
                                    <a href="/product?bookid=${book.id}"
                                       title="${book.name}">
                                        <img src="/resources/${book.image}"
                                             alt="${book.name}"
                                             title="${book.name}"/>
                                    </a>
                                    <span class="saleprice">-${book.saleoff}%</span>
                                </div>
                                <div class="productname">
                                    <a href="/product?bookid=${book.id}"
                                       title="${book.name}">
                                            ${book.name}
                                    </a>
                                </div>
                                <div class="fields">
                                    <span><a
                                            href="#"
                                            title="${book.author}">${book.author}</a></span>
                                </div>
                                <div class="prices">
                                    <fmt:formatNumber
                                            pattern="###,###"
                                            value="${book.priceNew}"/>
                                    ₫
                                </div>
                                <span class="rootprice">
                                <fmt:formatNumber
                                        pattern="###,###"
                                        value="${book.priceOld}"/> ₫
                            </span>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="clear">
                    &nbsp;
                </div>
            </div>
        </div>
        <hr>
    </div>
    <div class="clear"></div>
    <div id="footer">
        <%@include
                file="component/footer.jsp" %>
    </div>
</div>
</body>