<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@include file="component/header.jsp" %>
    <link href="/resources/layouts/fontpage/css/product.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="/resources/layouts/fontpage/js/jquery.elevatezoom.js"></script>
    <script type="text/javascript" src="/resources//layouts/fontpage/js/gohome.js"></script>
    <link href="/resources/layouts/fontpage/css/draggable.css" type="text/css" rel="stylesheet"/>

</head>
<body>
<div id="main_contener">
    <%@include file="component/navbar_product.jsp" %>
    <div id="container">
        <div class="pathway">
            <ul>
                <li><a href="http://nobita.vn" title="Trang chủ">Trang chủ</a></li>
                <li><a href="/danh-muc/2/van-hoc-nuoc-ngoai.html" title="Văn học nước ngoài">Văn học nước ngoài</a>
                </li>
                <li><a href="/danh-muc/14/tieu-thuyet-dam-my.html" title="Tiểu thuyết đam mỹ">Tiểu thuyết đam mỹ</a>
                </li>
                <li>${book.name}</li>
            </ul>
        </div>
    </div>
    <div class="clear"></div>
    <div id="container">
        <div class="sortable" id="layoutGroup1">
            <div class="product_view_contener">
                <div class="showleft">
                    <div class="product_info">
                        <h1>${book.name}
                        </h1>
                        <div class="groups">
                            <div class="viewfields">
                                <span>Tác giả: <a href="/thuong-hieu/983/doi.html"
                                                  title="${book.author}">${book.author}</a></span>
                                <span>Phát hành: <a href="/thuong-hieu/35/owlbooks.html"
                                                    title="Owlbooks">Owlbooks</a></span>
                            </div>
                            <div class="booktype_contener">
                                <div class="booktype_left">Hình thức:</div>
                                <div class="booktype  first">
                                    <a href="/1848/doc-gia-va-nhan-vat-chinh-dich-thi-la-chan-tinh-tap-2-tai-ban-tang-kem-bookmak-.html?fid=1867"
                                       title="Bìa mềm">Bìa mềm</a>
                                </div>
                                <div class="clear"></div>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div class="groups">

                            <div class="write_comment">
                                <a href="#comment"><i class="fa fa-pencil"></i> Gửi nhật xét của bạn</a>
                            </div>
                            <div class="add_wishlist">
                                <a
                                        href="/orders/addwishlist/1848/doc-gia-va-nhan-vat-chinh-dich-thi-la-chan-tinh-tap-2-tai-ban-tang-kem-bookmak-.html"><i
                                        class="fa fa-star"></i> Thêm vào yêu thích</a>
                            </div>
                            <div class="clear"></div>
                        </div>

                        <div class="prices_contener">
                            <div class="prices">
                                <div class="saleprice">
                                    <span id="saleprice">${book.priceNew} ₫</span>
                                </div>
                                <div class="vrootprice" id="rootprice">Giá bìa: <span>${book.priceOld} ₫</span></div>
                                <div class="yousave" id="yousave">Tiết kiệm: <span>19.580 ₫ (-22%)</span></div>
                            </div>
                            <div class="goshop">
                                <a href="javascript:" onclick="addCart();">Mua ngay</a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div class="clear"></div>


                        <div class="clear"></div>
                        <div class="intro">
                            <div class="block " id="content_ViewProducts">
                                <div class="blockcontent">
                                    <p>
                                        <i class="fa fa-check"></i><span style="font-size:14px;">Bọc Plastic miễn
												ph&iacute;&nbsp;</span></p>
                                    <p>
                                        <i class="fa fa-check"></i><span style="font-size:14px;">Giao h&agrave;ng
												miễn ph&iacute; trong nội th&agrave;nh TP. HCM với đơn h&agrave;ng&nbsp;
												<span style="color:#33cc33;"><strong>&ge; 150.000
														đ</strong></span></span></p>
                                    <p>
                                        <i class="fa fa-check"></i><span style="font-size:14px;">Giao h&agrave;ng
												miễn ph&iacute; to&agrave;n quốc với đơn h&agrave;ng <span
                                                style="color:#33cc33;"><strong>&ge; 250.000 đ</strong></span></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <div class="fb-like"
                             data-href="http://nobita.vn/1848/doc-gia-va-nhan-vat-chinh-dich-thi-la-chan-tinh-tap-2-tai-ban-tang-kem-bookmak-.html"
                             data-layout="standard" data-action="like" data-show-faces="false" data-share="false">
                        </div>
                    </div>
                </div>
                <div class="image_contenner">
                    <div class="mainimage">
                        <img src="resources/${book.image}"
                             alt="${book.name} "
                             id="mainimage" width="250"/>

                    </div>
                    <div class="subthums" id="gallery_01">

                    </div>
                </div>
                <div class="clear"></div>
                <input type="hidden" name="formatid" id="formatid" value=""/>
                <input type="hidden" name="sizeid" id="sizeid" value=""/>
                <input type="hidden" name="colorid" id="colorid" value=""/>
            </div>

            <div class="block" id="module_ProductDetail">
                <h3>Giới thiệu sách</h3>
                <div class="intro" id="contentid">
                    <p style="text-align: justify;">
							<span style="color:#ff0000;"><span style="font-size:16px;"><strong>
                                ${book.name}
                            </strong></span></span></p>
                    <p style="text-align: justify;">
							<span style="font-size:14px;"><span style="color:#008000;"><strong>Qu&agrave; tặng: 01
										Bookmark xinh xắn d&agrave;nh cho 1000 đơn h&agrave;ng đầu
										ti&ecirc;n</strong></span></span></p>
                    <p style="text-align: center;">
							<span style="font-size:14px;"><span style="color:#008000;"><strong><img alt=""
                                                                                                    src="/stores/images/doc-gia-tap-2-full.jpg"
                                                                                                    style="width: 960px; height: 720px;"/></strong></span></span>
                    </p>
                    <p style="text-align: justify;">
                        Anti fan mang theo cốt truyện, xuy&ecirc;n kh&ocirc;ng tới.</p>
                    <p style="text-align: justify;">
                        Nh&acirc;n vật ch&iacute;nh hắc h&oacute;a ta mạnh nhất!</p>
                    <p style="text-align: justify;">
                        T&aacute;n đổ c&aacute;c em g&aacute;i kh&ocirc;ng th&agrave;nh vấn đề&hellip; Từ từ!</p>
                    <p style="text-align: justify;">
                        Tại sao hai chị em Ma tộc đ&atilde; thầm coi bọn họ l&agrave; một đ&ocirc;i b&aacute;ch hợp
                        một đ&ocirc;i gay?</p>
                    <p style="text-align: justify;">
                        Đừng lo, bẻ cong th&agrave;nh thẳng vẫn c&ograve;n c&oacute; đường.</p>
                    <p style="text-align: justify;">
                        Em g&aacute;i Mị ma xinh đẹp chặn cửa ư? L&agrave;m sao để đẩy ng&atilde;? B&aacute;n nhan
                        sắc nh&acirc;n vật ch&iacute;nh!</p>
                    <p style="text-align: justify;">
                        Tu vừa bị b&aacute;n liền liếc mắt nh&igrave;n qua, khiến Đỗ trạch nuốt trọn t&igrave;nh
                        tiết cốt truyện xuống.</p>
                    <p style="text-align: justify;">
                        Hiến kế tặng nhẫn để cứu v&atilde;n d&agrave;n hậu cung, rốt cuộc người n&agrave;o sẽ chui
                        v&agrave;o tr&ograve;ng?</p>
                    <p style="text-align: justify;">
                        Tay phải si&ecirc;u cấp tiếp ba chi&ecirc;u từ thục (hủ) nữ, nhưng cơ thể lại bị phản
                        đ&ograve;n.</p>
                    <p style="text-align: justify;">
                        Nh&acirc;n vật ch&iacute;nh phạm quy cực kỳ, l&agrave;m kh&oacute; tiểu sinh qu&aacute;!</p>
                    <p style="text-align: justify;">
                        Muốn ng&acirc;m suối nước n&oacute;ng b&agrave;n chuyện nh&acirc;n sinh? Muốn b&aacute;n
                        nh&acirc;n vật ch&iacute;nh h&ograve;ng dễ bề rời s&acirc;n khấu ư?</p>
                    <p style="text-align: justify;">
                        Đỗ Trạch đang l&agrave;m, Tu đang nh&igrave;n đ&oacute;.</p>
                    <p style="text-align: justify;">
                        Nh&acirc;n vật ch&iacute;nh &ldquo;Hỗn Huyết&rdquo; b&agrave;y sẵn t&acirc;m l&yacute;
                        chiến, chờ t&ecirc;n ngốc độc giả rơi xuống hố!</p>

                </div>
                <div class="viewmore" id="viewmore"><span>Xem thêm nội dung <i class="fa fa-sort-desc"></i></span>
                </div>
            </div>
            <script>
                var contentid = $('#contentid');
                var hieght = contentid.height();
                $('#viewmore').hide();
                if (hieght > 400) {
                    contentid.addClass('collapse');
                    $('#viewmore').show();
                }

                $('.viewmore').click(function () {
                    if (contentid.hasClass('collapse')) {
                        contentid.removeClass('collapse');
                        $('#viewmore span').empty();
                        $('#viewmore span').append('Thu gọn <i class="fa fa-sort-asc"></i>');
                    } else {
                        contentid.addClass('collapse');
                        $('#viewmore span').empty();
                        $('#viewmore span').append('Xem thêm nội dung <i class="fa fa-sort-desc"></i>');
                    }
                });
            </script>
            <div class="block" id="module_ProductFieds">
                <a name="fieldlist"></a>
                <h3>Thông tin chi tiết</h3>
                <table class="fields" cellpadding="0" cellspacing="0" width="100%">
                    <tr class="field_view_contenner row0">
                        <td class="title">
                            <a href="/products/groupfield/1/tac-gia.html" title="Tác giả">Tác giả</a>
                        </td>
                        <td class="values">
                            <a href="/thuong-hieu/983/doi.html" title="Đồi">Đồi</a>
                        </td>
                    </tr>
                    <tr class="field_view_contenner row1">
                        <td class="title">
                            <a href="/products/groupfield/2/phat-hanh.html" title="Phát hành">Phát hành</a>
                        </td>
                        <td class="values">
                            <a href="/thuong-hieu/35/owlbooks.html" title="Owlbooks">Owlbooks</a>
                        </td>
                    </tr>
                    <tr class="field_view_contenner row0">
                        <td class="title">
                            <a href="/products/groupfield/4/nxb.html" title="NXB">NXB</a>
                        </td>
                        <td class="values">
                            Dân Trí
                        </td>
                    </tr>
                    <tr class="field_view_contenner row1">
                        <td class="title">
                            Số trang
                        </td>
                        <td class="values">
                            288
                        </td>
                    </tr>
                    <tr class="field_view_contenner row0">
                        <td class="title">
                            Kích thước
                        </td>
                        <td class="values">
                            13.5 x 20.5 cm
                        </td>
                    </tr>
                    <tr class="field_view_contenner row1">
                        <td class="title">
                            Trọng lượng
                        </td>
                        <td class="values">
                            320
                        </td>
                    </tr>
                    <tr class="field_view_contenner row0">
                        <td class="title">
                            Lượt xem
                        </td>
                        <td class="values">
                            8219
                        </td>
                    </tr>
                    <tr class="field_view_contenner row1">
                        <td class="title">
                            Ngày phát hành
                        </td>
                        <td class="values">
                            17/11/2016
                        </td>
                    </tr>
                    <tr class="field_view_contenner row0">
                        <td class="title">
                            Danh mục
                        </td>
                        <td class="values">
                            <a href="/danh-muc/14/tieu-thuyet-dam-my.html" title="Tiểu thuyết đam mỹ">Tiểu thuyết
                                đam mỹ</a>
                        </td>
                    </tr>
                </table>
                <div class="goshop cfields">
                    <a href="javascript:" onclick="addCart();">Mua ngay</a>
                </div>
            </div>
            <div class="block" id="module_sameAuthor">
                <h3>Sách cùng tác giả</h3>
                <div class="blockcontent">
                    <div style="position:relative; padding:0 0; overflow:hidden; height:320px;">
                        <c:forEach items="${quanTam}" var="item">
                        <div class="product_contener">
                            <div class="products">
                                <div class="image"><a
                                        href="/2355/doc-gia-va-nhan-vat-chinh-dich-thi-la-chan-tinh-tap-1-tai-ban-.html"
                                        title="${item.name}"><img
                                        src="/resources/${item.image}"
                                        alt="${item.name}"
                                        title="${item.name}"/></a>
                                    <span class="saleprice">-${item.saleoff}%</span>
                                </div>
                                <div class="productname">
                                    <a href="/2355/doc-gia-va-nhan-vat-chinh-dich-thi-la-chan-tinh-tap-1-tai-ban-.html"
                                       title="${item.name}">${item.name}</a>
                                </div>
                                <div class="fields"> <span><a href="/thuong-hieu/983/doi.html"
                                                              title="${item.author}">${item.author}</a></span></div>


                                <div class="prices">${item.priceNew} ₫</div>
                                <div class="rootprice">${item.priceOld} ₫</div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="block" id="module_AlsoBought">
                <h3>Có thể bạn quan tâm</h3>
                <div class="blockcontent">
                    <div style="position:relative; padding:0 0; overflow:hidden; height:320px;">
                        <c:forEach var="item" items="${quanTam}">
                            <div class="product_contener">
                                <div class="products">
                                    <div class="image"><a href="/1152/nua-kiep-hong-tran-mot-khuc-du-ca.html"
                                                          title="${item.name}"><img
                                            src="/resources/${item.image}"
                                            alt="${item.name}"
                                            title="${item.name}"/></a>
                                        <span class="saleprice">-${item.saleoff}%</span>
                                    </div>
                                    <div class="productname">
                                        <a href="/1152/nua-kiep-hong-tran-mot-khuc-du-ca.html"
                                           title="${item.name}">
                                                ${item.name}
                                        </a>
                                    </div>
                                    <div class="fields">
                                    <span>
                                        <a href="/thuong-hieu/1/diep-lac-vo-tam.html" title="${item.author}">
                                                              ${item.author}
                                                              </a>
                                                              </span>
                                    </div>


                                    <div class="saleprice">${item.priceNew} ₫</div>
                                    <div class="rootprice">${item.priceOld} ₫</div>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
            <div class="block" id="module_Comments">
                <script src="http://nobita.vn/layouts/fontpage/js/jquery.elastic.source.js"
                        charset="utf-8"></script>
                <h3>Gửi nhật xét của bạn</h3>
                <div class="comment_form">
                    <div>
                        Vui lòng <a
                            href='/users/login/index.html?redirect=%2F1848%2Fdoc-gia-va-nhan-vat-chinh-dich-thi-la-chan-tinh-tap-2-tai-ban-tang-kem-bookmak-.html'
                            title='đăng nhập'>đăng nhập</a> để viết nhận xét
                    </div>
                </div>
                <h3>
                    <ul id="tabnav">
                        <li><a href="javascript:" class="active" id="tab0" onclick="ShowTab(0)">Nhận xét của khách
                            hàng</a></li>
                        <li><a href="javascript:" id="tab1" onclick="ShowTab(1)"><i
                                class="fa fa-facebook-square"></i> Thảo luận(<fb:comments-count
                                href= http://nobita.vn/1848/doc-gia-va-nhan-vat-chinh-dich-thi-la-chan-tinh-tap-2-tai-ban-tang-kem-bookmak-.html>
                            </fb:comments-count>) </a></li>
                    </ul>
                </h3>
                <a name="comment"></a>
                <div class="blockcontent">
                    <div id="div0">
                        <div class="comment_list">
                            <div id="comment_contener">
                                Không tìm thấy nhận xét nào cho sản phẩm này
                            </div>
                        </div>
                    </div>
                    <div id="div1">
                        <div class="fb-comments"
                             data-href="http://nobita.vn/1848/doc-gia-va-nhan-vat-chinh-dich-thi-la-chan-tinh-tap-2-tai-ban-tang-kem-bookmak-.html"
                             data-width="100%" data-numposts="5" data-colorscheme="light"></div>
                    </div>
                </div>
                <script type="text/javascript">
                    function rate(rid) {
                        var w = rid * 30;
                        gde('rate').style.width = w + 'px';
                        gde('comrating').value = rid;
                    }

                    function check_comment_form() {
                        var comrating = gde("comrating");
                        var title = gde("title");
                        var commenttext = gde("commenttext");

                        if (comrating.value == 0) {
                            Boxy.alert('Vui lòng cho đánh giá sản phẩm', null, {title: 'Thông báo'});
                            return false;
                        }

                        if (title.value == "") {
                            Boxy.alert('Vui lòng nhập tiêu đề', null, {title: 'Thông báo'});
                            return false;
                        }

                        if (commenttext.value.length < 100) {
                            Boxy.alert('Nội dung nhận xét tối thiểu là 100 từ, tối đa là 2000 từ', null, {title: 'Thông báo'});
                            return false;
                        }
                    }

                    function postreply(commentid) {
                        var textarea = gde("textarea" + commentid);

                        if (textarea.value == "") {
                            return false;
                        }

                        var formdata = $("#frcm" + commentid).serialize();
                        address = '/products/postreply/index.html';
                        $.ajax({
                            type: "POST",
                            dataType: "html",
                            url: address,
                            data: formdata,
                            cache: false,
                            error: function (e) {
                                Boxy.alert('Lỗi ajax', null, {title: 'Thông báo'});
                            },
                            success: function (data) {
                                if (data != '') {
                                    $("#commentryply" + commentid).prepend(data);
                                    textarea.value = "";
                                } else {
                                    Boxy.alert('Lỗi ajax', null, {title: 'Thông báo'});
                                }
                            }
                        });
                    }

                    function getmorereply(commentid, from) {
                        address = addQuery('/products/morereply/index.html', 'parentid=' + commentid);
                        address = addQuery(address, 'from=' + from);
                        $.ajax({
                            type: "GET",
                            dataType: "html",
                            url: address,
                            cache: false,
                            error: function (e) {
                                Boxy.alert('Lỗi ajax', null, {title: 'Thông báo'});
                            },
                            success: function (data) {
                                if (data != '') {
                                    $("#getreply" + commentid).remove();
                                    $("#commentryply" + commentid).append(data);
                                }
                            }
                        });
                    }

                    function helpful(url, commentid, type) {
                        $.ajax({
                            type: "GET",
                            dataType: "html",
                            url: url,
                            cache: false,
                            error: function (e) {
                                Boxy.alert('Lỗi ajax', null, {title: 'Thông báo'});
                            },
                            success: function (data) {
                                if (data != '') {
                                    if (type == 1) {
                                        $("#helpfulyes" + commentid).empty();
                                        $("#helpfulyes" + commentid).append(data);
                                    } else {
                                        $("#helpfulno" + commentid).empty();
                                        $("#helpfulno" + commentid).append(data);
                                    }
                                }
                            }
                        });
                    }

                    function morecom(from) {
                        address = addQuery('/products/comments/1848/index.html', 'from=' + from);
                        $.ajax({
                            type: "GET",
                            dataType: "html",
                            url: address,
                            cache: false,
                            error: function (e) {
                                Boxy.alert('Lỗi ajax', null, {title: 'Thông báo'});
                            },
                            success: function (data) {
                                if (data != '') {
                                    $("#morecom").remove();
                                    $("#comment_contener").append(data);
                                }
                            }
                        });
                    }

                    function ShowTab(T) {
                        i = 0;
                        while (gde("tab" + i) != null) {
                            gde("div" + i).style.display = "none";
                            gde("tab" + i).className = "";
                            i++;
                        }

                        gde("div" + T).style.display = "";
                        gde("tab" + T).className = "active";

                    }

                    $(document).ready(function () {
                        $('.elastic').elastic();
                        ShowTab(1);
                    });
                </script>
            </div>
        </div>
    </div>
    <div class="clear"></div>
    <div id="container">

    </div>
    <script type="text/javascript">
        function showelevate() {
            $("#mainimage").elevateZoom({
                gallery: 'gallery_01',
                cursor: 'pointer',
                galleryActiveClass: "active",
                imageCrossfade: true,
                loadingIcon: 'http://nobita.vn/layouts/fontpage/images/spinner.gif'
            });

            $("#mainimage").bind("click", function (e) {
                var ez = $('#mainimage').data('elevateZoom');
                ez.closeAll();
                $.fancybox(ez.getGalleryList());
                return false;
            });
        }

        $(document).ready(function () {
            showelevate();
        });

        $(function () {
            $('.boxy').boxy({ovlay: true, unloadOnHide: true});
        });
    </script>
    <div id="footer">
        <%@include file="component/footer.jsp" %>
    </div>
</div>