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
            <%@include file="component/customer_panel.jsp"%>
        </div>
        <div class="sortable" id="layoutGroup4">
            <div class="block" id="module_customersorders">
                <h3 id="titleCustomer">Thông tin tài khoản</h3>
                <div class="blockcontent">
                    <form method="post" name="info" id="info" action="/customers/edit/index.html" onSubmit="return ValidateForm(CheckForm);">
                        <div class="field">
                            <div class="textlabel">
                                <label>Email</label> <span class="Required">*</span>:
                            </div>
                            <input type="text"
                                   disabled=""
                                   autocomplete="off"
                                   name="email"
                                   value="${sessionScope.account.email}" />
                            <span class="help" id="help1"></span>
                        </div>
                        <div class="field">
                            <div class="textlabel">
                                <label for="fullname">Họ và tên</label> <span class="Required">*</span>:
                            </div>
                            <select id="gender" name="gender" class="selectfield Field70">
                                <option value="0" >Chị</option>
                                <option value="1" selected="selected">Anh</option>
                            </select>
                            <input autocomplete="off"
                                   id="fullname"
                                   type="text"
                                   name="fullname"
                                   class="Field197"
                                   value="${sessionScope.account.name}"/>
                            <span class="help" id="help2"></span>
                        </div>
                        <div class="field">
                            <div class="textlabel">
                                <label for="telephone">Điện thoại</label> <span class="Required">*</span>:
                            </div>
                            <input autocomplete="off"
                                   id="telephone"
                                   type="text" name="telephone"
                                   value="${sessionScope.account.phone}"/>
                            <span class="help" id="help3"></span>
                        </div>
                        <div class="field">
                            <div class="textlabel">
                                <label for="telephone">Ngày sinh</label>:
                            </div>
                            <select name="dd" id="dd" class="Field50">
                                <option value="0">ngày</option>
                                <option value='1' selected>1</option><option value='2'>2</option><option value='3'>3</option><option value='4'>4</option><option value='5'>5</option><option value='6'>6</option><option value='7'>7</option><option value='8'>8</option><option value='9'>9</option><option value='10'>10</option><option value='11'>11</option><option value='12'>12</option><option value='13'>13</option><option value='14'>14</option><option value='15'>15</option><option value='16'>16</option><option value='17'>17</option><option value='18'>18</option><option value='19'>19</option><option value='20'>20</option><option value='21'>21</option><option value='22'>22</option><option value='23'>23</option><option value='24'>24</option><option value='25'>25</option><option value='26'>26</option><option value='27'>27</option><option value='28'>28</option><option value='29'>29</option><option value='30'>30</option><option value='31'>31</option>
                            </select>
                            <select name="mm" id="mm" class="Field50">
                                <option value="0" >Tháng</option>
                                <option value='1' selected>1</option><option value='2'>2</option><option value='3'>3</option><option value='4'>4</option><option value='5'>5</option><option value='6'>6</option><option value='7'>7</option><option value='8'>8</option><option value='9'>9</option><option value='10'>10</option><option value='11'>11</option><option value='12'>12</option>
                            </select>
                            <input type="text" class="Field50" name="yy" value="1997" size="4" maxlength="4" id="yy" />
                            <span class="help" id="help4">(Không bắt buộc)</span>
                        </div>
                        <div class="field">
                            <div class="textlabel">
                                &nbsp;
                            </div>
                            <input type="submit" align="absmiddle" class="yellowbuttom" value="Lưu" />
                            <input type="hidden" name="redirect" value="" />
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
<script>
    $("#accountPanel li").each(function() {
        if($(this).text()==$('#titleCustomer').text()) {
            $(this).attr("class", "bold")
        }
    })
</script>
</body>
</html>