<%@ taglib
        uri="http://java.sun.com/jsp/jstl/functions"
        prefix="fn" %>
<%@ page
        language="java"
        contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8" %>
<%@taglib
        prefix="c"
        uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib
        prefix="fmt"
        uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html">
<html">
<head>
    <%@include file="component/header.jsp" %>
    <script type="text/javascript" src="/resources/layouts/fontpage/js/jquery.elevatezoom.js"></script>
    <script type="text/javascript" src="/resources//layouts/fontpage/js/gohome.js"></script>
    <link href="/resources/layouts/fontpage/css/draggable.css" type="text/css" rel="stylesheet"/>
    <link href="/resources/layouts/fontpage/css/orders.css" type="text/css" rel="stylesheet"/>
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
                <li>Giao hàng</li>
            </ul>
        </div>
    </div>
    <div class="clear"></div>
    <div id="container">
        <div id="content_left_contener">
            <div class="sortable"
                 id="layoutGroup5">
                <div class="block"
                     id="module_addressorder">
                    <h4>Địa chỉ giao hàng</h4>
                    <div class="blockcontent">
                        <div class="notlogin">
                            <div class="addform" id="addform">
                                <form method="post" name="rgt" id="rgt" action="/order/checkout">
                                    <div class="field">
                                        <div class="textlabel">
                                            <label>Họ và tên</label>
                                            <span class="Required">*</span>:
                                        </div>
                                        <input autocomplete="off" id="fullname" type="text" name="fullname"/>
                                        <span class="help" id="help5"></span>
                                    </div>
                                    <div class="field">
                                        <div class="textlabel">
                                            <label for="phone">Điện thoại</label>
                                            <span class="Required">*</span>:
                                        </div>
                                        <input autocomplete="off" id="phone" type="text" name="phone"/>
                                        <span class="help" id="help5"></span>
                                    </div>
                                    <div class="field">
                                        <div class="textlabel">
                                            <label>Tỉnh/Thành</label>
                                            <span class="Required">*</span>:
                                        </div>
                                        <select id="province" name="province" class="selectfield Field260"
                                                onchange="checkdistrict(this.value);">
                                            <option value="">Chọn tỉnh thành</option>
                                        </select>
                                        <div class="help" id="help8"></div>
                                    </div>
                                    <div class="field">
                                        <div class="textlabel">
                                            <label>Quận huyện</label>
                                            <span class="Required">*</span>:
                                        </div>
                                        <select id="districts" name="districts" class="selectfield Field260"
                                                onchange="checklocation(this.value);">
                                        </select>
                                        <div class="help" id="help9"></div>
                                    </div>
                                    <div class="field">
                                        <div class="textlabel">
                                            <label>Phường xã</label>
                                            <span class="Required">*</span>:
                                        </div>
                                        <select id="wardid" name="wardid" class="selectfield Field260">
                                        </select>
                                        <div class="help" id="help10"></div>
                                    </div>
                                    <div class="field">
                                        <div class="textlabel">
                                            <label>Địa chỉ</label>
                                            <span class="Required">*</span>:
                                        </div>
                                        <textarea placeholder='Số nhà, tòa nhà (nếu có), tên đường…'
                                                name="address"
                                                id="address"
                                                rows="5"></textarea>
                                        <span class="help" id="help6"></span>
                                    </div>
                                    <div class="field">
                                        <div class="textlabel">
                                            &nbsp;
                                        </div>
                                        <input type="submit" class="bluebuttom Field250" value="Tiếp tục"/>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
                <div id="oder_footer">
                    <div class="fleft">Bạn cần hỗ trợ? Gọi HotLine:
                        <b>097. 4941. 097</b>
                    </div>
                    <div class="oder_footer_menu">
                        <ul>
                            <li class="First">
                                <a href="/" title="Trang chủ" target="_self">Trang chủ</a>
                            </li>
                            <li class="nomal">
                                <a href="/contents/danh-muc/2/cau-hoi-thuong-gap.html" title="Câu hỏi thường gặp"
                                   target="_self">
                                    Câu hỏi thường gặp
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="sortable"
             id="layoutGroup6">
            <div class="block"
                 id="module_ordercart">
                <div class="blockcontent">
                    <table cellpadding="0"
                           cellspacing="0"
                           width="100%"
                           class="orderproducts">
                        <tr>
                            <th class="mtitle" width="90%">
                                <span>Đơn hàng</span>
                                (${fn:length(cart)})
                            </th>
                            <th class="mtitle">
                                <a class="cboxy" title="Đơn hàng" href="/cart">Sửa</a>
                            </th>
                        </tr>
                    </table>
                    <div class="ordercartmin">
                        <table cellpadding="0"
                               cellspacing="0"
                               width="100%"
                               class="orderproducts">
                            <c:forEach var="cart" items="${cart}">
                                <tr>
                                    <td valign="top">
                                        <a href="/product?bookid=${cart.book.id}"
                                           title="${cart.book.name}">${cart.book.name}</a>

                                    </td>
                                    <td valign="top"
                                        nowrap="nowrap"
                                        align="right">
                                        <fmt:formatNumber
                                                pattern="###,###"
                                                value="${cart.book.priceNew}"/>
                                        ₫
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                    <table cellpadding="0" cellspacing="0" width="100%" class="orderproducts">
                        <tr class="subtotal">
                            <td>Tạm tính
                            </td>
                            <td nowrap="nowrap" align="right" id="subtotalvl">
                            </td>
                        </tr>
                        <tr class="total">
                            <td>Tổng tiền</td>
                            <td nowrap="nowrap" align="right" id="totalcacul">384.350
                                ₫
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="clear"></div>
</div>
<div id="footer">
    <%@include file="component/footer.jsp" %>
</div>
<script src="/resources/js/dist/jquery.validate.js"></script>
<script>
    //load Province
    $.ajax({
        url: '/address/provinces',
        dataType: 'json',
        success: function (province) {
            $.each(province, function (index, data) {
                $('#province').append(
                    '<option value="' + data.provinceid + '">' + data.name + '</option>'
                )
            })
        }
    })

    //load District
    function checkdistrict(districtid) {
        $('#districts').empty();
        $('#wardid').empty();
        $.ajax({
            url: '/address/' + districtid + '',
            dataType: 'json',
            success: function (district) {
                $('#districts').empty();
                $('#districts').append(
                    '<option value="">Chọn Quận/huyện</option>'
                )
                $.each(district, function (index, data) {
                    $('#districts').append(
                        '<option value="' + data.districtid + '">' + data.name + '</option>'
                    )
                })
            }
        })
    }

    function checklocation(wardid) {
        console.log(wardid)
        $.ajax({
            url: '/address/district/' + wardid + '',
            dataType: 'json',
            success: function (ward) {
                $('#wardid').empty();
                $.each(ward, function (index, data) {
                    $('#wardid').append(
                        '<option value="' + data.wardid + '">' + data.name + '</option>'
                    )
                })
            }
        })
    }

    $.ajax({
        url: '/cart/total',
        dataType: 'json',
        success: function (total) {
            $('#subtotalvl').html(total.toLocaleString().replace(",", ".") + ' ₫');
            $('#totalcacul').html(total.toLocaleString().replace(",", ".") + ' ₫');
        }
    })
    $('#rgt').validate({
        rules: {
            fullname: "required",
            phone: {
                required: true,
                number: true,
                minlength: 10,
                maxlength: 11
            },
            province: "required",
            districts: "required",
            wardid: "required",
            address: "required"
        },
        messages: {
            fullname: 'Vui lòng nhập vào họ tên',
            phone: {
                required: 'Vui lòng nhập số điện thoại',
                number: 'Số điện thoại không hợp lệ',
                maxlength: 'Số điện thoại không hợp lệ',
                minlength: 'Số điện thoại không hợp lệ',
            },
            province: 'Vui lòng chọn Tỉnh/Thành',
            districts: 'Vui lòng chọn Quận Huyện',
            wardid: 'Vui lòng chọn Phường xã',
            address: 'Vui lòng nhập địa chỉ nhận hàng'
        }
    })
</script>
</body>
</html>