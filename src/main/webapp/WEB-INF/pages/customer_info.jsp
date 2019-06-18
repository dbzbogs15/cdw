<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                <li>
                    <a href="/" title="Trang chủ">Trang chủ</a>
                </li>
                <li>
                    Quản lý tài khoản
                </li>
            </ul>
        </div>
    </div>
    <div class="clear"></div>
    <div id="container">
        <div class="sortable"
             id="layoutGroup3">
            <%@include file="component/customer_panel.jsp" %>
        </div>
        <div class="sortable"
             id="layoutGroup4">
            <div class="block"
                 id="module_customersorders">
                <h3 id="titleCustomer">
                    Thông tin tài khoản
                </h3>
                <div class="blockcontent">
                    <form method="post" id="formInfo" action="/account/info">
                        <div class="field">
                            <div class="textlabel">
                                <label>Email</label>
                                <span class="Required">*</span>:
                            </div>
                            <input type="text"
                                   disabled="true"
                                   name="email"
                                   autocomplete="off"
                                   value="${sessionScope.account.email}"/>
                            <span class="help" id="help1"></span>
                        </div>
                        <div class="field">
                            <div class="textlabel">
                                <label>Họ và tên</label>
                                <span class="Required">*</span>:
                            </div>
                            <select name="gender" class="selectfield Field70">
                                <option value="0"
                                        <c:if test="${sessionScope.account.gender == 0}">selected</c:if>>
                                    Chị
                                </option>
                                <option value="1"
                                        <c:if test="${sessionScope.account.gender == 1}">selected</c:if>>
                                    Anh
                                </option>
                            </select>
                            <input autocomplete="off"
                                   type="text" name="name"
                                   class="Field197"
                                   value="${sessionScope.account.name}">
                            <span class="help" id="help2"></span>
                        </div>
                        <div class="field">
                            <div class="textlabel">
                                <label>Điện thoại</label>
                                <span class="Required">*</span>:
                            </div>
                            <input autocomplete="off"
                                   name="phone"
                                   type="text"
                                   value="${sessionScope.account.phone}"/>
                            <span class="help" id="help3"></span>
                        </div>
                        <div class="field">
                            <div class="textlabel">
                                <label>Ngày sinh</label>:
                            </div>
                            <fmt:formatDate
                                    value="${sessionScope.account.birthDate}"
                                    pattern="dd/MM/yyyy"
                                    var="birthDate"/>
                            <input autocomplete="off"
                                   name="birthDate"
                                   type="text"
                                   value="${birthDate}"/>
                        </div>
                        <div class="field">
                            <div class="textlabel">
                                &nbsp;
                            </div>
                            <input type="submit"
                                   align="absmiddle"
                                   class="yellowbuttom"
                                   value="Lưu"/>
                            <input type="hidden"
                                   name="redirect"
                                   value=""/>
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
    $('#formInfo').validate({
        rules: {
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
            name: 'Vui lòng nhập họ tên',
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
    $('#formInfo').submit(function (e) {
        e.preventDefault();
        var formData = $('#formInfo').serialize();
        if ($('#formInfo').valid() == true) {
            $.ajax({
                url: '/account/info',
                dataType: 'json',
                method: 'POST',
                data: formData,
                success: function (result) {
                    if (result == true) {
                        swal('Thay đổi thông tin thành công')
                    } else {
                        swal('Đã có lỗi xảy ra!')
                    }
                }
            })
        }
    })
</script>
<script>
    $("#accountPanel li").each(function () {
        if ($(this).text() == $('#titleCustomer').text()) {
            $(this).attr("class", "bold")
        }
    })
</script>
</body>
</html>