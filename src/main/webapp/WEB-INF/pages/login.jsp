<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
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
                <li>
                    <a href="/" title="Trang chủ">Trang chủ</a>
                </li>
                <li>Đăng nhập
                </li>
            </ul>
        </div>
    </div>
    <div class="clear"></div>
    <div id="container">
        <div class="sortable"
             id="layoutGroup1">
            <div class="block"
                 id="module_Login">
                <h1>Đăng nhập
                    <span>hoặc</span>
                    <a href="/account/register" title="Đăng ký">Đăng ký</a>
                </h1>
                <div class="blockcontent">
                    <div class="loginsocial">
                        <h3>Đăng nhập bằng</h3>
                    </div>
                    <div class="loginform">
                        <h3>Đăng nhập bằng tài khoản nobita</h3>
                        <form method="post" name="fgf" id="fgf" action="/account/login">
                            <div class="textlabel">
                            </div>
                            <span class="error">${message}</span>
                            <div class="field">
                                <div class="textlabel">
                                    <label>Email</label>
                                    <span class="Required">*</span>:
                                </div>
                                <input type="text" name="email" value="" autocomplete="off">
                            </div>
                            <div class="field">
                                <div class="textlabel">
                                    <label>Mật khẩu</label>
                                    <span class="Required">*</span>:
                                </div>
                                <input autocomplete="off" type="password" name="password">
                            </div>
                            <div class="field">
                                <div class="textlabel"></div>
                                <a href="/account/forgot-password" title="Quên mật khẩu?">Quên mật khẩu?</a>
                            </div>
                            <div class="clear"></div>
                            <div class="field">
                                <div class="textlabel">
                                    &nbsp;
                                </div>
                                <input type="submit" align="absmiddle" class="loginbuton" value="Đăng nhập"/>
                                &nbsp;&nbsp;&nbsp;
                                <a href="/account/register" title="Đăng ký" class="link_register">Tạo tài khoản</a>
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
<script src="/resources/js/dist/jquery.validate.js"></script>
<script>
    $('#fgf').validate({
        rules: {
            email: {
                required: true,
                email: true
            },
            password: "required"
        },
        messages: {
            email: {
                required: 'Email không được để trống',
                email: 'Email không đúng định dạng'
            },
            password: "Mật khẩu không được để trống"
        }
    })
</script>
</body>
</html>