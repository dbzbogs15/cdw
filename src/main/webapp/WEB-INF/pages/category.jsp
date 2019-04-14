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
    <link href="/resources/layouts/fontpage/css/products.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="/resources/css/springbook.css" />
</head>
<body>
<div id="main_contener">
    <%@include file="component/navbar_product.jsp" %>
    <div id="container">
        <div class="pathway">
            <ul>
                <li><a href="/" title="Trang chủ">Trang chủ</a></li>
                <li>${tendanhmuc}</li>
            </ul>
        </div>
    </div>
    <div class="clear"></div>
    <div id="container">
        <div class="sortable" id="layoutGroup3">
            <div class="block" id="module_categories">
                <h2>Danh mục</h2>
                <div class="blockcontent">
                    <ul>
                        <c:forEach items="${categories}" var="category">
                            <li>
                                <a href="/category/${category.parentCategory.id}/sub/${category.id}" title="${category.name}">
                                        ${category.name}
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                    <div class="clear"></div>
                </div>
            </div>
            <div class="block" id="module_listfields">
                <div class="fields_contener">
                    <h2>Tác giả</h2>
                    <div class="blockcontent">
                        <div class="showboxfield">
                            <ul>
                                <a href="/danh-muc/1/sach-kinh-te.html?field1=136" title="Nhiều tác giả">
                                    <li class="checkbox">
                                        <i class="fa fa-square-o"></i> Nhiều tác giả<span class="count">(34)</span>
                                        <span class="delete"></span>
                                    </li>
                                </a>
                                <a href="/danh-muc/1/sach-kinh-te.html?field1=268" title="Ivan R.Misner">
                                    <li class="checkbox">
                                        <i class="fa fa-square-o"></i> Ivan R.Misner<span class="count">(1)</span>
                                        <span class="delete"></span>
                                    </li>
                                </a>
                                <a href="/danh-muc/1/sach-kinh-te.html?field1=269" title="Michael Lewis">
                                    <li class="checkbox">
                                        <i class="fa fa-square-o"></i> Michael Lewis<span class="count">(2)</span>
                                        <span class="delete"></span>
                                    </li>
                                </a><a href="/danh-muc/1/sach-kinh-te.html?field1=270" title="Rodney Clark">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Rodney Clark<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=271" title="James B.Stewart">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> James B.Stewart<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=272" title="Brett King">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Brett King<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=275" title="Thomas Friedman">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Thomas Friedman<span class="count">(3)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=277" title="Miyamoto Musashi">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Miyamoto Musashi<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=278" title="Ji Pyeong Gil">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Ji Pyeong Gil<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=300" title="Benjamin Graham">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Benjamin Graham<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=340" title="Robert T.Kiyosaki">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Robert T.Kiyosaki<span class="count">(2)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=343" title="Keith Ferrazzi">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Keith Ferrazzi<span class="count">(2)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=344" title="Jim Collins">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Jim Collins<span class="count">(2)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=349" title="Dan Roam">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Dan Roam<span class="count">(2)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=350" title="Robert Greene">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Robert Greene<span class="count">(3)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=356" title="Howard Schultz">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Howard Schultz<span class="count">(2)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=358" title="Huỳnh Vĩnh Sơn">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Huỳnh Vĩnh Sơn<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=360" title="Sherryl Sandberg">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Sherryl Sandberg<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=365" title="James Rickards">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> James Rickards<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=375" title="Trung Đức">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Trung Đức<span class="count">(2)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=378" title="Max Sutherland">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Max Sutherland<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=379" title="Bob Tricker ">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Bob Tricker <span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=380" title="Michael E. Porter">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Michael E. Porter<span class="count">(3)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=382" title="Edar.H.Schein">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Edar.H.Schein<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=383" title="Eric Ries">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Eric Ries<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=384" title="Steven Gary Blank">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Steven Gary Blank<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=386" title="Bill George">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Bill George<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=388" title="Brad Feld">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Brad Feld<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=390" title="Napoleon Hill">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Napoleon Hill<span class="count">(5)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=392" title="Hòa Nhân">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Hòa Nhân<span class="count">(4)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=395" title="Sheena Iyengar">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Sheena Iyengar<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=396" title="Lê Trần Bảo Phương">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Lê Trần Bảo Phương<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=399" title="Rosser Reeves">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Rosser Reeves<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=400" title="Nan DeMars">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Nan DeMars<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=401" title="Gunter Pauli">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Gunter Pauli<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=402" title="David Ogilvy">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> David Ogilvy<span class="count">(2)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=403" title="Malcolm Gladwell ">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Malcolm Gladwell <span class="count">(3)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=404" title="Victor O. Schwab">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Victor O. Schwab<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=405" title="Joe Vitale ">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Joe Vitale <span class="count">(2)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=439" title="Tony Buzan">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Tony Buzan<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=454" title="Walter Isaacson">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Walter Isaacson<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=457" title="TS. Đinh Thị Thúy Hằng">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> TS. Đinh Thị Thúy Hằng<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=463" title="Philip A. Fisher">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Philip A. Fisher<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=464" title="Douglas B. Holt">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Douglas B. Holt<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=465" title="William Poundstone">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> William Poundstone<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=466" title="Tony Wagner">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Tony Wagner<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=480" title="Alfred P.Sloan, Jr">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Alfred P.Sloan, Jr<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=491" title="Peter Shaw">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Peter Shaw<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=492" title="Jill Geisler ">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Jill Geisler <span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field1=507" title="Tony Hsieh">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Tony Hsieh<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="fields_contener">
                    <h2>Thương hiệu</h2>
                    <div class="blockcontent">
                        <div class="showboxfield">
                            <ul>
                                <a href="/danh-muc/1/sach-kinh-te.html?field2=4" title="Thái Hà">
                                    <li class="checkbox">
                                        <i class="fa fa-square-o"></i> Thái Hà<span class="count">(20)</span>
                                        <span class="delete"></span>
                                    </li>
                                </a><a href="/danh-muc/1/sach-kinh-te.html?field2=6" title="Bách Việt">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Bách Việt<span class="count">(3)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field2=33" title="Alphabooks">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Alphabooks<span class="count">(86)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field2=34" title="Nhã Nam">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Nhã Nam<span class="count">(3)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field2=38" title="Văn Việt">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Văn Việt<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field2=45" title="Phương Nam">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Phương Nam<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field2=51" title="NXB Trẻ">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> NXB Trẻ<span class="count">(47)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field2=56" title="Minh Tâm">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Minh Tâm<span class="count">(2)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field2=58" title="First News - Trí Việt">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> First News - Trí Việt<span class="count">(3)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field2=59" title="Huy Hoàng">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Huy Hoàng<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field2=376" title="Dtbooks">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Dtbooks<span class="count">(28)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field2=397" title="Sức Mạnh Ngòi Bút">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Sức Mạnh Ngòi Bút<span class="count">(8)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field2=462" title="TGM">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> TGM<span class="count">(2)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field2=587" title="Hương Thủy">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Hương Thủy<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a><a href="/danh-muc/1/sach-kinh-te.html?field2=924" title="Ngòi Bút Việt">
                                <li class="checkbox">
                                    <i class="fa fa-square-o"></i> Ngòi Bút Việt<span class="count">(1)</span>
                                    <span class="delete"></span>
                                </li>
                            </a>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="sortable" id="layoutGroup4">
            <div class="block" id="module_listproducts">
                <h1>${tendanhmuc}</h1>
                <div class="intro"></div>
                <div class="clear"></div>
                <div class="pagesright">
                    <div class="views">
                        <a class="active fa fa-th-large" href="/danh-muc/1/sach-kinh-te.html?page=1"
                           title="Xem danh sách theo dạng lưới"></a>
                        <a class=" fa fa-th-list" href="/danh-muc/1/sach-kinh-te.html?page=1&view=1"
                           title="Xem theo dạng danh sách"></a>
                    </div>
                    <div class="sorts">
                        Xem theo: &nbsp;&nbsp;&nbsp;
                        <select onchange="setOrder(this);" id="order" name="item_order">
                            <option selected="selected" value="0">Mới trước cũ sau</option>
                            <option value="1">Cũ trước mới sau</option>
                            <option value="2">Giá thấp đến cao</option>
                            <option value="3">Giá cao đến thấp</option>
                            <option value="4">Bán chạy nhất</option>
                            <option value="5">Xem nhiều</option>
                            <option value="6">Ngày xuất bản</option>
                        </select>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
                <div class="blockcontent">
                    <c:forEach items="${listBook}" var="book">
                        <div class="product_contener">
                            <div class="products">
                                <div class="image">
                                    <a href="/product?bookid=${book.id}"
                                       title="${book.name}">
                                        <img src="/resources/${book.image}"
                                             alt="${book.name}"
                                             title="${book.name}"/>
                                    </a>
                                    <span class="saleprice">-${book.saleoff}%</span>
                                </div>
                                <div class="productname">
                                    <a href="/product?bookid=${book.id}"
                                       title="${book.name}">
                                            ${book.name}
                                    </a>
                                </div>
                                <div class="fields"></div>
                                <div class="prices">
                                    <fmt:formatNumber pattern="###,###" value="${book.priceNew}"/> ₫
                                </div>
                                <span class="rootprice">
                                <fmt:formatNumber pattern="###,###" value="${book.priceOld}"/> ₫
                            </span>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="clear">&nbsp;</div>
                <ul class="pagenav">
                    <li class="active"><span>1</span></li>
                    <li><a href='/danh-muc/1/sach-kinh-te.html?page=2'>2</a></li>
                    <li><a href='/danh-muc/1/sach-kinh-te.html?page=3'>3</a></li>
                    <li><a href='/danh-muc/1/sach-kinh-te.html?page=4'>4</a></li>
                    <li><a href='/danh-muc/1/sach-kinh-te.html?page=5'>5</a></li>
                    <li><a href='/danh-muc/1/sach-kinh-te.html?page=6'>6</a></li>
                    <li class="next"><a href="/danh-muc/1/sach-kinh-te.html?page=2">Trang sau <i
                            class="fa fa-chevron-right"></i></a></li>
                </ul>
                <div class="clear"></div>
                <script type="text/javascript">
                    function setOrder(ojb) {
                        url = '/danh-muc/1/sach-kinh-te.html';
                        order = ojb.value;
                        url = addQuery(url, 'ordering=' + order);
                        document.location.href = url;
                    }
                </script>
                <div class="clear"></div>
            </div>

        </div>
    </div>
    <div class="clear"></div>
    <div id="footer">
        <%@include file="component/footer.jsp" %>
    </div>
</div>
</body>