<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
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
                <li>
                    <a href="/category/${book.category.parentCategory.id}" title="${book.category.parentCategory.name}">
                        ${book.category.parentCategory.name}
                    </a>
                </li>
                <li>
                    <a href="/category/${book.category.parentCategory.id}/sub/${book.category.id}"
                       title="${book.category.name}">${book.category.name}</a>
                </li>
                <li>${fn:toUpperCase(book.name)}</li>
            </ul>
        </div>
    </div>
    <div class="clear"></div>
    <div id="container">
        <div class="sortable" id="layoutGroup1">
            <div class="product_view_contener">
                <div class="showleft">
                    <div class="product_info">
                        <h1>
                            ${fn:toUpperCase(book.name)}
                        </h1>
                        <div class="groups">
                            <div class="viewfields">
                                <span>Tác giả: <a href="#"
                                                  title="${book.author}">${book.author}</a></span>
                                <span>Phát hành: <a href="#"
                                                    title="${book.publisher.name}">${book.publisher.name}</a></span>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div class="prices_contener">
                            <div class="prices">
                                <div class="saleprice">
                                    <span id="saleprice">
                                       <fmt:formatNumber pattern="###,###" value="${book.priceNew}"/> ₫
                                    </span>
                                </div>
                                <div class="vrootprice" id="rootprice">
                                    Giá bìa: <span><fmt:formatNumber pattern="###,###"
                                                                     value="${book.priceOld}"/> ₫</span>
                                </div>
                                <div class="yousave" id="yousave">
                                    Tiết kiệm: <span>
                                    <fmt:formatNumber pattern="###,###"
                                                      value="${book.priceOld - book.priceNew}"/> ₫ (-${book.saleoff}%)
                                </span>
                                </div>
                            </div>
                            <div class="goshop">
                                <a onclick="addCart(${book.id})">Mua ngay</a>
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
                    ${book.description}
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
                        $('#viewmore span').append(
                            'Thu gọn <i class="fa fa-sort-asc"></i>'
                        );
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
                            <a href="#" title="Tác giả">Tác giả</a>
                        </td>
                        <td class="values">
                            <a href="#" title="${book.author}">${book.author}</a>
                        </td>
                    </tr>
                    <tr class="field_view_contenner row1">
                        <td class="title">
                            <a href="#" title="NXB">NXB</a>
                        </td>
                        <td class="values">
                            <a href="#" title="${book.publisher.name}">${book.publisher.name}</a>
                        </td>
                    </tr>
                    <tr class="field_view_contenner row1">
                        <td class="title">
                            Số trang
                        </td>
                        <td class="values">
                            ${book.numberPage}
                        </td>
                    </tr>
                    <tr class="field_view_contenner row0">
                        <td class="title">
                            Kích thước
                        </td>
                        <td class="values">
                            ${book.size}
                        </td>
                    </tr>
                    <tr class="field_view_contenner row1">
                        <td class="title">
                            Trọng lượng
                        </td>
                        <td class="values">
                            ${book.weight}
                        </td>
                    </tr>
                    <tr class="field_view_contenner row1">
                        <td class="title">
                            Ngày phát hành
                        </td>
                        <td class="values">
                            ${book.publishedDate}
                        </td>
                    </tr>
                    <tr class="field_view_contenner row0">
                        <td class="title">
                            Danh mục
                        </td>
                        <td class="values">
                            <a href="#" title="${book.category.name}">
                                ${book.category.name}
                            </a>
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
                                            href="#"
                                            title="${item.name}"><img
                                            src="/resources/${item.image}"
                                            alt="${item.name}"
                                            title="${item.name}"/></a>
                                        <span class="saleprice">-${item.saleoff}%</span>
                                    </div>
                                    <div class="productname">
                                        <a href="#"
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
                                    <div class="image"><a href="#"
                                                          title="${item.name}"><img
                                            src="/resources/${item.image}"
                                            alt="${item.name}"
                                            title="${item.name}"/></a>
                                        <span class="saleprice">-${item.saleoff}%</span>
                                    </div>
                                    <div class="productname">
                                        <a href="#"
                                           title="${item.name}">
                                                ${item.name}
                                        </a>
                                    </div>
                                    <div class="fields">
                                    <span>
                                        <a href="#" title="${item.author}">
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
                <script src="/resources/layouts/fontpage/js/jquery.elastic.source.js"
                        charset="utf-8"></script>
                <h3>Gửi nhật xét của bạn</h3>
                <div class="comment_form">
                    <div>
                        Vui lòng <a
                            href='#'
                            title='đăng nhập'>đăng nhập</a> để viết nhận xét
                    </div>
                </div>
                <h3>
                    <ul id="tabnav">
                        <li><a href="javascript:" class="active" id="tab0" onclick="ShowTab(0)">Nhận xét của khách
                            hàng</a></li>
                        <li><a href="javascript:" id="tab1" onclick="ShowTab(1)"><i
                                class="fa fa-facebook-square"></i> Thảo luận(<fb:comments-count
                                href="http://nobita.vn/1848/doc-gia-va-nhan-vat-chinh-dich-thi-la-chan-tinh-tap-2-tai-ban-tang-kem-bookmak-.html">
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
            </div>
        </div>
    </div>
    <div class="clear"></div>
    <div id="footer">
        <%@include file="component/footer.jsp" %>
    </div>
    <script type="text/javascript">
        function addCart(id) {
            $.ajax({
                url: '/cart/addCart',
                data: {
                    id: id
                },
                success: function (result) {
                    if (result != null) {
                        swal({
                            title: result.name,
                            text: 'Đã được thêm vào giỏ hàng',
                            confirmButtonText: 'OK!'
                        }).catch(swal.noop);
                        $.ajax({
                            url: '/cart/getCart',
                            dataType: 'json',
                            success: function (result) {
                                console.log(result.length)
                                $('.shownumber').html(result.length);
                                $('#cartslist').empty()
                                $.each(result, function (index, data) {
                                    $('#cartslist').append(
                                        '<div class="small_products">' +
                                        '<a href="/product?bookid=' + data.book.id + '" title="'+data.book.name+'">' +
                                        '<div class="image">' +
                                        '<img width="30" src="/' + data.book.image + '" alt="'+data.book.name+'" title="'+data.book.name+'">' +
                                        '</div>' +
                                        '<div class="info">' +
                                        '<div class="title">' +
                                        '' + data.book.name + '' +
                                        '</div>' +
                                        '<div class="prices">' +
                                        '116.450 ₫' +
                                        '</div>' +
                                        '</div>' +
                                        '<div class="clear"></div>' +
                                        '</a>' +
                                        '</div>')
                                })
                            }
                        })
                    }
                }
            })
        }
    </script>
</div>