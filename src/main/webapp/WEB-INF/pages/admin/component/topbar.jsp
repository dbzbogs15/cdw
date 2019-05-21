<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="topbar">
    <!-- LOGO -->
    <div class="topbar-left">
        <a href="/admin" class="logo">
                    <span>
                        <img src="/resources/admin/assets/images/logo.png" alt="" height="16">
                    </span>
            <i>
                <img src="/resources/admin/assets/images/logo_sm.png" alt="" height="28">
            </i>
        </a>
    </div>

    <nav class="navbar-custom">

        <ul class="list-unstyled topbar-right-menu float-right mb-0">
            <li class="dropdown notification-list hide-phone">
                <a class="nav-link dropdown-toggle waves-effect waves-light nav-user" data-toggle="dropdown"
                   href="#" role="button" aria-haspopup="false" aria-expanded="false">
                    <i class="mdi mdi-earth"></i> English <i class="mdi mdi-chevron-down"></i>
                </a>
                <div class="dropdown-menu dropdown-menu-right">

                    <!-- item-->
                    <a href="javascript:void(0);" class="dropdown-item">
                        Spanish
                    </a>

                    <!-- item-->
                    <a href="javascript:void(0);" class="dropdown-item">
                        Italian
                    </a>

                    <!-- item-->
                    <a href="javascript:void(0);" class="dropdown-item">
                        French
                    </a>

                    <!-- item-->
                    <a href="javascript:void(0);" class="dropdown-item">
                        Russian
                    </a>

                </div>
            </li>

            <li class="dropdown notification-list">
                <a class="nav-link dropdown-toggle arrow-none waves-light waves-effect" data-toggle="dropdown"
                   href="#" role="button" aria-haspopup="false" aria-expanded="false">
                    <i class="fi-bell noti-icon"></i>
                    <span class="badge badge-danger badge-pill noti-icon-badge">4</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right dropdown-lg">

                    <!-- item-->
                    <div class="dropdown-item noti-title">
                        <h6 class="m-0"><span class="float-right"><a href="" class="text-dark"><small>Clear
                                                All</small></a> </span>Notification
                        </h6>
                    </div>

                    <div class="slimscroll" style="max-height: 190px;">
                        <!-- item-->
                        <a href="javascript:void(0);" class="dropdown-item notify-item">
                            <div class="notify-icon bg-success"><i class="mdi mdi-comment-account-outline"></i>
                            </div>
                            <p class="notify-details">Caleb Flakelar commented on Admin
                                <small
                                        class="text-muted">1 min ago
                                </small>
                            </p>
                        </a>

                        <!-- item-->
                        <a href="javascript:void(0);" class="dropdown-item notify-item">
                            <div class="notify-icon bg-info"><i class="mdi mdi-account-plus"></i></div>
                            <p class="notify-details">New user registered.
                                <small class="text-muted">5 hours
                                    ago
                                </small>
                            </p>
                        </a>

                        <!-- item-->
                        <a href="javascript:void(0);" class="dropdown-item notify-item">
                            <div class="notify-icon bg-danger"><i class="mdi mdi-heart"></i></div>
                            <p class="notify-details">Carlos Crouch liked <b>Admin</b>
                                <small
                                        class="text-muted">3 days ago
                                </small>
                            </p>
                        </a>

                        <!-- item-->
                        <a href="javascript:void(0);" class="dropdown-item notify-item">
                            <div class="notify-icon bg-warning"><i class="mdi mdi-comment-account-outline"></i>
                            </div>
                            <p class="notify-details">Caleb Flakelar commented on Admin
                                <small
                                        class="text-muted">4 days ago
                                </small>
                            </p>
                        </a>

                        <!-- item-->
                        <a href="javascript:void(0);" class="dropdown-item notify-item">
                            <div class="notify-icon bg-purple"><i class="mdi mdi-account-plus"></i></div>
                            <p class="notify-details">New user registered.
                                <small class="text-muted">7 days
                                    ago
                                </small>
                            </p>
                        </a>

                        <!-- item-->
                        <a href="javascript:void(0);" class="dropdown-item notify-item">
                            <div class="notify-icon bg-custom"><i class="mdi mdi-heart"></i></div>
                            <p class="notify-details">Carlos Crouch liked <b>Admin</b>
                                <small
                                        class="text-muted">13 days ago
                                </small>
                            </p>
                        </a>
                    </div>

                    <!-- All-->
                    <a href="javascript:void(0);"
                       class="dropdown-item text-center text-primary notify-item notify-all">
                        View all <i class="fi-arrow-right"></i>
                    </a>

                </div>
            </li>

            <li class="dropdown notification-list">
                <a class="nav-link dropdown-toggle arrow-none waves-light waves-effect" data-toggle="dropdown"
                   href="#" role="button" aria-haspopup="false" aria-expanded="false">
                    <i class="fi-speech-bubble noti-icon"></i>
                    <span class="badge badge-light badge-pill noti-icon-badge">6</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right dropdown-lg">

                    <!-- item-->
                    <div class="dropdown-item noti-title">
                        <h6 class="m-0"><span class="float-right"><a href="" class="text-dark"><small>Clear
                                                All</small></a> </span>Chat
                        </h6>
                    </div>

                    <div class="slimscroll" style="max-height: 190px;">
                        <!-- item-->
                        <a href="javascript:void(0);" class="dropdown-item notify-item">
                            <div class="notify-icon"><img src="/resources/admin/assets/images/users/avatar-2.jpg"
                                                          class="img-fluid rounded-circle" alt=""/></div>
                            <p class="notify-details">Cristina Pride</p>
                            <p class="text-muted font-13 mb-0 user-msg">Hi, How are you? What about our next
                                meeting</p>
                        </a>

                        <!-- item-->
                        <a href="javascript:void(0);" class="dropdown-item notify-item">
                            <div class="notify-icon"><img src="/resources/admin/assets/images/users/avatar-3.jpg"
                                                          class="img-fluid rounded-circle" alt=""/></div>
                            <p class="notify-details">Sam Garret</p>
                            <p class="text-muted font-13 mb-0 user-msg">Yeah everything is fine</p>
                        </a>

                        <!-- item-->
                        <a href="javascript:void(0);" class="dropdown-item notify-item">
                            <div class="notify-icon"><img src="/resources/admin/assets/images/users/avatar-4.jpg"
                                                          class="img-fluid rounded-circle" alt=""/></div>
                            <p class="notify-details">Karen Robinson</p>
                            <p class="text-muted font-13 mb-0 user-msg">Wow that's great</p>
                        </a>

                        <!-- item-->
                        <a href="javascript:void(0);" class="dropdown-item notify-item">
                            <div class="notify-icon"><img src="/resources/admin/assets/images/users/avatar-5.jpg"
                                                          class="img-fluid rounded-circle" alt=""/></div>
                            <p class="notify-details">Sherry Marshall</p>
                            <p class="text-muted font-13 mb-0 user-msg">Hi, How are you? What about our next
                                meeting</p>
                        </a>

                        <!-- item-->
                        <a href="javascript:void(0);" class="dropdown-item notify-item">
                            <div class="notify-icon"><img src="/resources/admin/assets/images/users/avatar-6.jpg"
                                                          class="img-fluid rounded-circle" alt=""/></div>
                            <p class="notify-details">Shawn Millard</p>
                            <p class="text-muted font-13 mb-0 user-msg">Yeah everything is fine</p>
                        </a>
                    </div>

                    <!-- All-->
                    <a href="javascript:void(0);"
                       class="dropdown-item text-center text-primary notify-item notify-all">
                        View all <i class="fi-arrow-right"></i>
                    </a>

                </div>
            </li>

            <li class="dropdown notification-list">
                <a class="nav-link dropdown-toggle waves-effect waves-light nav-user" data-toggle="dropdown"
                   href="#" role="button" aria-haspopup="false" aria-expanded="false">
                    <img src="/resources/admin/assets/images/users/avatar-1.jpg" alt="user" class="rounded-circle">
                    <span class="ml-1">
                        ${sessionScope.accountAdmin.name} <i class="mdi mdi-chevron-down"></i>
                    </span>
                </a>
                <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
                    <!-- item-->
                    <div class="dropdown-item noti-title">
                        <h6 class="text-overflow m-0">Welcome !</h6>
                    </div>

                    <!-- item-->
                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                        <i class="fi-head"></i> <span>My Account</span>
                    </a>

                    <!-- item-->
                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                        <i class="fi-cog"></i> <span>Settings</span>
                    </a>

                    <!-- item-->
                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                        <i class="fi-help"></i> <span>Support</span>
                    </a>

                    <!-- item-->
                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                        <i class="fi-lock"></i> <span>Lock Screen</span>
                    </a>

                    <!-- item-->
                    <a href="/admin/logout" class="dropdown-item notify-item">
                        <i class="fi-power"></i> <span>Logout</span>
                    </a>
                </div>
            </li>
        </ul>
        <ul class="list-inline menu-left mb-0">
            <li class="float-left">
                <button class="button-menu-mobile open-left waves-light waves-effect">
                    <i class="dripicons-menu"></i>
                </button>
            </li>
            <li class="hide-phone app-search">
                <form role="search" class="">
                    <input type="text" placeholder="Search..." class="form-control">
                    <a href=""><i class="fa fa-search"></i></a>
                </form>
            </li>
        </ul>
    </nav>
</div>