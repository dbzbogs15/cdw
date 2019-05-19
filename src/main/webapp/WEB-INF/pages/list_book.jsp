<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="component/header.jsp" %>
    <link href="/resources/layouts/fontpage/css/product.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="/resources/layouts/fontpage/js/jquery.elevatezoom.js"></script>
    <script type="text/javascript" src="/resources//layouts/fontpage/js/gohome.js"></script>
    <link href="/resources/layouts/fontpage/css/draggable.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<div id="main_contener">
    <%@include file="component/navbar_product.jsp" %>
    <div id="container">
        <div class="pathway">
            <ul>
                <li><a href="http://nobita.vn" title="Trang chủ">Trang chủ</a></li>
                <li>${path}</li>
            </ul>
        </div>
    </div>
    <div class="clear"></div>
    <div id="container">
        <div class="sortable" id="layoutGroup1">
            <div class="block" id="module_listnewproducts">
                <h1>${path}</h1>
                <div class="pagesright">
                    <div class="views">
                        <a class="active fa fa-th-large" href="/sach-moi.html?page=1"
                           title="Xem danh sách theo dạng lưới"></a>
                        <a class=" fa fa-th-list" href="/sach-moi.html?page=1&view=1"
                           title="Xem theo dạng danh sách"></a>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="blockcontent">
                    <c:forEach var="item" items="${list_book}">
                        <div class="product_contener">
                            <div class="products">
                                <div class="image"><a
                                        href="/product?bookid=${item.id}"
                                        title="${image.name}"><img
                                        src="/${item.image}"
                                        alt="${item.name}"
                                        title="${item.name}"/></a>

                                </div>
                                <div class="productname">
                                    <a href="/product?bookid=${item.id}"
                                       title="${item.name}">${item.name}</a>
                                </div>
                                <div class="fields"> <span><a href="/product?bookid=${item.id}"
                                                              title="${item.author}">${item.author}</a></span>
                                </div>
                                <div class="prices"><fmt:formatNumber pattern="###,###" value="${item.priceNew}"/> ₫
                                </div>
                                <span class="rootprice"><fmt:formatNumber pattern="###,###"
                                                                          value="${item.priceOld}"/> ₫</span>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="clear">&nbsp;</div>
                <ul class="pagenav" id="paging">
                    <c:if test="${currentPage != 1}">
                        <li class="prev">
                            <a href="${currentUrl}?page=${currentPage - 1}">
                                <i class="fa fa-chevron-left"></i> Trang trước
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${currentPage - 3 <= 1 && currentPage + 3 > totalPage && totalPage != 1}">
                        <c:forEach begin="1" end="${totalPage}" var="i">
                            <c:choose>
                                <c:when test="${currentPage == i}">
                                    <li class="active"><span>${i}</span></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="${currentUrl}?page=${i}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </c:if>
                    <c:if test="${currentPage - 3 <= 1 && currentPage + 3 < totalPage}">
                        <c:forEach begin="1" end="${currentPage + 3}" var="i">
                            <c:choose>
                                <c:when test="${currentPage == i}">
                                    <li class="active">
                                        <a href="${currentUrl}?page=${i}"><span>${i}</span></a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="${currentUrl}?page=${i}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </c:if>
                    <c:if test="${currentPage - 3 > 1 && currentPage + 3 <= totalPage}">
                        <c:forEach begin="${currentPage - 3}" end="${currentPage + 3}" var="i">
                            <c:choose>
                                <c:when test="${currentPage == i}">
                                    <li class="active">
                                        <a href="${currentUrl}?page=${i}">
                                            <span>${i}</span>
                                        </a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="${currentUrl}?page=${i}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </c:if>
                    <c:if test="${currentPage - 3 >= 1 && currentPage + 3 > totalPage}">
                        <c:forEach begin="${currentPage - 3}" end="${totalPage}" var="i">
                            <c:choose>
                                <c:when test="${currentPage == i}">
                                    <li class="active">
                                        <a href="${currentUrl}?page=${i}">
                                            <span>${i}</span>
                                        </a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="${currentUrl}?page=${i}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </c:if>
                    <c:if test="${currentPage < totalPage}">
                        <li class="next">
                            <a href="${currentUrl}?page=${currentPage + 1}">Trang sau <i
                                    class="fa fa-chevron-right"></i></a>
                        </li>
                    </c:if>
                </ul>
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <div class="clear"></div>
    <div id="footer">
        <%@include file="component/footer.jsp" %>
    </div>
</div>