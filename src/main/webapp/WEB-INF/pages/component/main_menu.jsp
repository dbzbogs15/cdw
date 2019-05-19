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
                        <a href="/category/bestseller" target="_self">
                            Sách bán chạy
                        </a>
                    </li>
                    <li>
                        <a href="/category/newbook" target="_self">
                            Sách mới
                        </a>
                    </li>
                </ul>
            </li>
            <div id="loadCategory">
            </div>
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
    <script>
        $.ajax({
            url: '/loadCategory',
            dataType: 'json',
            success: function (parentCategories) {
                var html = '';
                $.each(parentCategories, function (index, parentCategory) {
                        html =
                        '<li>' +
                            '<a href="/category/'+parentCategory.id+'" class="havechild" target="_self">' +
                                ''+parentCategory.name+'' +
                            '</a>' +
                            '<ul class="submenu1" id="submenu1">'

                    $.each(parentCategory.categories, function (index, category) {
                        html +=
                            '<li>' +
                                '<a href="/category/'+parentCategory.id+'/sub/'+category.id+'/" target="_self">' +
                                    ''+category.name+'' +
                                '</a>' +
                            '</li>'

                    })
                    html +=
                        '</ul></li>';
                    $('#loadCategory').append(html)
                })
            }
        })
    </script>
</div>