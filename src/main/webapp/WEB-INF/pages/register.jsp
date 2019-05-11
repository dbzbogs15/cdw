<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
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
                <li>Đăng ký</li>
            </ul>
        </div>
    </div>
    <div class="clear"></div>
    <div id="container">
        <div class="sortable" id="layoutGroup1">
            <div class="block" id="module_Login">
                <h1>
                    Đăng ký <span>hoặc</span>
                    <a href="/account/login" title="Đăng nhập">Đăng nhập</a>
                </h1>
                <div class="blockcontent">
                    <div class="loginsocial">
                        <h3>Đăng nhập bằng</h3>
                        <div><a href="javascript:" class="btn_face" onclick="checkLoginState();"></a></div>
                    </div>
                    <div class="registerform">
                        <%--@elvariable id="account" type="com.book.model.Account"--%>
                        <form:form modelAttribute="account" method="post" name="rgt" id="rgt" action="/account/register">
                            <h3>Thông tin đăng nhập</h3>
                            <div class="field">
                                <div class="textlabel">
                                    <label>Email</label> <span class="Required">*</span>:
                                </div>
                                <form:input path="email" type="text" autocomplete="off" value=""/>
                                <form:errors path="email" cssClass="error" />
                            </div>
                            <div class="field">
                                <div class="textlabel">
                                    <label>Mật khẩu</label> <span class="Required">*</span>:
                                </div>
                                <form:input autocomplete="off"
                                            type="password"
                                            path="password"
                                />
                                <form:errors path="password" cssClass="error" />
                            </div>
                            <div class="field">
                                <div class="textlabel">
                                    <label for="repassword">Xác nhận mật khẩu</label> <span
                                        class="Required">*</span>:
                                </div>
                                <input autocomplete="off" id="repassword"
                                       type="password" name="repassword"/>
                            </div>
                            <div class="clear"></div>
                            <h3>Thông tin cá nhân</h3>
                            <div class="field">
                                <div class="textlabel">
                                    <label>Họ và tên</label> <span class="Required">*</span>:
                                </div>
                                <form:select path="gender" class="selectfield Field70">
                                    <option value="0">Chị</option>
                                    <option value="1" selected="selected">Anh</option>
                                </form:select>
                                <form:errors path="gender" cssClass="error" />
                                <form:input autocomplete="off"
                                       type="text" path="name" class="Field197" value=""/>
                            </div>
                            <div class="field">
                                <div class="textlabel">
                                    <label for="phone">Điện thoại</label> <span class="Required">*</span>:
                                </div>
                                <form:input autocomplete="off"
                                       path="phone"
                                       type="text" value=""/>
                                <form:errors path="phone" cssClass="error" />
                            </div>
                            <div class="field">
                                <div class="textlabel">
                                    <label>Ngày sinh</label>:
                                </div>
                                <form:input type="text" class="Field50"
                                       path="birthDate"
                                       autocomplete="off"/>
                                <form:errors path="birthDate" cssClass="error" />
                            </div>
                            <div class="clear">&nbsp;&nbsp;</div>
                            <div class="field" style="padding-left:200px">
                                <input type="submit" align="absmiddle" class="loginbuton"
                                       value="Đăng ký"/>
                            </div>
                        </form:form>
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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
    $("#birthDate").datepicker({
        dateFormat: 'dd/mm/yy'
    });
    $('#rgt').validate({
        rules: {
            email: {
                required: true,
                email: true,
                remote: {
                    url: '/account/checkEmail',
                    type: 'POST',
                    data: {
                        'email' : function () {
                            return $('#email').val()
                        }
                    }
                }
            },
            password: {
                required: true,
                minlength: 6,
            },
            repassword: {
                required: true,
                equalTo: '#password'
            },
            name: 'required',
            phone: {
                required: true,
                number: true,
                minlength: 10,
                maxlength: 11
            },
            birthDate: {
                required: true,
                vnDate: true
            }
        },
        messages: {
            email: {
                required: 'Email không được để trống',
                email: 'Email không đúng định dạng',
                remote: 'Email đã có người đăng ký'
            },
            password: {
                required: 'Mật khẩu không được để trống',
                minlength: 'Mật khẩu tối thiểu 6 kí tự'
            },
            repassword: {
                required: 'Mật khẩu không được để trống',
                equalTo: 'Xác nhập mật khẩu không trùng khớp'
            },
            name: 'Họ tên không được để trống',
            phone: {
                required: 'Số điện thoại không được để trống',
                number: 'Số điện thoại không hợp lệ',
                minlength: 'Số điện thoại không hợp lệ',
                maxlength: 'Số điện thoại không hợp lệ'
            },
            birthDate: {
                required: 'Ngày sinh không được để trống'
            }
        }
    })
    $.validator.addMethod("vnDate", function (value, element) {
        return value.match(/^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/);
    }, 'Ngày sinh vui lòng nhập đúng định dạng, ví 12/02/1997');
</script>
</body>
</html>