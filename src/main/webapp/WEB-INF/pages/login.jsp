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
    <link rel="stylesheet" href="/resources/layouts/fontpage/css/users.css" type="text/css" />
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
        <div class="sortable" id="layoutGroup1">
            <div class="block" id="module_Login">
                <h1>
                    Đăng nhập <span>hoặc</span>
                    <a href="/users/register/index.html" title="Đăng ký">Đăng ký</a>
                </h1>
                <div class="blockcontent">
                    <div class="loginsocial">
                        <h3>Đăng nhập bằng</h3>
                        <div class="buttom">
                            <div><a href="javascript:" class="btn_face" onclick="checkLoginState();"></a></div>
                            <div style="display:none">
                                <a href="javascript:" class="btn_google" onclick="google_login();"></a>
                            </div>
                            <div style="display:none">
                                <a href="javascript:" class="btn_yahoo" onclick="yahoo_login();"></a>
                            </div>
                        </div>
                    </div>
                    <div class="loginform">
                        <h3>Đăng nhập bằng tài khoản nobita</h3>
                        <form method="post" name="fgf" id="fgf" action="/users/processLogin/index.html"
                              onSubmit="return ValidateForm(CheckForm);">
                            <div class="field">
                                <div class="textlabel">
                                    <label for="idemail">Email</label> <span class="Required">*</span>:
                                </div>
                                <input type="text" name="email" id="idemail" onfocus="showhelp(1)" value=""
                                       autocomplete="off">
                                <span class="help" id="help1">Nhập email của bạn</span>
                            </div>
                            <div class="field">
                                <div class="textlabel">
                                    <label for="idpassword">Mật khẩu</label> <span class="Required">*</span>:
                                </div>
                                <input id="idpassword" autocomplete="off" onfocus="showhelp(2)" type="password"
                                       name="password">
                                <span class="help" id="help2">Nhập mật khẩu của bạn</span>
                            </div>
                            <div class="field">
                                <div class="textlabel"></div>
                                <a href="/users/forgotpasswords/index.html" title="Quên mật khẩu?">Quên mật
                                    khẩu?</a>
                            </div>
                            <div class="clear"></div>
                            <div class="field">
                                <div class="textlabel">
                                    &nbsp;
                                </div>
                                <input type="hidden" name="redirect" value="" />
                                <input type="submit" align="absmiddle" class="loginbuton" value="Đăng nhập" />
                                &nbsp;&nbsp;&nbsp;
                                <a href="/users/register/index.html" title="Đăng ký" class="link_register">Tạo tài
                                    khoản</a>
                            </div>
                        </form>
                    </div>
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
</div>
</body>
</html>