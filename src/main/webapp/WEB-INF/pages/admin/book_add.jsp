<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="component/header.jsp" %>

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
                                        <form class="form-horizontal" role="form">
                                            <div class="form-group row">
                                                <label class="col-2 col-form-label"></label>
                                                <div class="col-10">
                                                    <img id="myImg"
                                                         class="img-thumbnail"
                                                         src="https://www.vinabook.com/images/thumbnails/product/240x/331997_p86816mchuyenlinh.jpg"
                                                         style="width: 15%; height: 200px; margin-left: auto; margin-right: auto"
                                                    />
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-2 col-form-label">Ảnh sách</label>
                                                <div class="col-10">
                                                    <input type="file" class="form-control">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-2 col-form-label">Tên sách</label>
                                                <div class="col-10">
                                                    <input type="text" class="form-control" placeholder="Tên sách">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-2 col-form-label">Tác giả</label>
                                                <div class="col-10">
                                                    <input type="text" name="example-email" class="form-control"
                                                           placeholder="Tác giả">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-2 col-form-label">Số lượng</label>
                                                <div class="col-10">
                                                    <input type="text" class="form-control" placeholder="Số lượng">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-2 col-form-label">Giá gốc</label>
                                                <div class="col-10">
                                                    <input type="text" class="form-control" placeholder="Giá gốc">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-2 col-form-label">Khuyến mãi</label>
                                                <div class="col-10">
                                                    <input type="text" class="form-control"
                                                           placeholder="Khuyến mãi (phần trăm %)">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-2 col-form-label">Giá mới</label>
                                                <div class="col-10">
                                                    <input type="text" class="form-control" placeholder="Giá mới">
                                                </div>
                                            </div>
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
                                                    <select id="cate" class="form-control">
                                                        <option>--Danh mục con--</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-2 col-form-label">Nhà xuất bản</label>
                                                <div class="col-10">
                                                    <select class="form-control">
                                                        <c:forEach items="${publisher}" var="item">
                                                            <option value="${item.id}">${item.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-2 col-form-label">Mô tả</label>
                                                <div class="col-10">
                                                    <textarea id="elm1" name="area"></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-2 col-form-label"></label>
                                                <div class="col-10">
                                                    <button type="submit"
                                                            class="btn btn-primary">
                                                        <i class="fa fa-save"></i> Thêm sách
                                                    </button>
                                                    <a class="btn btn-danger" href="/admin/book-manager">
                                                        <i class="fa fa-angle-double-left"></i> Quay lại
                                                    </a>
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

</body>
</html>