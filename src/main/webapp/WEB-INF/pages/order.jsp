<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <link href="/resources/layouts/fontpage/css/orders.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<div id="main_contener">
    <%@include file="component/navbar_product.jsp" %>
    <div id="container">
        <div class="pathway">
            <ul>
                <li><a href="/" title="Trang chủ">Trang chủ</a></li>
                <li>Giao hàng</li>
            </ul>
        </div>
    </div>
    <div class="clear"></div>
    <div id="container">
        <div id="content_left_contener">
            <div class="sortable" id="layoutGroup5">
                <div class="block" id="module_addressorder">
                    <h4>Địa chỉ giao hàng</h4>
                    <div class="blockcontent">
                        <div class="notlogin">
                            <div class="addresscontain" style="display:none">
                                <div class="addressintro">Sử dụng địa chỉ có sẵn bên dưới</div>
                                <form method="post" name="rgt" id="rgt" action="/orders/checkout/index.html">

                                    <div class="field">
                                        <div class="textlabel">
                                            &nbsp;
                                        </div>
                                        <input type="submit" class="bluebuttom Field250" value="Tiếp tục"/>
                                        <input type="hidden" name="C90df69402a9ed906b90736a0a55adb52" value="1"/>
                                    </div>
                                </form>
                            </div>
                            <div class="orther" style="display:none">
                                Bạn muốn giao đến địa chỉ khác?
                                <a href="javarscript:" onclick="showform()">Thêm địa chỉ giao hàng mới</a>
                            </div>
                            <div class="addform" id="addform">
                                <form method="post" name="rgt" id="rgt" action="/orders/checkout/index.html"
                                      onSubmit="return ValidateForm(CheckForm);">
                                    <div class="field">
                                        <div class="textlabel">
                                            <label for="fullname">Họ và tên</label> <span class="Required">*</span>:
                                        </div>
                                        <input onfocus="showhelp(5)" onblur="fonblur(5)" autocomplete="off"
                                               id="telephone" type="text" name="telephone" value=""/>
                                        <span class="help" id="help5"></span>
                                    </div>
                                    <div class="field">
                                        <div class="textlabel">
                                            <label for="telephone">Điện thoại</label> <span
                                                class="Required">*</span>:
                                        </div>
                                        <input onfocus="showhelp(5)" onblur="fonblur(5)" autocomplete="off"
                                               id="telephone" type="text" name="telephone" value=""/>
                                        <span class="help" id="help5"></span>
                                    </div>
                                    <div class="field">
                                        <div class="textlabel">
                                            <label for="stateid">Tỉnh/Thành</label> <span class="Required">*</span>:
                                        </div>
                                        <select id="province" name="province" onfocus="showhelp(8)"
                                                onblur="fonblur(8)" class="selectfield Field260"
                                                onchange="checkdistrict(this.value);">
                                            <option value="0">Chọn tỉnh thành</option>
                                        </select>
                                        <div class="help" id="help8"></div>
                                    </div>
                                    <div class="field">
                                        <div class="textlabel">
                                            <label for="districtid">Quận huyện</label> <span
                                                class="Required">*</span>:
                                        </div>
                                        <select id="districts" name="districts" onfocus="showhelp(9)"
                                                onblur="fonblur(9)" class="selectfield Field260"
                                                onchange="checklocation(this.value);">

                                        </select>
                                        <div class="help" id="help9"></div>
                                    </div>
                                    <div class="field">
                                        <div class="textlabel">
                                            <label for="warid">Phường xã</label> <span class="Required">*</span>:
                                        </div>
                                        <select id="wardid" name="wardid" onfocus="showhelp(10)"
                                                onblur="fonblur(10)" class="selectfield Field260">

                                        </select>
                                        <div class="help" id="help10"></div>
                                    </div>
                                    <div class="field">
                                        <div class="textlabel">
                                            <label for="street">Địa chỉ</label> <span class="Required">*</span>:
                                        </div>
                                        <textarea placeholder='Số nhà, tòa nhà (nếu có), tên đường…'
                                                  onfocus="showhelp(6)" onblur="fonblur(6)" name="street" id="street"
                                                  rows="5"></textarea>
                                        <span class="help" id="help6"></span>
                                    </div>
                                    <div class="field" style="display:none">
                                        <div class="textlabel">
                                            &nbsp;
                                        </div>
                                        <input type="checkbox" value="1" name="isdefault" id="isdefault"/>
                                        <label for="isdefault">Địa chỉ giao hàng mặc định</label>
                                    </div>
                                    <div class="field">
                                        <div class="textlabel">
                                            &nbsp;
                                        </div>
                                        <input type="submit" class="bluebuttom Field250" value="Tiếp tục"/>
                                        <input type="hidden" id="countryid" name="countryid" value="1"/>
                                        <input type="hidden" name="C90df69402a9ed906b90736a0a55adb52" value="1"/>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
                <div id="oder_footer">
                    <div class="fleft">
                        Bạn cần hỗ trợ? Gọi HotLine: <b>097. 4941. 097</b>
                    </div>
                    <div class="oder_footer_menu">
                        <ul>
                            <li class="First">
                                <a href="/" title="Trang chủ" target="_self">Trang chủ</a>
                            </li>
                            <li class="nomal">
                                <a href="/contents/danh-muc/2/cau-hoi-thuong-gap.html" title="Câu hỏi thường gặp"
                                   target="_self">Câu hỏi thường gặp</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="sortable" id="layoutGroup6">
            <div class="block" id="module_ordercart">
                <div class="blockcontent">
                    <table cellpadding="0" cellspacing="0" width="100%" class="orderproducts">
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
                        <table cellpadding="0" cellspacing="0" width="100%" class="orderproducts">
                            <c:forEach var="cart" items="${cart}">
                                <tr>
                                    <td valign="top">
                                        <a href="/product?bookid=${cart.book.id}"
                                           title="${cart.book.name}">${cart.book.name}</a>

                                    </td>
                                    <td valign="top" nowrap="nowrap" align="right">
                                        <fmt:formatNumber pattern="###,###" value="${cart.book.priceNew}"/> ₫
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                    <table cellpadding="0" cellspacing="0" width="100%" class="orderproducts">
                        <tr class="subtotal">
                            <td>Tạm tính</td>
                            <td nowrap="nowrap" align="right" id="subtotalvl">
                            </td>
                        </tr>
                        <tr class="total">
                            <td>Tổng tiền</td>
                            <td nowrap="nowrap" align="right" id="totalcacul">384.350 ₫</td>
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
<script>
    //load Province
    $.ajax({
        url: '/address/provinces',
        dataType: 'json',
        success: function (province) {
            $.each(province, function (index, data) {
                $('#province').append(
                    '<option value="'+data.provinceid+'">'+data.name+'</option>'
                )
            })
        }
    })

    //load District
    function checkdistrict(districtid) {
        $('#districts').empty();
        $('#wardid').empty();
        $.ajax({
            url: '/address/'+districtid+'',
            dataType: 'json',
            success: function (district) {
                $('#districts').empty();
                $.each(district, function (index, data) {
                    $('#districts').append(
                        '<option value="'+data.districtid+'">'+data.name+'</option>'
                    )
                })
            }
        })
    }

    function checklocation(wardid) {
        console.log(wardid)
        $.ajax({
            url: '/address/district/'+wardid+'',
            dataType: 'json',
            success: function (ward) {
                $('#wardid').empty();
                $.each(ward, function (index, data) {
                    $('#wardid').append(
                        '<option value="'+data.wardid+'">'+data.name+'</option>'
                    )
                })
            }
        })
    }

    $.ajax({
        url: '/cart/total',
        dataType: 'json',
        success: function (total) {
            $('#subtotalvl').html(total.toLocaleString().replace(",",".") + ' ₫');
            $('#totalcacul').html(total.toLocaleString().replace(",",".") + ' ₫');
        }
    })
</script>
</body>
</html>