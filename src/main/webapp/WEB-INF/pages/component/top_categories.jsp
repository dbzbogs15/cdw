<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<h2>
    <a class="title" href="#" title="Danh mục">Danh mục<span
            class="b-main__category-arrow"></span></a>
    <a class="more" href="#" title="Xem tất cả">Xem tất cả</a>
</h2>
<div class="blockcontent">
    <div id="topCate" style="position:relative; padding:0; overflow:hidden; margin-left:-4%">
    </div>
</div>
<script>
    $.ajax({
        url: '/loadCategory',
        dataType: 'json',
        success: function (result) {
            $.each(result, function (index, data) {
                $('#topCate').append(
                    '<div class="category_contener">' +
                        '<div class="categories">' +
                            '<div class="image">' +
                                '<a href="/category/'+data.id+'" title="'+data.name+'">' +
                                    '<img src="'+data.image+'" alt="'+data.name+'" title="'+data.name+'"/>' +
                                '</a>' +
                            '</div>' +
                            '<div class="catname">' +
                                '<a href="/category'+data.id+'" title="'+data.name+'">'+data.name+'</a>' +
                            '</div>' +
                        '</div>' +
                    '</div>'
                )
            })
            $('#topCate').append('<div class="clear"></div>');
        }
    })
</script>
<div class="clear"></div>