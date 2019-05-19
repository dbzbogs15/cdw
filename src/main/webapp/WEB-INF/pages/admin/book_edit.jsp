<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="component/header.jsp" %>
    <link href="/resources/admin/plugins/sweet-alert/sweetalert2.min.css" rel="stylesheet" type="text/css"/>
    <style>
        .parsley-errors-list {
            color: red;
        }
    </style>
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
                            <h4 class="page-title float-left">Cập nhật sách</h4>

                            <ol class="breadcrumb float-right">
                                <li class="breadcrumb-item"><a href="#">NLU Book</a></li>
                                <li class="breadcrumb-item"><a href="/admin/book-manager">Quản lý sách</a></li>
                                <li class="breadcrumb-item active">Cập nhật sách</li>
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
                                        <%--@elvariable id="book" type="com.book.model.Book"--%>
                                        <form:form action="/admin/book-manager/edit-book" method="post"
                                                   modelAttribute="book"
                                                   class="form-horizontal row"
                                                   enctype="multipart/form-data"
                                                   id="fileUpload"
                                                   role="form">
                                            <div class="col-4">
                                                <div class="form-group row">
                                                    <div class="col-11">
                                                        <img id="myImg"
                                                             class="img-thumbnail"
                                                             src="/${book.image}"
                                                             style="width: 100%; height: 460px; margin-left: auto; margin-right: auto"
                                                        />
                                                        <div class="form-group row">
                                                            <div class="col-12">
                                                                <div class="custom-file">
                                                                    <input type="file"
                                                                           class="custom-file-input"
                                                                           name="customFile"
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
                                                        <form:input path="id" type="hidden"/>
                                                        <form:input type="text"
                                                                    path="name"
                                                                    class="form-control"
                                                                    placeholder="Tên sách"/>
                                                        <form:errors path="name" cssClass="parsley-errors-list"/>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-2 col-form-label">Tác giả</label>
                                                    <div class="col-10">
                                                        <form:input type="text"
                                                                    path="author"
                                                                    class="form-control"
                                                                    placeholder="Tác giả"/>
                                                        <form:errors path="author" cssClass="parsley-errors-list"/>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-2 col-form-label">Số lượng</label>
                                                    <div class="col-10">
                                                        <form:input type="text"
                                                                    class="form-control"
                                                                    path="quantity"
                                                                    placeholder="Số lượng"/>
                                                        <form:errors path="quantity" cssClass="parsley-errors-list"/>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-2 col-form-label">Giá gốc</label>
                                                    <div class="col-10">
                                                        <form:input type="text"
                                                                    class="form-control"
                                                                    path="priceOld"
                                                                    placeholder="Giá gốc"/>
                                                        <form:errors cssClass="parsley-errors-list" path="priceOld"/>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-2 col-form-label">Khuyến mãi</label>
                                                    <div class="col-10">
                                                        <form:input type="text"
                                                                    path="saleoff"
                                                                    class="form-control"
                                                                    placeholder="Khuyến mãi (phần trăm %)"/>
                                                        <form:errors path="saleoff" cssClass="parsley-errors-list"/>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-2 col-form-label">Giá mới</label>
                                                    <div class="col-10">
                                                        <form:input type="text"
                                                                    class="form-control"
                                                                    path="priceNew"
                                                                    placeholder="Giá mới"/>
                                                        <form:errors path="priceNew" cssClass="parsley-errors-list"/>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-2 col-form-label">Số trang</label>
                                                    <div class="col-10">
                                                        <form:input type="number"
                                                                    class="form-control"
                                                                    path="numberPage"
                                                                    placeholder="Số trang"/>
                                                        <form:errors path="numberPage" cssClass="parsley-errors-list"/>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-2 col-form-label">Kích thước</label>
                                                    <div class="col-10">
                                                        <form:input
                                                                path="size"
                                                                type="text"
                                                                class="form-control"
                                                                placeholder="Kích thước"/>
                                                        <form:errors path="size" cssClass="parsley-errors-list"/>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-2 col-form-label">Trọng lượng</label>
                                                    <div class="col-10">
                                                        <form:input type="number"
                                                                    path="weight"
                                                                    class="form-control"
                                                                    placeholder="Trọng lượng"/>
                                                        <form:errors cssClass="parsley-errors-list" path="weight"/>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-2 col-form-label">Ngày phát hành</label>
                                                    <div class="col-10">
                                                        <form:input type="text"
                                                                    path="publishedDate"
                                                                    class="form-control"/>
                                                        <form:errors path="publishedDate"
                                                                     cssClass="parsley-errors-list"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group row">
                                                    <label class="col-2 col-form-label">Danh mục cha</label>
                                                    <div class="col-10">
                                                        <select id="parent" class="form-control">
                                                            <c:forEach items="${parent}" var="item">
                                                                <option <c:if test="${item.id == book.category.parentId}">selected</c:if> value="${item.id}">
                                                                        ${item.name}
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-2 col-form-label">Danh mục con</label>
                                                    <div class="col-10">
                                                        <form:select
                                                                path="categoryId"
                                                                class="form-control">
                                                            <c:forEach items="${categories}" var="item">
                                                                <option <c:if test="${item.id == book.categoryId}">selected</c:if> value="${item.id}">${item.name}</option>
                                                            </c:forEach>
                                                        </form:select>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-2 col-form-label">Nhà xuất bản</label>
                                                    <div class="col-10">
                                                        <form:select
                                                                path="publisherId"
                                                                class="form-control">
                                                            <c:forEach items="${publisher}" var="item">
                                                                <option <c:if test="${item.id == book.publisherId}">selected</c:if>
                                                                        value="${item.id}">${item.name}</option>
                                                            </c:forEach>
                                                        </form:select>
                                                        <form:errors path="publisherId" cssClass="parsley-errors-list"/>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-2 col-form-label">Mô tả</label>
                                                    <div class="col-10">
                                                        <form:textarea path="description"></form:textarea>
                                                        <form:errors path="description" cssClass="parsley-errors-list"/>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-2 col-form-label"></label>
                                                    <div class="col-10">
                                                        <button type="submit" id="sendData" class="btn btn-primary">
                                                            <i class="fa fa-save"></i> Cập nhật
                                                        </button>
                                                        <a class="btn btn-danger" href="/admin/book-manager">
                                                            <i class="fa fa-angle-double-left"></i> Quay lại
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </form:form>
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
<script src="/resources/js/dist/jquery.validate.js"></script>
<script src="/resources/js/dist/additional-methods.js"></script>
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
        if ($("#description").length > 0) {
            tinymce.init({
                selector: "textarea#description",
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
                $('#categoryId').empty()
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
                    $('#categoryId').empty();
                    $.each(result, function (index, item) {
                        $('#categoryId').append(
                            '<option value="' + item.id + '">' + item.name + '</option>'
                        )
                    })
                }
            })
        })
        $('#fileUpload').validate({
            errorClass: 'parsley-errors-list',
            rules: {
                // customFile: {
                //     required: true,
                //     accept: 'image/*'
                // },
                name: "required",
                author: "required",
                saleoff: {
                    required: true,
                    digits: true,
                    min: 1
                },
                priceNew: {
                    required: true,
                    digits: true,
                    min: 1
                },
                priceOld: {
                    required: true,
                    digits: true,
                    min: 1
                },
                quantity: {
                    required: true,
                    digits: true,
                    min: 1
                },
                numberPage: {
                    required: true,
                    digits: true,
                    min: 1
                },
                size: {
                    required: true
                },
                weight: {
                    required: true,
                    digits: true,
                    min: 1
                },
                categoryId: "required",
                publishedDate: {
                    required: true,
                    vnDate: true
                },
                description: "required"
            },
            messages: {
                customFile: {
                    required: "Vui lòng chọn ảnh",
                    accept: 'File không đúng định dạng ảnh'
                },
                name: "Vui lòng nhập tên sách",
                author: "Vui lòng nhập tên tác giả",
                saleoff: {
                    required: 'Vui lòng nhập vào khuyến mãi',
                    digits: 'Dữ liệu không hợp lệ',
                    min: 'Dữ liệu không hợp lệ'
                },
                priceOld: {
                    required: 'Vui lòng nhập giá sản phẩm',
                    digits: 'Giá sản phẩm không hợp lệ',
                    min: 'Giá sản phẩm không hợp lệ'
                },
                priceNew: {
                    required: 'Vui lòng nhập giá sản phẩm',
                    digits: 'Giá sản phẩm không hợp lệ',
                    min: 'Giá sản phẩm không hợp lệ'
                },
                quantity: {
                    required: 'Vui lòng nhập số lượng',
                    digits: 'Số lượng sản phẩm không hợp lệ',
                    min: 'Số lượng sản phẩm không hợp lệ'
                },
                numberPage: {
                    required: 'Vui lòng nhập số trang',
                    digits: 'Số trang sản phẩm không hợp lệ',
                    min: 'Số trang sản phẩm không hợp lệ'
                },
                categoryId: 'Vui lòng chọn danh mục sách',
                size: 'Vui lòng nhập kích thước',
                weight: {
                    required: 'Vui lòng nhập trọng lượng sách',
                    number: 'Khối lượng sản phẩm không hợp lệ',
                    min: 'Khối lượng sản phẩm không hợp lệ'
                },
                publishedDate: {
                    required: 'Vui lòng nhập ngày phát hành',
                }
            }
        })
        $.validator.addMethod("vnDate", function (value, element) {
            return value.match(/^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/);
        }, 'Ngày sinh vui lòng nhập đúng định dạng, ví 12/02/1997');
    })
</script>
</body>
</html>