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
                <h3 id="titleCustomer">Đổi mật khẩu</h3>
                <div class="blockcontent">
                    <span class="error">${message}</span>
                    <form method="post" id="forgotPassword" action="/account/change-password">
                        <div class="field">
                            <div class="textlabel">
                                <label for="oldpassword">Mật khẩu cũ</label> <span class="Required">*</span>:
                            </div>
                            <input autocomplete="off" type="password" id="oldpassword" name="oldpassword">
                            <span class="help" id="help1"></span>
                        </div>
                        <div class="field">
                            <div class="textlabel">
                                <label>Mật khẩu mới</label> <span class="Required">*</span>:
                            </div>
                            <input autocomplete="off" type="password" id="newpassword" name="newpassword">
                            <span class="help" id="help2"></span>
                        </div>
                        <div class="field">
                            <div class="textlabel">
                                <label for="cpassword">Xác nhận mật khẩu</label> <span class="Required">*</span>:
                            </div>
                            <input autocomplete="off" type="password" id="cpassword" name="cpassword">
                            <span class="help" id="help3"></span>
                        </div>
                        <div class="field">
                            <div class="textlabel">
                                &nbsp;
                            </div>
                            <input type="submit" align="absmiddle" class="yellowbuttom" value="Lưu"/>
                            <input type="hidden" name="redirect" value=""/>
                        </div>
                    </form>
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
    $('#forgotPassword').validate({
        rules: {
            oldpassword: {
                required: true,
                remote: {
                    url: '/account/auth-password',
                    type: 'POST',
                    data: {
                        oldpassword: function () {
                            return $('#oldpassword').val()
                        }
                    }
                }
            },
            newpassword: {
                required: true,
                minlength: 6
            },
            cpassword: {
                equalTo: '#newpassword'
            }
        },
        messages: {
            oldpassword: {
                required: 'Vui lòng nhập mật khẩu hiện tại',
                remote: 'Mật khẩu cũ không chính xác'
            },
            newpassword: {
                required: 'Vui lòng nhập mật khẩu mới',
                minlength: 'Mật khẩu ít nhất 6 kí tự'
            },
            cpassword: {
                equalTo: 'Xác nhận mật khẩu không trùng khớp'
            }
        }
    })
    $("#accountPanel li").each(function () {
        if ($(this).text() == $('#titleCustomer').text()) {
            $(this).attr("class", "bold")
        }
    })
</script>
</body>
</html>