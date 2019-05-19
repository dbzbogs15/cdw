<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="component/header.jsp" %>
    <link href="/resources/admin/plugins/sweet-alert/sweetalert2.min.css" rel="stylesheet" type="text/css" />

</head>
<body>
<!-- Begin page -->
<div id="wrapper">

    <!-- Top Bar Start -->
    <%@include file="component/topbar.jsp" %>
    <!-- Top Bar End -->

    <!-- ========== Left Sidebar Start ========== -->
    <%@include file="component/leftsidebar.jsp" %>
    <!-- Left Sidebar End -->

    <!-- ============================================================== -->
    <!-- Start right Content here -->
    <!-- ============================================================== -->
    <div class="content-page">
        <!-- Start content -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box">
                            <h4 class="page-title float-left">Thêm sách</h4>

                            <ol class="breadcrumb float-right">
                                <li class="breadcrumb-item"><a href="#">NLU Book</a></li>
                                <li class="breadcrumb-item"><a href="/admin/book-manager">Quản lý sách</a></li>
                                <li class="breadcrumb-item active">Thêm sách</li>
                            </ol>

                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <!-- end row -->

                <div class="row">
                    <div class="col-12">
                        <div class="card-box">
                            <h4 class="m-t-0 header-title">Form</h4>
                            <div class="row">
                                <div class="col-12">
                                    <div class="p-20">
                                        <form action="/admin/book-manager/add-book" method="post"
                                              class="form-horizontal row"
                                              enctype="multipart/form-data"
                                              id="fileUpload"
                                              role="form">
                                            <div class="col-4">
                                                <div class="form-group row">
                                                    <div class="col-11">
                                                        <img id="myImg"
                                                             class="img-thumbnail"
                                                             src="https://www.vinabook.com/images/thumbnails/product/240x/331997_p86816mchuyenlinh.jpg"
                                                             style="width: 100%; height: 460px; margin-left: auto; margin-right: auto"
                                                        />
                                                        <div class="form-group row">
                                                            <div class="col-12">
                                                                <div class="custom-file">
                                                                    <input type="file"
                                                                           class="custom-file-input"
                                                                           name="image"
                                                                           required
                                                                           id="customFile">
                                                                    <label class="custom-file-label">
                                                                        Ảnh bìa sách
                                                                    </label>
                                                                    <ul class="parsley-errors-list filled"
                                                                        id="error_image"></ul>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-8">
                                                <div class="form-group row">
                                                    <label class="col-2 col-form-label">Tên sách</label>
                                                    <div class="col-10">
                                                        <input type="text" id="name" name="name" class="form-control"
                                                               placeholder="Tên sách">
                                                        <ul class="parsley-errors-list filled"
                                                            id="error_name"></ul>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-2 col-form-label">Tác giả</label>
                                                    <div class="col-10">
                                                        <input type="text" id="author" name="author"
                                                               class="form-control"
                                                               placeholder="Tác giả">
                                                        <ul class="parsley-errors-list filled"
                                                            id="error_author"></ul>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-2 col-form-label">Số lượng</label>
                                                    <div class="col-10">
                                                        <input type="number"
                                                               id="quantity"
                                                               class="form-control"
                                                               name="quantity"
                                                               placeholder="Số lượng">
                                                        <ul class="parsley-errors-list filled"
                                                            id="error_quantity"></ul>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-2 col-form-label">Giá gốc</label>
                                                    <div class="col-10">
                                                        <input type="number"
                                                               class="form-control"
                                                               name="priceOld"
                                                               id="priceOld"
                                                               placeholder="Giá gốc">
                                                        <ul class="parsley-errors-list filled"
                                                            id="error_priceOld"></ul>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-2 col-form-label">Khuyến mãi</label>
                                                    <div class="col-10">
                                                        <input type="number"
                                                               name="saleoff"
                                                               id="saleoff"
                                                               class="form-control"
                                                               placeholder="Khuyến mãi (phần trăm %)">
                                                        <ul class="parsley-errors-list filled"
                                                            id="error_saleoff"></ul>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-2 col-form-label">Giá mới</label>
                                                    <div class="col-10">
                                                        <input type="number"
                                                               class="form-control"
                                                               name="priceNew"
                                                               id="priceNew"
                                                               placeholder="Giá mới">
                                                        <ul class="parsley-errors-list filled"
                                                            id="error_priceNew"></ul>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-2 col-form-label">Số trang</label>
                                                    <div class="col-10">
                                                        <input type="number"
                                                               class="form-control"
                                                               name="number_page"
                                                               id="number_page"
                                                               placeholder="Số trang">
                                                        <ul class="parsley-errors-list filled"
                                                            id="error_number_page"></ul>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-2 col-form-label">Kích thước</label>
                                                    <div class="col-10">
                                                        <input name="size" type="text"
                                                               id="size"
                                                               class="form-control"
                                                               placeholder="Kích thước">
                                                        <ul class="parsley-errors-list filled"
                                                            id="error_size"></ul>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-2 col-form-label">Trọng lượng</label>
                                                    <div class="col-10">
                                                        <input type="number"
                                                               name="weight"
                                                               id="weight"
                                                               class="form-control"
                                                               placeholder="Trọng lượng">
                                                        <ul class="parsley-errors-list filled"
                                                            id="error_weight"></ul>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-2 col-form-label">Ngày phát hành</label>
                                                    <div class="col-10">
                                                        <input type="date"
                                                               id="published_date"
                                                               name="published_date"
                                                               class="form-control">
                                                        <ul class="parsley-errors-list filled"
                                                            id="error_published_date"></ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group row">
                                                    <label class="col-2 col-form-label">Danh mục cha</label>
                                                    <div class="col-10">
                                                        <select id="parent" class="form-control">
                                                            <option value="emt">--Danh mục cha--</option>
                                                            <c:forEach items="${parent}" var="item">
                                                                <option value="${item.id}">
                                                                        ${item.name}
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-2 col-form-label">Danh mục con</label>
                                                    <div class="col-10">
                                                        <select name="category_id" id="cate" class="form-control">
                                                            <option value="emt">--Danh mục con--</option>
                                                        </select>
                                                        <ul class="parsley-errors-list filled"
                                                            id="error_category_id"></ul>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-2 col-form-label">Nhà xuất bản</label>
                                                    <div class="col-10">
                                                        <select name="publisher_id"
                                                                id="publisher_id"
                                                                class="form-control">
                                                            <c:forEach items="${publisher}" var="item">
                                                                <option value="${item.id}">${item.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                        <ul class="parsley-errors-list filled"
                                                            id="error_publisher_id"></ul>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-2 col-form-label">Mô tả</label>
                                                    <div class="col-10">
                                                        <textarea name="description" id="elm1">
                                                        </textarea>
                                                        <ul class="parsley-errors-list filled"
                                                            id="error_description"></ul>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-2 col-form-label"></label>
                                                    <div class="col-10">
                                                        <button type="button" id="sendData" class="btn btn-primary">
                                                            <i class="fa fa-save"></i> Thêm sách
                                                        </button>
                                                        <a class="btn btn-danger" href="/admin/book-manager">
                                                            <i class="fa fa-angle-double-left"></i> Quay lại
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- end row -->
                        </div> <!-- end card-box -->
                    </div><!-- end col -->
                </div>
            </div> <!-- container -->
        </div> <!-- content -->
        <footer class="footer text-right">
            2017 - 2018 © Abstack. - Coderthemes.com
        </footer>
    </div>
    <!-- ============================================================== -->
    <!-- End Right content here -->
    <!-- ============================================================== -->
</div>
<!-- jQuery  -->
<script src="/resources/admin/assets/js/jquery.min.js"></script>
<script src="/resources/admin/assets/js/popper.min.js"></script>
<script src="/resources/admin/assets/js/bootstrap.min.js"></script>
<script src="/resources/admin/assets/js/metisMenu.min.js"></script>
<script src="/resources/admin/assets/js/waves.js"></script>
<script src="/resources/admin/assets/js/jquery.slimscroll.js"></script>

<script src="/resources/admin/plugins/waypoints/lib/jquery.waypoints.min.js"></script>
<script src="/resources/admin/plugins/counterup/jquery.counterup.min.js"></script>

<!-- App js -->
<script src="/resources/admin/assets/js/jquery.core.js"></script>
<script src="/resources/admin/assets/js/jquery.app.js"></script>

<!--Wysiwig js-->
<script src="/resources/admin/plugins/tinymce/tinymce.min.js"></script>
<!-- Sweet Alert Js  -->
<script src="/resources/admin/plugins/sweet-alert/sweetalert2.min.js"></script>
<script src="/resources/admin/assets/pages/jquery.sweet-alert.init.js"></script>
<script>
    $(function () {
        $(":file").change(function () {
            if (this.files && this.files[0]) {
                var reader = new FileReader();
                reader.onload = imageIsLoaded;
                reader.readAsDataURL(this.files[0]);
            }
        });
    });

    function imageIsLoaded(e) {
        $('#myImg').attr('src', e.target.result);
    };
</script>
<script type="text/javascript">
    $(document).ready(function () {
        if ($("#elm1").length > 0) {
            tinymce.init({
                selector: "textarea#elm1",
                theme: "modern",
                height: 300,
                plugins: [
                    "advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
                    "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
                    "save table contextmenu directionality emoticons template paste textcolor"
                ],
                toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | l      ink image | print preview media fullpage | forecolor backcolor emoticons",
                style_formats: [
                    {title: 'Bold text', inline: 'b'},
                    {title: 'Red text', inline: 'span', styles: {color: '#ff0000'}},
                    {title: 'Red header', block: 'h1', styles: {color: '#ff0000'}},
                    {title: 'Example 1', inline: 'span', classes: 'example1'},
                    {title: 'Example 2', inline: 'span', classes: 'example2'},
                    {title: 'Table styles'},
                    {title: 'Table row 1', selector: 'tr', classes: 'tablerow1'}
                ]
            });
        }
    });
</script>
<script>
    $(document).ready(function () {
        // Add the following code if you want the name of the file appear on select
        $(".custom-file-input").on("change", function () {
            var fileName = $(this).val().split("\\").pop();
            $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
        });
        $('#parent').change(function () {
            var parentid = $('#parent').val();
            if (parentid === 'emt') {
                $('#cate').empty()
                    .append(
                        '<option selected="selected" value="test">--Danh mục con--</option>'
                    )
                return;
            }
            $.ajax({
                url: '/api/categories',
                type: 'GET',
                data: {
                    parentid: parentid
                },
                async: true,
                success: function (result) {
                    $('#cate').empty();
                    $.each(result, function (index, item) {
                        $('#cate').append(
                            '<option value="' + item.id + '">' + item.name + '</option>'
                        )
                    })
                }
            })
        })
    })
</script>
<script>
    $(document).ready(function () {
        var forms = new FormData();
        $('#customFile').change(function (event) {
            if ($('#customFile').val().length > 0) {
                file = event.target.files[0];
                forms.set('image', file);
            }
        })
        $('#sendData ').click(function () {
            if ($('#customFile').val().length > 0) {
                var name = $('#name').val();
                var author = $('#author').val();
                var quantity = $('#quantity').val();
                var priceNew = $('#priceNew').val();
                var saleoff = $('#saleoff').val();
                var priceOld = $('#priceOld').val();
                var number_page = $('#number_page').val();
                var size = $('#size').val();
                var weight = $('#weight').val();
                var category_id = $('#cate').val();
                var published_date = $('#published_date').val();
                var publisher_id = $('#publisher_id').val();
                var description = tinyMCE.get('elm1').getContent();
                forms.set("name", name);
                forms.set("author", author);
                forms.set("quantity", quantity);
                forms.set("priceNew", priceNew);
                forms.set("priceOld", priceOld);
                forms.set("number_page", number_page);
                forms.set("size", size);
                forms.set("weight", weight);
                forms.set("category_id", category_id);
                forms.set("published_date", published_date);
                forms.set("publisher_id", publisher_id);
                forms.set("description", description);
                forms.set("saleoff", saleoff);
                $.ajax({
                    url: '/admin/book-manager/add-book',
                    type: 'POST',
                    data: forms,
                    processData: false,
                    contentType: false,
                    enctype: "multipart/form-data",
                    success: function (result) {
                        if (result.none == null) {
                            if (result.name) {
                                $('#error_name').empty().html(
                                    '<li class="parsley-required">' + result.name + '</li>'
                                );
                            } else {
                                $('#error_name').empty();
                            }
                            if (result.author) {
                                $('#error_author').empty().html(
                                    '<li class="parsley-required">' + result.author + '</li>'
                                );
                            } else {
                                $('#error_author').empty();
                            }
                            if (result.priceNew) {
                                $('#error_priceNew').empty().html(
                                    '<li class="parsley-required">' + result.priceNew + '</li>'
                                );
                            } else {
                                $('#error_priceNew').empty();
                            }
                            if (result.priceOld) {
                                $('#error_priceOld').empty().html(
                                    '<li class="parsley-required">' + result.priceOld + '</li>'
                                );
                            } else {
                                $('#error_priceOld').empty();
                            }
                            if (result.description) {
                                $('#error_description').empty().html(
                                    '<li class="parsley-required">' + result.description + '</li>'
                                );
                            } else {
                                $('#error_description').empty();
                            }
                            if (result.quantity) {
                                $('#error_quantity').empty().html(
                                    '<li class="parsley-required">' + result.quantity + '</li>'
                                );
                            } else {
                                $('#error_quantity').empty();
                            }
                            if (result.size) {
                                $('#error_size').empty().html(
                                    '<li class="parsley-required">' + result.size + '</li>'
                                );
                            } else {
                                $('#error_size').empty();
                            }
                            if (result.weight) {
                                $('#error_weight').empty().html(
                                    '<li class="parsley-required">' + result.weight + '</li>'
                                );
                            } else {
                                $('#error_weight').empty();
                            }
                            if (result.category_id) {
                                $('#error_category_id').empty().html(
                                    '<li class="parsley-required">' + result.category_id + '</li>'
                                );
                            } else {
                                $('#error_category_id').empty();
                            }
                            if (result.published_date) {
                                $('#error_published_date').empty().html(
                                    '<li class="parsley-required">' + result.published_date + '</li>'
                                );
                            } else {
                                $('#error_published_date').empty();
                            }
                            if (result.saleoff) {
                                $('#error_saleoff').empty().html(
                                    '<li class="parsley-required">' + result.saleoff + '</li>'
                                );
                            } else {
                                $('#error_saleoff').empty();
                            }
                            if (result.number_page) {
                                $('#error_number_page').empty().html(
                                    '<li class="parsley-required">' + result.number_page + '</li>'
                                );
                            } else {
                                $('#error_number_page').empty();
                            }
                            if (result.image) {
                                $('#error_image').empty().html(
                                    '<li class="parsley-required">' + result.image + '</li>'
                                );
                            } else {
                                $('#error_image').empty();
                            }
                        } else {
                            console.log("abc");
                            window.location.replace("/admin/book-manager/success")
                        }
                    }
                })
            } else {
                swal({
                    title: 'Vui lòng chọn hình ảnh'
                })
            }
        })
    })
</script>
</body>
</html>