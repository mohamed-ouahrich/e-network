<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" isELIgnored="false" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <%--    <link href="css/animate.css" rel="stylesheet"/>--%>
    <link href="${pageContext.request.contextPath}/css/bootstrap-4.6.1-dist/bootstrap-4.6.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/fontawesome-free-5.15.4-web/css/all.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/css/jquery.min.js"></script>
    <script type="application/javascript" src="${pageContext.request.contextPath}/css/bootstrap-4.6.1-dist/bootstrap-4.6.1-dist/js/bootstrap.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light w-100">
    <a class="navbar-brand" href="<c:url value="/home/"/>">
        <img class="rounded-circle" src="${pageContext.request.contextPath}/images/logo.png" height="40" width="40"/>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/home"> <span><i class="fa fa-home"></i>&nbsp;Home</span></a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="${pageContext.request.contextPath}/homeGroupe"> <span><i class="fa fa-users"></i>&nbsp;Mes groupes</span></a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="${pageContext.request.contextPath}/profile"> <span><i class="fa fa-user-alt"></i>&nbsp;Profiles</span></a>
            </li>


        </ul>
        <ul class="my-2 my-lg-0">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                   aria-expanded="false">
                    <i class="fa fa-user"></i>
                    ${sessionScope.user.fullName}
                </a>

                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <form method="post" action="${pageContext.request.contextPath}/login?action=logout">
                        <button type="submit" class="dropdown-item">
                            <i class="fa fa-lock"></i> Déconnecter
                        </button>
<%--                        <a class="dropdown-item" href="#">Another action</a>--%>
<%--                        <div class="dropdown-divider"></div>--%>
<%--                        <a class="dropdown-item" href="#">Something else here</a>--%>
                    </form>

                </div>
            </li>
        </ul>
        <%--                <form class="form-inline my-2 my-lg-0">--%>
        <%--                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">--%>
        <%--                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--%>
        <%--                </form>--%>
    </div>
</nav>
<%--        <div class="header-data">--%>
<%--            <div class="logo">--%>
<%--                <a href="<c:url value="/home/index.jsp"/>" title=""><img class="rounded-circle" src="images/logo.png"--%>
<%--                                                                         alt=""></a>--%>
<%--            </div>--%>
<%--            <div class="search-bar">--%>
<%--                <form>--%>
<%--                    <input type="text" name="search" placeholder="Search...">--%>
<%--                    <button type="submit">--%>
<%--                        <i class="fa fa-search"></i>--%>
<%--                    </button>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--            <nav>--%>
<%--                <ul>--%>
<%--                    <li><a href='<c:url value="/home/index.jsp"></c:url>' title=""> <span><i--%>
<%--                            class="fa fa-home"></i></span> Home--%>
<%--                    </a></li>--%>
<%--                    <!-- 				<li><a href="companies.html" title=""> <span><img -->--%>
<%--                    <!-- 							src="images/icon2.png" alt=""></span> Companies -->--%>
<%--                    <!-- 				</a> -->--%>
<%--                    <!-- 					<ul> -->--%>
<%--                    <!-- 						<li><a href="companies.html" title="">Companies</a></li> -->--%>
<%--                    <!-- 						<li><a href="company-profile.html" title="">Company -->--%>
<%--                    <!-- 								Profile</a></li> -->--%>
<%--                    <!-- 					</ul> -->--%>
<%--                    <!-- 					</li> -->--%>
<%--                    <!-- 				<li><a href="projects.html" title=""> <span><img -->--%>
<%--                    <!-- 							src="images/icon3.png" alt=""></span> Projects -->--%>
<%--                    <!-- 				</a></li> -->--%>
<%--                    <!-- 				<li><a href="profiles.html" title=""> <span><img -->--%>
<%--                    <!-- 							src="images/icon4.png" alt=""></span> Profiles -->--%>
<%--                    <!-- 				</a> -->--%>
<%--                    <!-- 					<ul> -->--%>
<%--                    <!-- 						<li><a href="user-profile.html" title="">User Profile</a></li> -->--%>
<%--                    <!-- 						<li><a href="my-profile-feed.html" title="">my-profile-feed</a></li> -->--%>
<%--                    <!-- 					</ul></li> -->--%>
<%--                    <li><a href="${pageContext.request.contextPath}/groupe"> <span><i--%>
<%--                            class="fa fa-users"></i></span> Groupes--%>
<%--                    </a></li>--%>
<%--                    <li><a href="#" title="" class="not-box-openm"><span><i--%>
<%--                            class="fa fa-sms"></i></span> Messages </a>--%>
<%--                        <div class="notification-box msg" id="message">--%>
<%--                            <div class="nt-title">--%>
<%--                                <h4>Setting</h4>--%>
<%--                                <a href="#" title="">Clear all</a>--%>
<%--                            </div>--%>
<%--                            <div class="nott-list">--%>
<%--                                <div class="notfication-details">--%>
<%--                                    <div class="noty-user-img">--%>
<%--                                        <img src="images/resources/ny-img1.png" alt="">--%>
<%--                                    </div>--%>
<%--                                    <div class="notification-info">--%>
<%--                                        <h3>--%>
<%--                                            <a href="messages.html" title="">Jassica William</a>--%>
<%--                                        </h3>--%>
<%--                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing--%>
<%--                                            elit, sed do.</p>--%>
<%--                                        <span>2 min ago</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="notfication-details">--%>
<%--                                    <div class="noty-user-img">--%>
<%--                                        <img src="images/resources/ny-img2.png" alt="">--%>
<%--                                    </div>--%>
<%--                                    <div class="notification-info">--%>
<%--                                        <h3>--%>
<%--                                            <a href="messages.html" title="">Jassica William</a>--%>
<%--                                        </h3>--%>
<%--                                        <p>Lorem ipsum dolor sit amet.</p>--%>
<%--                                        <span>2 min ago</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="notfication-details">--%>
<%--                                    <div class="noty-user-img">--%>
<%--                                        <img src="images/resources/ny-img3.png" alt="">--%>
<%--                                    </div>--%>
<%--                                    <div class="notification-info">--%>
<%--                                        <h3>--%>
<%--                                            <a href="messages.html" title="">Jassica William</a>--%>
<%--                                        </h3>--%>
<%--                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing--%>
<%--                                            elit, sed do eiusmod tempo incididunt ut labore et dolore--%>
<%--                                            magna aliqua.</p>--%>
<%--                                        <span>2 min ago</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="view-all-nots">--%>
<%--                                    <a href="messages.html" title="">View All Messsages</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li><a href="#" title="" class="not-box-open"> <span><i--%>
<%--                            class="fa fa-bell"></i></span> Notification--%>
<%--                    </a>--%>
<%--                        <div class="notification-box noti" id="notification">--%>
<%--                            <div class="nt-title">--%>
<%--                                <h4>Setting</h4>--%>
<%--                                <a href="#" title="">Clear all</a>--%>
<%--                            </div>--%>
<%--                            <div class="nott-list">--%>
<%--                                <div class="notfication-details">--%>
<%--                                    <div class="noty-user-img">--%>
<%--                                        <img src="images/resources/ny-img1.png" alt="">--%>
<%--                                    </div>--%>
<%--                                    <div class="notification-info">--%>
<%--                                        <h3>--%>
<%--                                            <a href="#" title="">Jassica William</a> Comment on your--%>
<%--                                            project.--%>
<%--                                        </h3>--%>
<%--                                        <span>2 min ago</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="notfication-details">--%>
<%--                                    <div class="noty-user-img">--%>
<%--                                        <img src="images/resources/ny-img2.png" alt="">--%>
<%--                                    </div>--%>
<%--                                    <div class="notification-info">--%>
<%--                                        <h3>--%>
<%--                                            <a href="#" title="">Jassica William</a> Comment on your--%>
<%--                                            project.--%>
<%--                                        </h3>--%>
<%--                                        <span>2 min ago</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>

<%--                                <div class="notfication-details">--%>
<%--                                    <div class="noty-user-img">--%>
<%--                                        <img src="images/resources/ny-img3.png" alt="">--%>
<%--                                    </div>--%>
<%--                                    <div class="notification-info">--%>
<%--                                        <h3>--%>
<%--                                            <a href="#" title="">Jassica William</a> Comment on your--%>
<%--                                            project.--%>
<%--                                        </h3>--%>
<%--                                        <span>2 min ago</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="notfication-details">--%>
<%--                                    <div class="noty-user-img">--%>
<%--                                        <img src="images/resources/ny-img2.png" alt="">--%>
<%--                                    </div>--%>
<%--                                    <div class="notification-info">--%>
<%--                                        <h3>--%>
<%--                                            <a href="#" title="">Jassica William</a> Comment on your--%>
<%--                                            project.--%>
<%--                                        </h3>--%>
<%--                                        <span>2 min ago</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="view-all-nots">--%>
<%--                                    <a href="#" title="">View All Notification</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--            </nav>--%>
<%--            <div class="menu-btn">--%>
<%--                <a href="#" title=""><i class="fa fa-bars"></i></a>--%>
<%--            </div>--%>
<%--            <div class="user-account">--%>
<%--                <div class="user-info">--%>
<%--                    <img src="images/user.png" alt="" height="30" width="30"> <a href="#"--%>
<%--                                                                                 title="">John</a> <i--%>
<%--                        class="fa fa-caret-down"></i>--%>
<%--                </div>--%>
<%--                <div class="dropdown">--%>
<%--                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-expanded="false">--%>
<%--                        Dropdown--%>
<%--                    </button>--%>
<%--                    <div class="dropdown-menu" aria-labelledby="dropdownMenu2">--%>
<%--                        <button class="dropdown-item" type="button">Action</button>--%>
<%--                        <button class="dropdown-item" type="button">Another action</button>--%>
<%--                        <button class="dropdown-item" type="button">Something else here</button>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="user-account-settingss" id="users">--%>
<%--                    <h3>Online Status</h3>--%>
<%--                    <ul class="on-off-status">--%>
<%--                        <li>--%>
<%--                            <div class="fgt-sec">--%>
<%--                                <input type="radio" name="cc" id="c5"> <label for="c5">--%>
<%--                                <span></span>--%>
<%--                            </label> <small>Online</small>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <div class="fgt-sec">--%>
<%--                                <input type="radio" name="cc" id="c6"> <label for="c6">--%>
<%--                                <span></span>--%>
<%--                            </label> <small>Offline</small>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                    <h3>Custom Status</h3>--%>
<%--                    <div class="search_form">--%>
<%--                        <form>--%>
<%--                            <input type="text" name="search">--%>
<%--                            <button type="submit">Ok</button>--%>
<%--                        </form>--%>
<%--                    </div>--%>
<%--                    <h3>Setting</h3>--%>
<%--                    <ul class="us-links">--%>
<%--                        <li><a href="profile-account-setting.html" title="">Account--%>
<%--                            Setting</a></li>--%>
<%--                        <li><a href="#" title="">Privacy</a></li>--%>
<%--                        <li><a href="#" title="">Faqs</a></li>--%>
<%--                        <li><a href="#" title="">Terms & Conditions</a></li>--%>
<%--                    </ul>--%>
<%--                    <h3 class="tc">--%>
<%--                        <a href="sign-in.html" title="">Logout</a>--%>
<%--                    </h3>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
</body>
</html>
