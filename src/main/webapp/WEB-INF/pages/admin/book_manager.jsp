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
                                <li class="breadcrumb-item"><a href="#">NLU Book</a></li>
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
                                <button type="button" class="btn btn-success waves-light waves-effect w-md">
                                    <i class="fa fa-plus"></i> Thêm sách
                                </button>
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
                                                 style="margin-right: auto; margin-left: auto"
                                                 class="img-thumbnail">
                                        </td>
                                        <td width="20%">${book.name}</td>
                                        <td width="10%">${book.author}</td>
                                        <td>${book.category.name}</td>
                                        <td width="20%">
                                            <fmt:formatDate value="${book.created}" pattern="HH:mm | dd/MM/yyyy" />
                                        </td>
                                        <td width="10%">
                                            <fmt:formatNumber value="${book.priceNew}" pattern="###,###"/>
                                        </td>
                                        <td width="5%">${book.quantity}</td>
                                        <td>
                                            <div class="btn-group mb-2">
                                                <a type="button" class="btn btn-light waves-effect">
                                                    <i class="fa fa-eye"></i>
                                                </a>
                                                <a type="button" class="btn btn-light waves-effect">
                                                    <i class="fa fa-edit"></i>
                                                </a>
                                                <a type="button" class="btn btn-light waves-effect">
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
<script type="text/javascript">
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
</script>
</body>
</html>