<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
                <li>Đăng nhập</li>
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
                    <table cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td colspan="2">
                                <table cellpadding="2" cellspacing="0" width="100%" id="thtitle">
                                    <tr>
                                        <th width="40%" colspan="2" align="left">Sản phẩm trong giỏ</th>
                                        <th width="20%" align="right">Giá bán</th>
                                        <th width="20%" align="right">Số lượng</th>
                                        <th width="20%" align="right">Thành tiền</th>
                                    </tr>
                                </table>
                                <c:choose>
                                    <c:when test="${sessionScope.cart == null}">
                                        <span>Không có sản phẩm nào trong giỏ hàng</span>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="showboxcart" id="contentcart">
                                            <table cellpadding="2" cellspacing="0" width="100%" class="productscart">
                                                <c:forEach items="${sessionScope.cart}" var="cart">
                                                <tr>
                                                    <td>
                                                        <img src="/${cart.book.image}"
                                                             width="40" height="50"
                                                             alt="${cart.book.name}"/>
                                                    </td>
                                                    <td>
                                                        <div class="productname">
                                                            <a href="/product?bookid=${cart.book.id}"
                                                               title="${cart.book.name}">
                                                                ${cart.book.name}
                                                            </a>

                                                        </div>
                                                    </td>
                                                    <td align="right" width="20%">
                                                        <div class="sprice" id="price2898">
                                                            <fmt:formatNumber pattern="###,###" value="${cart.book.priceNew}"/>
                                                            ₫</div>
                                                    </td>
                                                    <td class="quantity" align="right" width="20%">
                                                        <div class="sprice" id="price2898">
                                                            ${cart.quantity}
                                                        </div>
                                                    </td>
                                                    <td align="right" width="20%">
                                                        <span id="cart-intoMoney178202">
                                                            ${cart.book.priceNew * cart.quantity}
                                                            ₫</span>
                                                    </td>
                                                </tr>
                                                </c:forEach>
                                            </table>
                                        </div>
                                        <table cellpadding="2" cellspacing="1" width="100%">
                                            <tr>
                                                <td width="70%">
                                                    <table width="100%" id="displayform">
                                                    </table>
                                                </td>
                                                <td>
                                                    <table width="100%">
                                                        <tr>
                                                            <td class="cardtool"><b>Tổng tiền:</b></td>
                                                            <td class="cart-subtotal cardtool">
                                                                <span id="cart-subtotal">105.000 ₫</span>
                                                            </td>
                                                        </tr>
                                                        <tr id="couponvalue" style="display:none">
                                                            <td class="cardtool">
                                                                <b>Ưu đãi</b>
                                                            </td>
                                                            <td class="cart-subtotal cardtool">
                                                                <span id="cart-coupon">0 ₫</span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" style="border-bottom:1px solid #ccc"></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="cardtool">
                                                                <b>Thành tiền:</b>
                                                            </td>
                                                            <td class="cart-subtotal cardtool">
                                                                <span id="cart-total"><b>105.000 ₫</b></span>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr class="actions">
                                                <td>
                                                    <a href="javascript:" class="continue"
                                                       onclick="Boxy.get(this).hide();">
                                                        <i class="fa fa-play"></i> Thêm sản phẩm khác vào giỏ hàng</a>
                                                </td>
                                                <td align="right" style="padding-top:10px;">
                                                    <a href="/orders/checkout/index.html" class="redbuttom">Thực hiện
                                                        thanh
                                                        toán</a>
                                                </td>
                                            </tr>
                                        </table>
                                    </c:otherwise>
                                </c:choose>

                            </td>
                        </tr>
                    </table>
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
</div>
</body>
</html>