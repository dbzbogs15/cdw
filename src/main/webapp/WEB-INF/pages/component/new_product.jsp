<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<h2>
    <a class="title" href="/sach-moi.html" title="Sách mới">Sách mới<span
            class="b-main__category-arrow"></span></a>
    <a class="more" href="/sach-moi.html" title="Xem tất cả">Xem tất cả</a>
</h2>
<div class="blockcontent">
    <div style="position:relative; padding:0 20px; overflow:hidden; height:340px;">
        <div id="ajaxncontainer">
            <c:forEach var="newBook" items="${newBook}">
                <div class="product_contener">
                    <div class="products">
                        <div class="image">
                            <a href="/product?bookid=${newBook.id}"
                               title="${newBook.name}">
                                <img src="/resources/${newBook.image}"
                                     alt="${newBook.name}"
                                     title="${newBook.name}"/>
                            </a>
                            <span class="saleprice">-${newBook.saleoff}%</span>
                        </div>
                        <div class="productname">
                            <a href="/product?bookid=${newBook.id}"
                               title="${newBook.name}">
                                    ${newBook.name}
                            </a>
                        </div>
                        <div class="fields">
                                        <span>
                                        <a href="/product?bookid=${newBook.id}"
                                           title="${newBook.author}">${newBook.author}
                                        </a>
                                        </span>
                        </div>

                        <div class="prices">${newBook.priceNew} ₫</div>
                        <div class="rootprice">${newBook.priceOld} ₫</div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="clear"></div>
        <div class="list_btn">
            <a onclick="showproduct(-1);" id="prevn" class="prev" href="javascript:"><i
                    class="fa fa-chevron-left"></i></a>
            <a onclick="showproduct(1);" id="nextn" class="next" href="javascript:"><i
                    class="fa fa-chevron-right"></i></a>
        </div>
    </div>
</div>
<div class="clear"></div>
<script>
    var pagen = 1;
    var countn = 4;
    $("#prevn").addClass("disable");
    if (countn <= 1) $("#nextn").addClass("ndisable");

    function showproduct(step) {
        if ((pagen == 1 && step == -1) || (pagen == countn && step == 1)) return;

        pagen = pagen + step;
        if (pagen < 1) {
            pagen = 1;
        }

        if (pagen == 1) {
            $("#prevn").addClass("disable");
        } else {
            $("#prevn").removeClass("disable");
        }

        if (pagen == countn || pagen > countn) {
            $("#nextn").addClass("ndisable");
        } else {
            $("#nextn").removeClass("ndisable");
        }

        address = '/api/newbook';
        address = addQuery(address, 'page=' + pagen);
        $.ajax({
            url: address,
            dataType: "json",
            type: "GET",
            cache: false,
            error: function (e) {
                Boxy.alert('Lỗi ajax', null, {title: 'Lỗi'});
                return false;
            },
            success: function (result) {
                $("#ajaxncontainer").empty();
                //render sách mới
                $.each(result, function (index, data) {
                    $("#ajaxncontainer").append(
                        '<div class="product_contener">' +
                        '<div class="products hide">' +
                        '<div class="image">' +
                        '<a href="/product?bookid='+data.id+'" title="' + data.name + '">' +
                        '<img src="/resources/' + data.image + '" alt="' + data.name + '" title="' + data.name + '" />' +
                        '</a>' +
                        '<span class="saleprice">-' + data.saleoff + '%</span>' +
                        '</div>' +
                        '<div class="productname">' +
                        '<a href="" title="' + data.name + '">' + data.name + '</a>' +
                        '</div>' +
                        '<div class="fields">' +
                        '<span><a href="" title="' + data.author + '">' + data.author + '</a></span>' +
                        '</div>' +
                        '<div class="prices">' + data.priceNew + ' ₫</div>' +
                        '<span class="rootprice">' + data.priceOld + ' ₫</span>' +
                        '</div>' +
                        '</div>'
                    );
                })
                i = 0;
                if (step == 1) {
                    $(".hide").each(function () {
                        $(this).delay(50 * i).fadeIn(100);
                        i++;
                    });
                } else {
                    $($(".hide").get().reverse()).each(function () {
                        $(this).delay(50 * i).fadeIn(100);
                        i++;
                    });
                }
                return true;
            }
        });
    }
</script>