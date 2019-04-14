<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div id="container">
    <div class="footer_menu">
        <div class="block " id="menu_Footer">
            <div class="blockcontent">
                <ul>
                    <li class="group">Hỗ trợ khách hàng
                        <ul>
                            <li class="group">Email: admin@nobita.vn
                                <ul>
                                    <li class="group">Hotline: <b>0938 424 289</b></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="group">Giới thiệu
                        <ul>
                            <li><a href="/gioi-thieu-nobita.html" title="Về nobita" target="_self">Về nobita</a>
                            </li>
                            <li><a href="/tuyen-dung.html" title="Tuyển dụng" target="_self">Tuyển dụng</a></li>
                        </ul>
                    </li>
                    <li class="group">Tài khoản
                        <ul>
                            <li><a href="/users/login/index.html" title="Tài khoản" target="_self">Tài khoản</a>
                            </li>
                            <li><a href="/users/login/index.html" title="Danh sách đơn hàng" target="_self">Danh
                                sách đơn hàng</a></li>
                            <li><a href="/users/login/index.html" title="Thông báo" target="_self">Thông báo</a>
                            </li>
                        </ul>
                    </li>
                    <li class="group">Hướng dẫn
                        <ul>
                            <li><a href="/huong-dan-mua-hang.html" title="Hướng dẫn mua hàng" target="_self">Hướng
                                dẫn mua hàng</a></li>
                            <li><a href="/phuong-thuc-thanh-toan.html" title="Phương thức thanh toán"
                                   target="_self">Phương thức thanh toán</a></li>
                            <li><a href="/contents/danh-muc/2/cau-hoi-thuong-gap.html"
                                   title="Câu hỏi thường gặp" target="_self">Câu hỏi thường gặp</a></li>
                            <li><a href="/phuong-thuc-van-chuyen.html" title="Phương thức vận chuyển"
                                   target="_self">Phương thức vận chuyển</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="facebook">
        <iframe src="//www.facebook.com/plugins/likebox.php?href=https%3A%2F%2Fwww.facebook.com%2Fnobita.vn&amp;width=300&amp;height=200&amp;colorscheme=light&amp;show_faces=true&amp;header=false&amp;stream=false&amp;show_border=false"
                scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:300px; height:200px;"
                allowTransparency="true"></iframe>
    </div>
    <div class="clear"></div>
    <div class="footer_address">
        <div class="block " id="content_FooterAddress">
            <div class="blockcontent">
                <div style="text-align: center;">
                    Copyright &copy; 2014 Nobita.vn
                </div>
                <div style="text-align: center;">
                    &nbsp;
                </div>
                <div style="text-align: center;">
                    Địa chỉ: 25/5 Thăng Long, P. 4, Quận T&acirc;n B&igrave;nh, TP. Hồ Ch&iacute; Minh
                </div>
                <div style="text-align: center;">
                    &nbsp;
                </div>
                <div style="text-align: center;">
                    <a href="http://online.gov.vn/PersonalWebsiteDisplay.aspx?DocId=9916" target="_blank"><img
                            alt="" src="/resources/stores/images/dathongbao-1.png"
                            style="width: 220px; height: 83px;"/></a></div>
                <div style="text-align: center;">
                    &nbsp;
                </div>
                <div style="text-align: center;">
                    &nbsp;
                </div>
            </div>
        </div>
    </div>
</div>
<div class="homecoupon">
    <div class="titlebar">
        <div class="fleft">Nhiều ưu đãi hấp dẫn đang chờ bạn</div>
        <div class="fright"><span onclick="showdialog(0)">-</span></div>
        <div class="clear"></div>
    </div>
    <form action="/newsletters/submit/index.html" onsubmit="updateemail(this); return false;" id="homecoupon">
        <div align="center" style="margin:5px">
            <input placeholder="Nhập email của bạn vào đây" type="email" value="" id="newemail"
                   class="homeemail" name="newemail" required="">
        </div>
        <div align="center" style="margin:5px">
            <input type="submit" class="homesubmit" value="Đăng ký" name="subscribe" id="homesubmit">
        </div>
        <span id="help1"></span>
        <input type="hidden" name="Cedaac0fa7cce07dd548868b8930eaec8" value="1"/>
    </form>
</div>
<div class="coupon">
    <a href="javascript:" onclick="showdialog(1)">Ưu đãi</a>
</div>
<div id='bttop' class="bttop"><i class="fa fa-arrow-up"></i></div>
<script language="javascript" type="text/javascript">

    <%--if(localStorage.getItem('book')!==null) {--%>
    <%--    var arr = localStorage.getItem('book');--%>
    <%--    var list = []--%>
    <%--    list.push(arr);--%>
    <%--    list.push(JSON.stringify(${hos}))--%>
    <%--    console.log(list)--%>
    <%--    localStorage.setItem('book', list.toString());--%>
    <%--} else {--%>
    <%--    localStorage.setItem('book', JSON.stringify(${hos}));--%>
    <%--}--%>
    $(function () {
        $(window).scroll(function () {
            if ($(this).scrollTop() != 0) {
                $('#bttop').fadeIn();
            } else {
                $('#bttop').fadeOut();
            }
        });
        $('#bttop').click(function () {
            $('body,html').animate({scrollTop: 0}, 800);
        });
    });

    function showdialog(value) {
        if (value == 1) {
            $(".homecoupon").show();
        } else {
            $(".homecoupon").hide();
        }
    }

    function updateemail(obj) {
        address = obj.action;
        var formdata = $("#homecoupon").serialize();
        $.ajax({
            type: "POST",
            dataType: "html",
            url: address,
            data: formdata,
            cache: false,
            error: function (e) {
                Boxy.alert('Lỗi ajax', null, {title: 'Lỗi ajax'});
            },
            success: function (data) {
                if (data != '') {
                    $("#help1").empty();
                    $("#help1").append(data);
                    gde('newemail').value = '';
                }
            }
        });
    };

    var previousScroll = 0;
    $(window).scroll(function () {
        var currentScroll = $(this).scrollTop();
        if (currentScroll < previousScroll && currentScroll > 300) {
            if ($('.top_header').css('position') != 'fixed') {
                $('.top_header').css('position', 'fixed');
            }
        } else {
            $('.top_header').css('position', 'inherit');
        }
        previousScroll = currentScroll;
    });
</script>