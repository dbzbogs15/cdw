<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@include file="component/header.jsp" %>
</head>

<body>
<div id="main_contener">

    <div id="header">
        <div class="block banner " id="banner_TopHeader">
            <div class="blockcontent"></div>
        </div>
    </div>
    <div id="header">
        <div class="top_header">
            <div id="container">
                <div class="mainlogo">
                    <div class="block banner"
                         id="banner_mainlogo">
                        <div class="blockcontent">
                            <a href="/resources/banners/view/1/logo-chinh.html" title="Logo chính" target="_self">
                                <img src="/resources/stores/banners/logo.png" border="0"
                                     title="Logo chính" width="220" height="44">
                            </a>
                        </div>
                    </div>
                </div>
                <div class="rightheader">
                    <div class="search">
                        <form action="/products/search/index.html" onsubmit="return checksearch();" method="get">
                            <table width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="input" width="100%">
                                        <input type="text" value="" name="keyword" id="keyword" size="10"
                                               class="inputfield" title="Tìm" autocomplete="off"
                                               onfocus="clearText(this)" onblur="clearText(this)"/>
                                    </td>
                                    <td class="search-submit" nowrap="nowrap" width="40">
                                        <input type="submit" value="Tìm" alt="Tìm">
                                        <input type="hidden" name="productid" id="productid" value="0"/>
                                    </td>
                                </tr>
                            </table>
                        </form>
                        <div class="autocomplete" id="autocomplete"></div>
                    </div>
                    <div class="shoptool">
                        <ul class="right_topbar">
                            <li>
                                <div class="textlable" title="Tài khoản của bạn">
                                    Tài khoản của bạn<i class="fa fa-sort-desc"></i>
                                </div>
                                <div class="subcontent">
                                    <div class="buttom">
                                        <div>
                                            <a href="javascript:" class="btn_face" onclick="checkLoginState();"></a>
                                        </div>
                                        <div>
                                            <a class="btn_login" href="/users/login/index.html">
                                                Đăng nhập
                                            </a>
                                        </div>
                                        <div align="center" class="loginlink">
                                            Khách hàng mới? <a href="/users/register/index.html">Tạo tài khoản</a>
                                        </div>
                                    </div>
                                    <script>
                                        function testAPI(response) {
                                            var accessToken = response.authResponse.accessToken;
                                            FB.api('/me', function (response) {
                                                url = '/users/loginopenid/1/index.html';
                                                url = addQuery(url, 'fid=' + response.id);
                                                url = addQuery(url, 'access_token=' + accessToken);
                                                document.location.href = url;
                                            });
                                        }

                                        function checkLoginState() {
                                            FB.getLoginStatus(function (response) {
                                                if (response.status === 'connected') {
                                                    testAPI(response);
                                                } else {
                                                    FB.login(function (response) {
                                                        if (response.authResponse) {
                                                            if (response.status) {
                                                                testAPI(response);
                                                            }
                                                        }
                                                    }, {scope: 'public_profile,email'});
                                                }
                                            });
                                        }

                                        window.fbAsyncInit = function () {
                                            FB.init({
                                                appId: '368970956612542',
                                                cookie: true,
                                                xfbml: true,
                                                version: 'v2.1'
                                            });
                                        };
                                    </script>
                                </div>
                            </li>
                            <li>
                                <div class="textlable" title="Giỏ hàng">
                                    Giỏ hàng (<span class="shownumber">0</span>)
                                    <i class="fa fa-sort-desc"></i>
                                </div>
                                <div class="subcontent">
                                    <h3>Giỏ hàng</h3>
                                    <div id="cartslist">
                                    </div>
                                    <div class="buttom" id="showcartlink">
                                        <a class="cartlink" href="/orders/carts/gio-hang.html" title="GIỎ HÀNG CỦA TÔI">
                                            Xem giỏ hàng<i class="fa fa-play"></i></a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="clear"></div>
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
    <%--    <script language="javascript" type="text/javascript">--%>
    <%--        function checksearch() {--%>
    <%--            kw = gde("keyword");--%>
    <%--            if (kw.value == "" || kw.value == "Tìm...") {--%>
    <%--                Boxy.alert("Vui lòng nhập từ khóa để tìm kiếm", null, {title: 'Thông báo'});--%>
    <%--                kw.focus();--%>
    <%--                return false;--%>
    <%--            }--%>
    <%--        }--%>

    <%--        function clearText(field) {--%>
    <%--            if (field.defaultValue == field.value) field.value = '';--%>
    <%--            else if (field.value == '') field.value = field.defaultValue;--%>

    <%--        }--%>

    <%--        $(document).mouseup(function (e) {--%>
    <%--            var container = $(".search");--%>
    <%--            if (!container.is(e.target) && container.has(e.target).length === 0) {--%>
    <%--                $("#autocomplete").hide();--%>
    <%--            }--%>
    <%--        });--%>

    <%--        $(document).keydown(function (e) {--%>
    <%--            if (e.which == 38 || e.which == 40) {--%>
    <%--                var pid = 0;--%>
    <%--                var pvalue = 0;--%>
    <%--                var active = 0;--%>
    <%--                if ($('#autocomplete').length > 0) {--%>
    <%--                    i = 0;--%>
    <%--                    $(".vsmall_products").each(function (index) {--%>
    <%--                        if ($(this).hasClass("headerpactive")) {--%>
    <%--                            pid = i;--%>
    <%--                            active = 1;--%>
    <%--                            $(this).removeClass("headerpactive");--%>
    <%--                        }--%>
    <%--                        i++;--%>
    <%--                    });--%>

    <%--                    if (e.which == 38) {--%>
    <%--                        pid--;--%>
    <%--                    }--%>

    <%--                    if (e.which == 40 && active == 1) {--%>
    <%--                        pid++;--%>
    <%--                    }--%>

    <%--                    if (pid < 0) {--%>
    <%--                        $("#productid").val(0);--%>
    <%--                    }--%>

    <%--                    if (pid == i) {--%>
    <%--                        $("#productid").val(0);--%>
    <%--                    }--%>

    <%--                    i = 0;--%>
    <%--                    $(".vsmall_products").each(function (index) {--%>
    <%--                        if (pid == i) {--%>
    <%--                            $("#productid").val(this.id);--%>
    <%--                            $(this).addClass("headerpactive");--%>
    <%--                        }--%>
    <%--                        i++;--%>
    <%--                    });--%>
    <%--                }--%>
    <%--                e.preventDefault();--%>
    <%--            }--%>
    <%--        });--%>

    <%--        $("#keyword").keyup(function (e) {--%>
    <%--            if (e.which == 38 || e.which == 40) {--%>
    <%--                return true;--%>
    <%--            }--%>

    <%--            kw = gde("keyword");--%>
    <%--            if (kw == '') {--%>
    <%--                $("#autocomplete").hide();--%>
    <%--                return true;--%>
    <%--            }--%>
    <%--            address = '/home/autocomplete/index.html';--%>
    <%--            address = addQuery(address, 'keywords=' + kw.value);--%>
    <%--            $.ajax({--%>
    <%--                url: address,--%>
    <%--                dataType: "html",--%>
    <%--                type: "GET",--%>
    <%--                cache: false,--%>
    <%--                error: function (e) {--%>
    <%--                    Boxy.alert('Lỗi ajax', null, {title: 'Lỗi'});--%>
    <%--                    return false;--%>
    <%--                },--%>
    <%--                success: function (data) {--%>
    <%--                    if (data) {--%>
    <%--                        $("#autocomplete").empty();--%>
    <%--                        $("#autocomplete").append(data);--%>
    <%--                        $('#autocomplete').stop(true, true).slideDown("normal");--%>
    <%--                    } else {--%>
    <%--                        $("#autocomplete").hide();--%>
    <%--                    }--%>
    <%--                }--%>
    <%--            });--%>
    <%--        });--%>

    <%--        function getcartnumber() {--%>
    <%--            address = '/home/cartnumber/index.html';--%>
    <%--            $.ajax({--%>
    <%--                url: address,--%>
    <%--                dataType: "json",--%>
    <%--                type: "GET",--%>
    <%--                cache: false,--%>
    <%--                error: function (e) {--%>
    <%--                    Boxy.alert('Lỗi ajax', null, {title: 'Thông báo'});--%>
    <%--                    return;--%>
    <%--                },--%>
    <%--                success: function (data) {--%>
    <%--                    $('.shownumber').empty();--%>
    <%--                    $('.shownumber').append(data.id);--%>
    <%--                    if (data.id > 0) {--%>
    <%--                        getcartslist();--%>
    <%--                    } else {--%>
    <%--                        $('#showcartlink').hide();--%>
    <%--                        $('#cartslist').empty();--%>
    <%--                        $('#cartslist').append('<span class="empty">Giỏ hàng chưa có sản phẩm</span>');--%>
    <%--                    }--%>
    <%--                }--%>
    <%--            });--%>
    <%--        }--%>

    <%--        function getcartslist() {--%>
    <%--            address = '/home/cartslist/index.html';--%>
    <%--            $.ajax({--%>
    <%--                url: address,--%>
    <%--                dataType: "html",--%>
    <%--                type: "GET",--%>
    <%--                cache: false,--%>
    <%--                error: function (e) {--%>
    <%--                    Boxy.alert('Lỗi ajax', null, {title: 'Lỗi'});--%>
    <%--                    return false;--%>
    <%--                },--%>
    <%--                success: function (data) {--%>
    <%--                    if (data) {--%>
    <%--                        $("#cartslist").empty();--%>
    <%--                        $("#cartslist").append(data);--%>
    <%--                    } else {--%>
    <%--                        $('#showcartlink').hide();--%>
    <%--                        $('#cartslist').empty();--%>
    <%--                        $('#cartslist').append('<span class="empty">Giỏ hàng chưa có sản phẩm</span>');--%>
    <%--                    }--%>
    <%--                    return true;--%>
    <%--                }--%>
    <%--            });--%>
    <%--        }--%>

    <%--        function delecart(id, pid) {--%>
    <%--            address = '/home/delete/index.html';--%>
    <%--            address = addQuery(address, 'id=' + id);--%>
    <%--            $.ajax({--%>
    <%--                url: address,--%>
    <%--                dataType: "json",--%>
    <%--                type: "GET",--%>
    <%--                cache: false,--%>
    <%--                error: function (e) {--%>
    <%--                    Boxy.alert('Lỗi ajax', null, {title: 'Thông báo'});--%>
    <%--                    return;--%>
    <%--                },--%>
    <%--                success: function (data) {--%>
    <%--                    if (data.id > 0) {--%>
    <%--                        getcartnumber();--%>
    <%--                    } else {--%>
    <%--                        Boxy.alert('Lỗi ajax', null, {title: 'Thông báo'});--%>
    <%--                    }--%>
    <%--                }--%>
    <%--            });--%>
    <%--        }--%>

    <%--        $(function () {--%>
    <%--            $('.cartlink').boxy({ovlay: true, unloadOnHide: true});--%>
    <%--            getcartnumber();--%>
    <%--        });--%>
    <%--    </script>--%>
    <div id="container">
        <div id="mainbanner">
            <%@include file="component/main_banner.jsp"%>
        </div>
        <div class="sortable" id="layoutGroup1">
            <div class="block" id="module_newproducts">
                <%@include file="component/new_product.jsp"%>
            </div>

            <div class="block" id="module_publishing">
                <%@include file="component/publishing.jsp"%>
            </div>
            <div class="block" id="module_bestseller">
                <%@include file="component/best_seller.jsp"%>
            </div>
            <div class="block" id="module_topcategories">
                <%@include file="component/top_categories.jsp"%>
            </div>
            <div class="block " id="content_seohome">
                <%@include file="component/content_bottom.jsp"%>
            </div>
        </div>
    </div>
    <div class="clear"></div>
    <div id="footer">
        <%@include file="component/footer.jsp"%>
    </div>
</div>
</body>
</html>
