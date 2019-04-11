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
