<%@ page
        language="java"
        contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>
        Abstack
        -
        Responsive
        Web
        App
        Kit</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc."
          name="description"/>
    <meta content="Coderthemes"
          name="author"/>
    <meta http-equiv="X-UA-Compatible"
          content="IE=edge"/>

    <!-- App favicon -->
    <link rel="shortcut icon"
          href="/resources/admin/assets/images/favicon.ico">

    <!-- App css -->
    <link href="/resources/admin/assets/css/bootstrap.min.css"
          rel="stylesheet"
          type="text/css"/>
    <link href="/resources/admin/assets/css/icons.css"
          rel="stylesheet"
          type="text/css"/>
    <link href="/resources/admin/assets/css/metismenu.min.css"
          rel="stylesheet"
          type="text/css"/>
    <link href="/resources/admin/assets/css/style.css"
          rel="stylesheet"
          type="text/css"/>

    <script src="/resources/admin/assets/js/modernizr.min.js"></script>

</head>


<body class="bg-accpunt-pages">

<!-- HOME -->
<section>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="wrapper-page">
                    <div class="account-pages">
                        <div class="account-box">
                            <div class="account-logo-box">
                                <h2 class="text-uppercase text-center">
                                    <a href="index.html"
                                       class="text-success">
                                        <span><img
                                                src="/resources/admin/assets/images/logo_dark.png"
                                                alt=""
                                                height="18"></span>
                                    </a>
                                </h2>
                                <h6 class="text-uppercase text-center font-bold mt-4">
                                    Đăng nhập
                                </h6>
                            </div>
                            <div class="account-content">
                                <form class="form-horizontal"
                                      method="post"
                                      action="/j_spring_security_check">
                                    <div class="form-group m-b-20 row">
                                        <div class="col-12">
                                            <label for="emailaddress">Email
                                                address</label>
                                            <input class="form-control"
                                                   name="email"
                                                   type="email"
                                                   id="emailaddress"
                                                   required=""
                                                   placeholder="Enter your email">
                                        </div>
                                    </div>

                                    <div class="form-group row m-b-20">
                                        <div class="col-12">
                                            <a href="page-recoverpw.html"
                                               class="text-muted pull-right">
                                            </a>
                                            <label for="password">Password</label>
                                            <input class="form-control"
                                                   name="password"
                                                   type="password"
                                                   required=""
                                                   id="password"
                                                   placeholder="Enter your password">
                                        </div>
                                    </div>
                                    <div class="form-group row text-center m-t-10">
                                        <div class="col-12">
                                            <button class="btn btn-block btn-gradient waves-effect waves-light"
                                                    type="submit">
                                                Đăng nhập
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- end card-box-->
                </div>
                <!-- end wrapper -->
            </div>
        </div>
    </div>
</section>
<!-- END HOME -->


<!-- jQuery  -->
<script src="/resources/admin/assets/js/jquery.min.js"></script>
<script src="/resources/admin/assets/js/popper.min.js"></script>
<script src="/resources/admin/assets/js/bootstrap.min.js"></script>
<script src="/resources/admin/assets/js/metisMenu.min.js"></script>
<script src="/resources/admin/assets/js/waves.js"></script>
<script src="/resources/admin/assets/js/jquery.slimscroll.js"></script>

<!-- App js -->
<script src="/resources/admin/assets/js/jquery.core.js"></script>
<script src="/resources/admin/assets/js/jquery.app.js"></script>

</body>
</html>