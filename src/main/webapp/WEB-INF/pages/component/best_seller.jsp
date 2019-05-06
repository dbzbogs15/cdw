<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<h2>
    <a class="title" href="/sach-ban-chay.html" title="Sách bán chạy">Sách bán chạy<span
            class="b-main__category-arrow"></span></a>
    <a class="more" href="/sach-ban-chay.html" title="Xem tất cả">Xem tất cả</a>
</h2>
<div class="blockcontent">
    <div style="position:relative; padding:0 20px; overflow:hidden; height:340px">
        <div id="bajaxcontainer">
            <c:forEach var="book" items="${bestSeller}">
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
                        <div class="fields">
                                        <span>
                                        <a href="/product?bookid=${book.id}"
                                           title="${book.author}">${book.author}
                                        </a>
                                        </span>
                        </div>

                        <div class="prices">${book.priceNew} ₫</div>
                        <div class="rootprice">${book.priceOld} ₫</div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="clear"></div>
        <div class="list_btn">
            <a onclick="bestproduct(-1);" class="prev" id="bprev" href="javascript:"><i
                    class="fa fa-chevron-left"></i></a>
            <a onclick="bestproduct(1);" class="next" id="bnext" href="javascript:"><i
                    class="fa fa-chevron-right"></i></a>
        </div>
    </div>
</div>
<div class="clear"></div>
<script>
    var pageb = 1;
    var countb = 4;
    $("#bprev").addClass("disable");
    if (countb <= 1) $("#bnext").addClass("ndisable");

    function bestproduct(step) {
        if ((pageb == 1 && step == -1) || (pageb == countb && step == 1)) return;

        pageb = pageb + step;
        if (pageb < 1) {
            pageb = 1;
        }

        if (pageb == 1) {
            $("#bprev").addClass("disable");
        } else {
            $("#bprev").removeClass("disable");
        }

        if (pageb == countb || pageb > countb) {
            $("#bnext").addClass("ndisable");
        } else {
            $("#bnext").removeClass("ndisable");
        }

        address = '/api/bestseller';
        address = addQuery(address, 'page=' + pageb);
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
                console.log(result)
                $("#bajaxcontainer").empty();
                $.each(result, function (index, data) {
                    console.log(data)
                    $("#bajaxcontainer").append(
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