<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
                <li><a href="/" title="Trang chủ">Trang chủ</a></li>
                <li>Quên mật khẩu</li>
            </ul>
        </div>
    </div>
    <div class="clear"></div>
    <div id="container">
        <div class="sortable" id="layoutGroup1">
            <div class="block" id="module_Login">
                <h1>
                    <a href="/account/login" title="Đăng Nhập">Đăng nhập</a> <span>hoặc</span>
                    <a href="/account/register" title="Đăng ký">Đăng ký</a>
                </h1>
                <div class="blockcontent">
                    <div class="loginsocial">
                        <h3>Đăng nhập bằng</h3>
                    </div>
                    <div class="loginform" id="forgotSuccess">
                        <h3>Đặt lại mật khẩu</h3>
                        <form method="post" name="fgf" id="fgf" action="/account/reset">
                            <input type="hidden" name="token" value="${token}">
                            <div class="textlabel">
                            </div>
                            <span class="error">${message}</span>
                            <div class="field">
                                <div class="textlabel">
                                    <label>Mật khẩu mới</label> <span class="Required">*</span>:
                                </div>
                                <input type="text" name="password"
                                       id="password"
                                       value=""
                                       autocomplete="off">
                            </div>
                            <div class="field">
                                <div class="textlabel">
                                    <label>Xác nhận mật khẩu mới</label> <span class="Required">*</span>:
                                </div>
                                <input type="text" name="cpassword"
                                       id="cpassword"
                                       value=""
                                       autocomplete="off">
                            </div>
                            <div class="clear"></div>
                            <div class="field">
                                <div class="textlabel">
                                    &nbsp;
                                </div>
                                <input type="submit" align="absmiddle" class="loginbuton" value="Xác nhận"/>
                                &nbsp;&nbsp;&nbsp;
                                <a href="/account/login" title="Đăng ký" class="link_register">Đăng nhập</a>
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
            password: {
                required: true,
                minlength: 6
            },
            cpassword: {
                required: true,
                equalTo: '#password'
            }
        },
        messages: {
            password: {
                required: 'Vui lòng nhập mật khẩu mới',
                minlength: 'Mật khẩu tối thiểu 6 kí tự'
            },
            cpassword: {
                required: 'Vui lòng xác nhận mật khẩu',
                equalTo: 'Xác nhận mật khẩu không trùng khớp'
            }
        }
    })
</script>
</body>
</html>