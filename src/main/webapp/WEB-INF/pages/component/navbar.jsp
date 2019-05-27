<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="top_header">
    <div id="container">
        <div class="mainlogo">
            <div class="block banner"
                 id="banner_mainlogo">
                <div class="blockcontent">
                    <a href="/" title="Logo chính" target="_self">
                        <img src="/resources/stores/banners/logo.png" border="0"
                             title="Logo chính" width="220" height="44">
                    </a>
                </div>
            </div>
        </div>
        <div class="rightheader">
            <div class="search">
                <form action="#" onsubmit="return checksearch();" method="get">
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
                <script>
                    function checksearch() {
                        var kw = gde("keyword");
                        console.log(kw)
                        if (kw.value == "" || kw.value == "Tìm...") {
                            Boxy.alert("Vui lòng nhập từ khóa để tìm kiếm", null, {title: 'Thông báo'});
                            kw.focus();
                            return false;
                        }
                    }

                    function clearText(field) {
                        if (field.defaultValue == field.value) field.value = '';
                        else if (field.value == '') field.value = field.defaultValue;
                    }

                    $(document).mouseup(function (e) {
                        var container = $(".search");
                        if (!container.is(e.target) && container.has(e.target).length === 0) {
                            $("#autocomplete").hide();
                        }
                    });
                    $(document).keydown(function (e) {
                        if (e.which == 38 || e.which == 40) {
                            var pid = 0;
                            var pvalue = 0;
                            var active = 0;
                            if ($('#autocomplete').length > 0) {
                                i = 0;
                                $(".vsmall_products").each(function (index) {
                                    if ($(this).hasClass("headerpactive")) {
                                        pid = i;
                                        active = 1;
                                        $(this).removeClass("headerpactive");
                                    }
                                    i++;
                                });

                                if (e.which == 38) {
                                    pid--;
                                }

                                if (e.which == 40 && active == 1) {
                                    pid++;
                                }

                                if (pid < 0) {
                                    $("#productid").val(0);
                                }

                                if (pid == i) {
                                    $("#productid").val(0);
                                }

                                i = 0;
                                $(".vsmall_products").each(function (index) {
                                    if (pid == i) {
                                        $("#productid").val(this.id);
                                        $(this).addClass("headerpactive");
                                    }
                                    i++;
                                });
                            }
                            e.preventDefault();
                        }
                    });

                    $("#keyword").keyup(function (e) {
                        if (e.which == 38 || e.which == 40) {
                            return true;
                        }
                        var kw = gde("keyword");
                        if (kw == "") {
                            $("#autocomplete").hide();
                            return true;
                        }
                        var address = '/search/autocomplete';
                        address = addQuery(address, 'keywords=' + kw.value);
                        $.ajax({
                            url: address,
                            dataType: 'json',
                            type: 'GET',
                            cache: false,
                            error: function (e) {
                                $("#autocomplete").hide();
                                return false;
                            },
                            success: function (result) {
                                console.log(result)
                                if (result.length >= 5) {
                                    $("#autocomplete").css('overflow', 'scroll');
                                    $("#autocomplete").css('height', '420px');
                                }
                                if (result.length < 5) {
                                    $("#autocomplete").css('overflow', '');
                                    $("#autocomplete").css('height', '');
                                }
                                if (result) {
                                    $("#autocomplete").empty();
                                    $.each(result, function (index, data) {
                                            $("#autocomplete").append(
                                                '<div class="vsmall_products" id="' + data.id + '">' +
                                                '<a href="/product?bookid=' + data.id + '" title="' + data.name + '">' +
                                                '<div class="image">' +
                                                '<img width="40" src="/resources/' + data.image + '" alt="' + data.name + '" title="' + data.name + '">' +
                                                '</div>' +
                                                '<div class="info">' +
                                                '<div class="title">' + data.name + '</div>' +
                                                '<span class="prices">' + data.priceNew.toLocaleString().replace(',','.') + ' ₫</span>' +
                                                '</div>' +
                                                '<div class="clear"></div>' +
                                                '</a>' +
                                                '</div>'
                                            )
                                        }
                                    );
                                    $('#autocomplete').stop(true, true).slideDown("normal");
                                } else {
                                    $("#autocomplete").hide();
                                }
                            }
                        })
                    })
                </script>
            </div>
            <div class="shoptool">
                <ul class="right_topbar">
                    <li>
                        <c:choose>
                            <c:when test="${sessionScope.account == null}">
                                <div class="textlable" title="Tài khoản của bạn">
                                    Tài khoản của bạn<i class="fa fa-sort-desc"></i>
                                </div>
                                <div class="subcontent">
                                    <div class="buttom">
                                        <div>
                                            <a class="btn_login" href="/account/login">
                                                Đăng nhập
                                            </a>
                                        </div>
                                        <div align="center" class="loginlink">
                                            Khách hàng mới? <a href="/account/register">Tạo tài khoản</a>
                                        </div>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="textlable" title="${sessionScope.account.name}">
                                        ${sessionScope.account.name}<i class="fa fa-sort-desc"></i>
                                </div>
                                <div class="subcontent">
                                    <div class="meminfo">
                                        <div><a href="/customers/index.html">Quản lý tài khoản</a></div>
                                        <div><a href="/account/order">Đơn hàng của tôi</a></div>
                                    </div>
                                    <div class="buttom">
                                        <div>
                                            <a class="btn_login" href="/account/logout">
                                                Đăng xuất
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </li>
                    <li>
                        <div class="textlable" title="Giỏ hàng">
                            Giỏ hàng (<span class="shownumber">0</span>)
                            <i class="fa fa-sort-desc"></i>
                        </div>
                        <div class="subcontent">
                            <h3>Giỏ hàng</h3>
                            <div id="cartslist"></div>
                            <div class="buttom" id="showcartlink">
                                <a class="cartlink" href="/cart" title="GIỎ HÀNG CỦA TÔI">
                                    Xem giỏ hàng<i class="fa fa-play"></i></a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <script>
            function loadCart() {
                $.ajax({
                    url: '/cart/getCart',
                    dataType: 'text',
                    success: function (result) {
                        if (result.length != 0) {
                            result = JSON.parse(result);
                            $('.shownumber').html(result.length);
                            $('#cartslist').empty()
                            $.each(result, function (index, data) {
                                $('#cartslist').append(
                                    '<div class="small_products">' +
                                    '<a href="/product?bookid=' + data.book.id + '" title="' + data.book.name + '">' +
                                    '<div class="image">' +
                                    '<img width="30" src="/' + data.book.image + '" alt="' + data.book.name + '" title="' + data.book.name + '">' +
                                    '</div>' +
                                    '<div class="info">' +
                                    '<div class="title">' +
                                    '' + data.book.name + '' +
                                    '</div>' +
                                    '<div class="prices">' +
                                    ''+data.book.priceNew.toLocaleString().replace(',', ".")+' ₫' +
                                    '</div>' +
                                    '</div>' +
                                    '<div class="clear"></div>' +
                                    '</a>' +
                                    '</div>')
                            })
                        } else {
                            $('.shownumber').html(0);
                            $('#cartslist').empty()
                        }
                    }
                })
            }
            loadCart()
        </script>
        <div class="clear"></div>
    </div>
</div>
<div class="clear"></div>
