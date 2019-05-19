<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="component/header.jsp" %>
    <!-- DataTables -->
    <link href="/resources/admin/plugins/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
    <link href="/resources/admin/plugins/datatables/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
    <!-- Responsive datatable examples -->
    <link href="/resources/admin/plugins/datatables/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
    <link href="/resources/admin/plugins/sweet-alert/sweetalert2.min.css" rel="stylesheet" type="text/css"/>
    <style>
        .table > tbody > tr > td {
            padding: 6px 5px;
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
                            <h4 class="page-title float-left">Quản lý sách</h4>

                            <ol class="breadcrumb float-right">
                                <li class="breadcrumb-item"><a href="/admin">NLU Book</a></li>
                                <li class="breadcrumb-item active">Quản lý sách</li>
                            </ol>

                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card-box table-responsive">
                            <h4 style="margin-left: 15px" class="m-t-0 header-title"><b>
                                <a href="/admin/book-manager/add-book"
                                   class="btn btn-success waves-light waves-effect w-md">
                                    <i class="fa fa-plus"></i> Thêm sách
                                </a>
                                <div class="text-center text-danger">${message}</div>
                            </b></h4>
                            <table id="datatable-buttons" class="table table-striped table-bordered" cellspacing="0"
                                   width="100%">
                                <thead>
                                <tr>
                                    <th>Image</th>
                                    <th>Tên sách</th>
                                    <th>Tác giả</th>
                                    <th>Danh mục</th>
                                    <th>Ngày đăng</th>
                                    <th>Giá</th>
                                    <th>Số lượng</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${books}" var="book">
                                    <tr>
                                        <td width="10%">
                                            <img src="/resources/${book.image}"
                                                 width="100%"
                                                 style="margin-right: auto; margin-left: auto; height: 139px"
                                                 class="img-thumbnail">
                                        </td>
                                        <td width="20%">${book.name}</td>
                                        <td width="10%">${book.author}</td>
                                        <td>${book.category.name}</td>
                                        <td width="20%">
                                            <fmt:formatDate value="${book.created}" pattern="HH:mm | dd/MM/yyyy"/>
                                        </td>
                                        <td width="10%">
                                            <fmt:formatNumber value="${book.priceNew}" pattern="###,###"/>
                                        </td>
                                        <td width="5%">${book.quantity}</td>
                                        <td>
                                            <div class="btn-group mb-2">
                                                <a class="btn btn-light waves-effect" onclick="show(${book.id})">
                                                    <i class="fa fa-eye"></i>
                                                </a>
                                                <a href="/admin/book-manager/edit-book?bookid=${book.id}"
                                                   class="btn btn-light waves-effect">
                                                    <i class="fa fa-edit"></i>
                                                </a>
                                                <a onclick="deleteBook(${book.id}, '${book.name}', '${book.image}')"
                                                   class="btn btn-light waves-effect">
                                                    <i class="fa fa-trash"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- end row -->

            </div> <!-- container -->

        </div> <!-- content -->

        <footer class="footer text-right">
            2017 - 2018 © Abstack. - Coderthemes.com
        </footer>
    </div>
    <!-- ============================================================== -->
    <!-- End Right content here -->
    <!-- ============================================================== -->
    <!--  Modal content for the above example -->
    <div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog"
         aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h5 class="modal-title" id="myLargeModalLabel">Xem chi tiết</h5>
                </div>
                <div class="modal-body">
                    <div class="row" id="details">
                    </div>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</div>
<!-- jQuery  -->
<script src="/resources/admin/assets/js/jquery.min.js"></script>
<script src="/resources/admin/assets/js/popper.min.js"></script>
<script src="/resources/admin/assets/js/bootstrap.min.js"></script>
<script src="/resources/admin/assets/js/metisMenu.min.js"></script>
<script src="/resources/admin/assets/js/waves.js"></script>
<script src="/resources/admin/assets/js/jquery.slimscroll.js"></script>
<!-- Required datatable js -->
<script src="/resources/admin/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/admin/plugins/datatables/dataTables.bootstrap4.min.js"></script>
<!-- Buttons examples -->
<script src="/resources/admin/plugins/datatables/dataTables.buttons.min.js"></script>
<script src="/resources/admin/plugins/datatables/buttons.bootstrap4.min.js"></script>
<script src="/resources/admin/plugins/datatables/jszip.min.js"></script>
<script src="/resources/admin/plugins/datatables/pdfmake.min.js"></script>
<script src="/resources/admin/plugins/datatables/vfs_fonts.js"></script>
<script src="/resources/admin/plugins/datatables/buttons.html5.min.js"></script>
<script src="/resources/admin/plugins/datatables/buttons.print.min.js"></script>
<!-- Responsive examples -->
<script src="/resources/admin/plugins/datatables/dataTables.responsive.min.js"></script>
<script src="/resources/admin/plugins/datatables/responsive.bootstrap4.min.js"></script>
<!-- App js -->
<script src="/resources/admin/assets/js/jquery.core.js"></script>
<script src="/resources/admin/assets/js/jquery.app.js"></script>
<!-- Sweet Alert Js  -->
<script src="/resources/admin/plugins/sweet-alert/sweetalert2.min.js"></script>

<script type="text/javascript">
    function deleteBook(id, name, image) {
        console.log(id, name, image)
        sweetAlert({
                title: '' + name + '',
                html: 'Bạn muốn xóa quyển sách này?<br><br>' +
                    '<a href="/admin/book-manager/delete-book?id=' + id + '" class="btn btn-danger btn-lg">Xóa</a>',
                type: 'warning',
                showConfirmButton: false,
                showCancelButton: true,
                cancelButtonText: 'Quay lại'
            }
        ).catch(swal.noop)
    }

    $(document).ready(function () {
        $('#datatable').DataTable();

        //Buttons examples
        var table = $('#datatable-buttons').DataTable({
            lengthChange: false,
            buttons: ['copy', 'excel', 'pdf']
        });

        table.buttons().container()
            .appendTo('#datatable-buttons_wrapper .col-md-6:eq(0)');
    });

    function show(id) {
        $.ajax({
            url: '/admin/book-manager/getbook',
            data: {
                id: id
            },
            dataType: 'json',
            success: function (book) {
                $('#details').html(
                    '<div class="col-4">' +
                        '<img src="/'+book.image+'" class="img-thumbnail" />' +
                    '</div>' +
                    '<div class="col-8">' +
                        '<table class="table-bordered table text-muted m-b-30">' +
                            '<tbody>' +
                                '<tr>' +
                                    '<td>' +
                                        'Tên sách' +
                                    '</td>' +
                                    '<td>' +
                                        ''+book.name+'' +
                                    '</td>' +
                                '</tr>' +
                                '<tr>' +
                                    '<td>' +
                                        'Tác giả' +
                                    '</td>' +
                                    '<td>' +
                                        ''+book.author+'' +
                                    '</td>' +
                                '</tr>' +
                                '<tr>' +
                                    '<td>' +
                                        'Nhà xuất bản' +
                                    '</td>' +
                                    '<td>' +
                                        ''+book.publisher.name+'' +
                                    '</td>' +
                                '</tr>' +
                                '<tr>' +
                                    '<td>' +
                                        'Thể loại' +
                                    '</td>' +
                                    '<td>' +
                                        ''+book.category.name+'' +
                                    '</td>' +
                                '</tr>' +
                                '<tr>' +
                                    '<td>' +
                                        'Kích thước' +
                                    '</td>' +
                                    '<td>' +
                                        ''+book.size+'' +
                                    '</td>' +
                                '</tr>' +
                                '<tr>' +
                                    '<td>' +
                                        'Trọng lượng' +
                                    '</td>' +
                                    '<td>' +
                                        ''+book.weight+'' +
                                    '</td>' +
                                '</tr>' +
                                '<tr>' +
                                    '<td>' +
                                        'Kích thước' +
                                    '</td>' +
                                    '<td>' +
                                        ''+book.size+'' +
                                    '</td>' +
                                '</tr>' +
                                '<tr>' +
                                    '<td>' +
                                        'Số lượng' +
                                    '</td>' +
                                    '<td>' +
                                        ''+book.quantity+'' +
                                    '</td>' +
                                '</tr>' +
                                '<tr>' +
                                    '<td>' +
                                        'Ngày phát hành' +
                                    '</td>' +
                                    '<td>' +
                                        ''+book.publishedDate+'' +
                                    '</td>' +
                                '</tr>' +
                                '<tr>' +
                                    '<td>' +
                                        'Giá góc' +
                                    '</td>' +
                                    '<td>' +
                                        ''+book.priceOld+'' +
                                    '</td>' +
                                '</tr>' +
                                '<tr>' +
                                    '<td>' +
                                        'Tên sách' +
                                    '</td>' +
                                    '<td>' +
                                        ''+book.name+'' +
                                    '</td>' +
                                '</tr>' +
                            '</tbody>' +
                        '</table>'+
                    '</div>' +
                    '<span class="card-body"><h5>Giới thiệu</h5>' + book.description + '</span>'

                )
            }
        })
        $('#myModal').modal();
    }
</script>
</body>
</html>