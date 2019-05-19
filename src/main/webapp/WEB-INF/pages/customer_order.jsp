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
    <link rel="stylesheet" href="/resources/layouts/fontpage/css/customer.css" type="text/css"/>
</head>
<body>
<div id="main_contener">
    <%@include file="component/navbar_product.jsp" %>
    <div id="container">
        <div class="pathway">
            <ul>
                <li><a href="/" title="Trang chủ">Trang chủ</a></li>
                <li>Quản lý tài khoản</li>
            </ul>
        </div>
    </div>
    <div class="clear"></div>
    <div id="container">
        <div class="sortable" id="layoutGroup3">
            <div class="block" id="module_customerMenu">
                <h2>Tài khoản của bạn</h2>
                <div class="blockcontent">
                    <ul>
                        <li><a href="/customers/index.html">Quản lý tài khoản</a></li>
                        <li><a href="/customers/edit/index.html">Thông tin tài khoản</a></li>
                        <li><a href="/customers/address/index.html">Sổ địa chỉ</a></li>
                        <li><a href="/customers/messages/index.html">Thông báo của tôi</a></li>
                        <li class="bold"><a href="/customers/orders/index.html">Đơn hàng của tôi</a></li>
                        <li><a href="/customers/review/index.html">Sản phẩm tôi đánh giá</a></li>
                        <li><a href="/customers/wishlist/index.html">Danh sách yêu thích</a></li>
                        <li><a href="/customers/coupon/index.html">Phiếu giảm giá</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="sortable" id="layoutGroup4">
            <div class="block" id="module_customersorders">
                <h3>Đơn hàng của tôi</h3>
                <div class="blockcontent">
                    <table id="ordertable" cellpadding="0" cellspacing="0" width="100%" class="ordertable">
                        <tr>
                            <th nowrap="nowrap" width="2%"># Đơn hàng</th>
                            <th align="left">Ngày mua</th>
                            <th align="left">Gởi đến</th>
                            <th align="left">Tổng tiền</th>
                            <th align="left" colspan="2">Tình trạng đơn hàng</th>
                        </tr>
                    </table>
                    <div class="clear">&nbsp;</div>

                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div id="footer">
    <%@include file="component/footer.jsp" %>
</div>
<script>
    $.ajax({
        url: '/account/my-order',
        dataType: 'json',
        success: function (result) {
            if ($.isEmptyObject(result)) {
                $('#ordertable').append(
                    '<tr><td colspan=5>Bạn chưa có đơn hàng nào</td></tr>'
                )
            } else {
                $.each(result, function (index, data) {
                    var date = new Date(Date.parse(data.orderdate));
                    $('#ordertable').append(
                        '<tr>' +
                        '<td>' + data.trackingNumber + '</td>' +
                        '<td>' + date.toLocaleDateString("vi-VI") + '</td>' +
                        '<td>' + data.address + ', ' + data.ward.name + ', ' + data.ward.district.name + '</td>' +
                        '<td align="right">' + data.totalPrice.toLocaleString() + ' đ</td>' +
                        '<td>Đang vận chuyển</td>' +
                        '</tr>'
                    )
                })
            }
        }
    })
</script>
</body>
</html>