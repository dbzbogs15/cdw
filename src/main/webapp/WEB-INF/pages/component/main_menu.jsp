<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="mainmenu_contener">
    <div class="mainmenu">
        <span class="while"></span>
        <span>
            <h2>
                <i class="fa fa-bars"></i>Danh mục sản phẩm
            </h2>
        </span>
        <ul class="submenu0" id="submenu0">
            <li class="group">
                <a href="javascript:" class="havechild" 4>
                    Nổi bật
                </a>
                <ul class="submenu1" id="submenu1">
                    <li>
                        <a href="/sach-ban-chay.html" target="_self">
                            Sách bán chạy
                        </a>
                    </li>
                    <li>
                        <a href="/sach-moi.html" target="_self">
                            Sách mới
                        </a>
                    </li>
                    <li>
                        <a href="/sach-sap-phat-hanh.html" target="_self">
                            Sắp phát hành
                        </a>
                    </li>
                    <li>
                        <a href="/sach-giam-gia.html" target="_self">
                            Sách giảm giá
                        </a>
                    </li>
                </ul>
            </li>

            <c:forEach var="parent" items="${parent}">
                <li
                    <c:if test="${book ne null}">
                        <c:if test="${book.category.parentCategory.id == parent.id}">
                            class="active"
                        </c:if>
                    </c:if>
                >
                    <a href="/category/${parent.id}" class="havechild" 8 target="_self">
                            ${parent.name}
                    </a>
                    <ul class="submenu1" id="submenu1">
                        <c:forEach var="cate" items="${parent.categories}">
                            <li>
                                <a href="/category/${parent.id}/sub/${cate.id}/" target="_self">
                                        ${cate.name}
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </li>
            </c:forEach>

            <li class="-bold"><a href="/Cong-ty-phat-hanh.html" class="havechild" 0 target="_self">Công
                ty phát hành</a>
                <ul class="submenubig" id="submenu1" style="columns: 2">
                    <li class="-bold"><a href="/thuong-hieu/4/thai-ha.html">Thái Hà</a></li>
                    <li class="-bold"><a href="/thuong-hieu/6/bach-viet.html">Bách Việt</a></li>
                    <li class="-bold"><a href="/thuong-hieu/33/alphabooks.html">Alphabooks</a></li>
                    <li class="-bold"><a href="/thuong-hieu/34/nha-nam.html">Nhã Nam</a></li>
                    <li class="-bold"><a href="/thuong-hieu/35/owlbooks.html">Owlbooks</a></li>
                    <li class="-bold"><a href="/thuong-hieu/36/cam-phong.html">Cẩm Phong</a></li>
                    <li class="-bold"><a href="/thuong-hieu/37/quang-van.html">Quảng Văn</a></li>
                    <li class="-bold"><a href="/thuong-hieu/38/van-viet.html">Văn Việt</a></li>
                    <li class="-bold"><a href="/thuong-hieu/39/limbooks.html">Limbooks</a></li>
                    <li class="-bold"><a href="/thuong-hieu/40/skybooks.html">Skybooks</a></li>
                    <li class="-bold"><a href="/thuong-hieu/41/asbooks.html">Asbooks</a></li>
                    <li class="-bold"><a href="/thuong-hieu/42/amak.html">Amak</a></li>
                    <li class="-bold"><a href="/thuong-hieu/43/dinh-ti.html">Đinh Tị</a></li>
                    <li class="-bold"><a href="/thuong-hieu/44/pavicobooks.html">Pavicobooks</a></li>
                    <li class="-bold"><a href="/thuong-hieu/45/phuong-nam.html">Phương Nam</a></li>
                    <li class="-bold"><a href="/thuong-hieu/46/dong-a.html">Đông A</a></li>
                    <li class="-bold"><a href="/thuong-hieu/47/van-lang.html">Văn Lang</a></li>
                    <li class="-bold"><a href="/thuong-hieu/48/nguoi-tre-viet.html">Người Trẻ Việt</a>
                    </li>
                    <li class="-bold"><a href="/thuong-hieu/49/lantabra.html">Lantabra</a></li>
                    <li class="-bold"><a href="/thuong-hieu/50/nxb-kim-dong.html">NXB Kim Đồng</a></li>
                    <li class="-bold"><a href="/thuong-hieu/51/nxb-tre.html">NXB Trẻ</a></li>
                    <li class="publishmore"><a href="/Cong-ty-phat-hanh.html">Tất cả công ty phát
                        hành</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div class="hotline">
        <div class="block " id="content_SupportOnline">
            <div class="blockcontent">
                <div>
                    <strong><span style="color:#000000;"><span
                            style="font-size:14px;">Hotline:&nbsp;</span></span></strong><span
                        style="color:#ff0000;"><b
                        style="box-sizing: border-box; color: rgb(0, 204, 102); font-family: Verdana, Arial, Helvetica, sans-serif;">0938 424 289</b></span>
                </div>
            </div>
        </div>
    </div>
</div>