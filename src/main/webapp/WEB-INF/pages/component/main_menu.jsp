<%@ page
        language="java"
        contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8" %>
<div class="mainmenu_contener">
    <div class="mainmenu">
        <span class="while"></span>
        <span>
            <h2>
                <i class="fa fa-bars"></i>Danh mục sản phẩm
            </h2>
        </span>
        <ul class="submenu0"
            id="submenu0">
            <li class="group">
                <a href="javascript:" class="havechild">Nổi bật
                </a>
                <ul class="submenu1" id="submenu1">
                    <li>
                        <a href="/category/bestseller" target="_self">Sách bán chạy</a>
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
        </ul>
    </div>
    <div class="hotline">
        <div class="block "
             id="content_SupportOnline">
            <div class="blockcontent">
                <div>
                    <strong><span
                            style="color:#000000;"><span
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
                        '<a href="/category/' + parentCategory.id + '" class="havechild" target="_self">' +
                        '' + parentCategory.name + '' +
                        '</a>' +
                        '<ul class="submenu1" id="submenu1">'

                    $.each(parentCategory.categories, function (index, category) {
                        html +=
                            '<li>' +
                            '<a href="/category/' + parentCategory.id + '/sub/' + category.id + '/" target="_self">' +
                            '' + category.name + '' +
                            '</a>' +
                            '</li>'

                    })
                    html += '</ul></li>';
                    $('#loadCategory').append(html)
                })
            }
        })
    </script>
</div>