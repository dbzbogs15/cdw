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
            <%@include file="component/customer_panel.jsp" %>
        </div>
        <div class="sortable" id="layoutGroup4">
            <div class="block" id="module_customersorders">
                <h3 id="titleCustomer">Quản lý tài khoản</h3>
                <div class="blockcontent">
                    <div class="customer">
                        <p>Xin chào,  <b>Thái</b>!</p>
                        <p>Trong mục quản lý tài khoản, bạn có thể xem các hoạt động gần đây của bạn và cấp nhật  thông tin tài khoản. Chọn một link bên dưới để xem hoặc chỉnh sửa thông tin.</p>
                    </div>
                    <div class="customer">
                        <h3>Thông báo</h3>
                        <table cellpadding="0" cellspacing="0" width="100%" class="ordertable2">
                            <tr><td colspan="2">Đang cập nhật</td></tr>
                        </table>
                    </div>
                    <div class="customer">

                    </div>
                    <div class="customer">
                        <h3>Thông tin tài khoản</h3>
                        <table cellpadding="0" cellspacing="0" width="100%" class="ordertable">
                            <tr>
                                <th align="left" width="50%">
                                    Thông tin liên hệ
                                    <a class="more" href="/customers/edit/index.html" title="Thay đổi">Thay đổi</a>
                                </th>
                                <th align="left">Địa chỉ giao hàng mặc định
                                    <a class="more" href="/customers/address/index.html">Sổ địa chỉ</a>
                                </th>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <div class="cfield"><b>${sessionScope.account.name}</b></div>
                                    <div class="cfield">${sessionScope.account.email}</div>
                                    <div class="cfield">
                                        <a href="/customers/editpass/index.html" title="Sửa mật khẩu">Sửa mật khẩu</a>
                                    </div>
                                </td>
                                <td>
                                    <div style="display:none">
                                        <div class="cfield"></div>
                                        <div class="cfield"></div>
                                        <div class="cfield"></div>
                                        <div class="cfield"></div>
                                        <div class="cfield">
                                            <a href="" title="Sửa địa chỉ">Sửa địa chỉ</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
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
    $("#accountPanel li").each(function() {
        if($(this).text()==$('#titleCustomer').text()) {
            $(this).attr("class", "bold")
        }
    })
</script>
</body>
</html>