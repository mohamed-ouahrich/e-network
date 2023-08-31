<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" isELIgnored="false" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    response.setHeader("Cache-Control", "no-cache,no-store");
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login");
    }


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet"/>
    <link
            href="${pageContext.request.contextPath}/css/bootstrap-4.6.1-dist/bootstrap-4.6.1-dist/css/bootstrap.min.css"
            rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/responsive.css" rel="stylesheet"/>

    <link href="${pageContext.request.contextPath}/css/fontawesome-free-5.15.4-web/css/all.css"
          rel="stylesheet">
    <style>
        /* Custom style */
        .accordion-button::before {
            position: absolute;
            content: "+";
            right: 10px;
            top: 5px;
        }

        .accordion-button[aria-expanded="true"]:before {
            content: "-";
        }

        .accordion-button:not(.collapsed)::after {

        }

        #infoGroup:hover {
            color: orangered;
        }

        #infoGroup:focus {
            color: orangered;
        }
    </style>
    <title>HomeGroupe</title>
</head>
<body>
<%@include file="../header.jsp" %>
<main>
    <div class="main-section">
        <div class="container">
            <div class="main-section-data">
                <div class="row">
                    <div class="col-lg-3 col-md-4 pd-left-none no-pd">
                        <div class="main-left-sidebar no-margin">
                            <div class="user-data full-width">
                                <div class="user-profile">
                                    <div class="username-dt">
                                        <div class="usr-pic">
                                            <img src="${pageContext.request.contextPath}/images/user.png" height="120"
                                                 width="70" alt=""
                                                 style="background: white;">
                                        </div>
                                    </div>
                                    <div class="user-specs">
                                        <h3>${sessionScope.user.fullName}</h3>
                                        <span>Graphic Designer at Self Employed</span>
                                    </div>
                                </div>
                                <ul class="user-fw-status">
                                    <li>
                                        <h4>Following Group <c:if test="${ totalFollowing > 0}"> <i id="infoGroup"
                                                                                                    data-toggle="modal"
                                                                                                    data-target="#modalFollowingGroup"
                                                                                                    type="button"
                                                                                                    class="fa fa-info-circle"></i> </c:if>
                                        </h4> <span>${totalFollowing}</span>
                                    </li>
                                    <li>
                                        <h4>Followers</h4> <span>155</span>
                                    </li>
                                    <li><a href="my-profile-feed.html" title="">View
                                        Profile</a></li>
                                </ul>
                            </div>
                            <div class="suggestions full-width">
                                <div class="sd-title">
                                    <h3>Suggestions Groupes</h3>
                                    <i class="la la-ellipsis-v"></i>
                                </div>
                                <div class="suggestions-list">
                                    <c:forEach var="groupe" items="${groupes}">
                                        <div class="suggestion-usd">
                                            <img class="rounded-circle shadow-lg"
                                                 src="${pageContext.request.contextPath}/images/groupe.png" height="50"
                                                 width="50" alt="">
                                            <div class="sgt-text">
                                                <h4>${groupe.name}</h4>
                                                <span class="text-secondary">${groupe.user.fullName}</span>
                                            </div>
                                            <form method="post"
                                                  action="${pageContext.request.contextPath}/homeGroupe?action=adherer&id=${groupe.id}">
                                                <button type="submit" class="btn"><i class="fa fa-rss"></i></button>
                                            </form>
                                        </div>

                                    </c:forEach>
                                    <c:if test="${empty groupes}">
                                        <div class="view-more">
                                            <div class="alert alert-warning">Aucun groupe</div>
                                        </div>
                                    </c:if>

                                </div>
                            </div>
                            <div class="tags-sec full-width">
                                <ul>
                                    <li><a href="#" title="">Help Center</a></li>
                                    <li><a href="#" title="">About</a></li>
                                    <li><a href="#" title="">Privacy Policy</a></li>
                                    <li><a href="#" title="">Community Guidelines</a></li>
                                    <li><a href="#" title="">Cookies Policy</a></li>
                                    <li><a href="#" title="">Career</a></li>
                                    <li><a href="#" title="">Language</a></li>
                                    <li><a href="#" title="">Copyright Policy</a></li>
                                </ul>
                                <div class="cp-sec">
                                    <img src="images/logo2.png" alt="">
                                    <p>
                                        <img src="images/cp.png" alt="">Copyright 2022
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-8 no-pd">
                        <div class="main-ws-sec">
                            <div class="post-topbar">
                                <form method="get" action="${pageContext.request.contextPath}/homeGroupe">
                                    <div class="form-group">
                                        <label for="selectGroupe">Groupe</label>
                                        <select name="selectedGroupe" required class="form-control" id="selectGroupe" >
                                            <option value="" disabled selected>Selectionner un groupe...</option>
                                            <c:forEach items="${adherateGroupes}" var="groupe">
                                                <option value="${groupe.id}">${groupe.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-danger mb-2 float-right rounded-pill ">
                                        <i class="fa fa-search"></i>
                                        Chercher</button>
                                </form>
                                <div class="post-st">
                                    <ul>

                                    </ul>
                                </div>
                            </div>
                            <div class="post-topbar">
                                <div class="user-picy">
                                    <img src="images/resources/user-pic.png" alt="">
                                </div>
                                <div class="post-st">
                                    <ul>
                                        <li><a class="post_project" type="button" data-toggle="modal"
                                               data-target="#modalCreatePublication" title="">Nouvelle Publication</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="posts-section">
                                <c:forEach var="post" items="${publications}">
                                    <div class="post-bar mb-1">
                                        <div class="post_topbar">
                                            <div class="usy-dt">
                                                <img src="images/resources/us-pic.png" alt="">
                                                <div class="usy-name w-100">
                                                    <h3>${post.user.fullName}
                                                        <c:if test="${sessionScope.user.id==post.user.id}">
                                                            <form method="post"
                                                                  action="${pageContext.request.contextPath}/home?action=hide&id=${post.id}">
                                                                <button class="border-0 text-secondary"
                                                                        style="background: none" type="submit"
                                                                        title="hide" data-toggle="tooltip"
                                                                        data-placement="right">
                                                                    <i class="fa fa-eye-slash"
                                                                       style="font-size: 14px !important;"></i>
                                                                </button>
                                                            </form>
                                                        </c:if>
                                                    </h3>

                                                    <span><i
                                                            class="fa fa-clock"></i>&nbsp;${post.datePublication}</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="job_descp">
                                            <p class="pl-4 pt-2 pr-4 pb-2">
                                                    ${post.contenu}
                                            </p>
                                        </div>
                                        <div class="job-status-bar">
                                            <ul class="d-flex justify-content-between text-secondary">
                                                <form method="post"
                                                      action="${pageContext.request.contextPath}/home?action=like&id=${post.id}">
                                                    <button style="background: none" class="text-secondary border-0"
                                                            type="submit">
                                                        <span class="text-secondary">
                                                            <i
                                                                    class="fas fa-heart"></i> Like <span
                                                                class="badge badge-danger">${post.jaimes.size()}</span>
                                                        </span>
                                                    </button>
                                                </form>


                                                <li><p class="text-secondary" type="button" class="com"><i
                                                        class="fas fa-comment-alt"></i> Comment <span
                                                        class="badge badge-danger">${post.commentaires.size()}</span>
                                                </p></li>
                                                <p class="text-secondary"><i class="fas fa-eye"></i>Views <span
                                                        class="badge badge-info">12</span></p>

                                            </ul>
                                        </div>
                                        <form method="post"
                                              action="${pageContext.request.contextPath}/home?action=new-comment&id=${post.id}">
                                            <div class="input-group">

                                                <textarea placeholder="Commentaire..." type="text" required="required"
                                                          rows="1" class="form-control"
                                                          id="comment"
                                                          name="commentaire"></textarea>
                                                <div class=" d-flex align-items-center p-1 ">

                                                    <button class="btn btn-outline-secondary"><span><i
                                                            class="fa fa-paper-plane"></i></span></button>
                                                </div>
                                            </div>
                                        </form>
                                        <c:if test="${not empty post.commentaires}">
                                            <div id="accordion" class="mt-1">
                                                <div class="card">
                                                    <div class="card-header p-0" id="headingTwo">
                                                        <h5 class="mb-0">
                                                            <button class="btn btn-link accordion-button collapsed"
                                                                    data-toggle="collapse"
                                                                    data-target="#collapseTwo${post.id}"
                                                                    aria-expanded="false"
                                                                    aria-controls="collapseTwo${post.id}">
                                                                Commentaires
                                                            </button>
                                                        </h5>
                                                    </div>
                                                    <div id="collapseTwo${post.id}" class="collapse"
                                                         aria-labelledby="headingTwo" data-parent="#accordion">
                                                        <div class="card-body">
                                                            <c:forEach var="comment" items="${post.commentaires}">
                                                                <div class="rounded bg-light shadow-sm mb-2">
                                                                    <span class="fa fa-user-circle h6">&nbsp;${comment.user.fullName}</span><br>
                                                                    <span class="pl-2"> ${comment.contenu}</span>
                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>

                                    </div>
                                </c:forEach>


                                <%--                                <div class="top-profiles">--%>
                                <%--                                    <div class="pf-hd">--%>
                                <%--                                        <h3>Top Profiles</h3>--%>
                                <%--                                        <i class="la la-ellipsis-v"></i>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="profiles-slider">--%>
                                <%--                                        <div class="user-profy">--%>
                                <%--                                            <img src="images/resources/user1.png" alt="">--%>
                                <%--                                            <h3>John Doe</h3>--%>
                                <%--                                            <span>Graphic Designer</span>--%>
                                <%--                                            <ul>--%>
                                <%--                                                <li><a href="#" title="" class="followw">Follow</a></li>--%>
                                <%--                                                <li><a href="#" title="" class="envlp"><img--%>
                                <%--                                                        src="images/envelop.png" alt=""></a></li>--%>
                                <%--                                                <li><a href="#" title="" class="hire">hire</a></li>--%>
                                <%--                                            </ul>--%>
                                <%--                                            <a href="#" title="">View Profile</a>--%>
                                <%--                                        </div>--%>
                                <%--                                        <div class="user-profy">--%>
                                <%--                                            <img src="images/resources/user2.png" alt="">--%>
                                <%--                                            <h3>John Doe</h3>--%>
                                <%--                                            <span>Graphic Designer</span>--%>
                                <%--                                            <ul>--%>
                                <%--                                                <li><a href="#" title="" class="followw">Follow</a></li>--%>
                                <%--                                                <li><a href="#" title="" class="envlp"><img--%>
                                <%--                                                        src="images/envelop.png" alt=""></a></li>--%>
                                <%--                                                <li><a href="#" title="" class="hire">hire</a></li>--%>
                                <%--                                            </ul>--%>
                                <%--                                            <a href="#" title="">View Profile</a>--%>
                                <%--                                        </div>--%>
                                <%--                                        <div class="user-profy">--%>
                                <%--                                            <img src="images/resources/user3.png" alt="">--%>
                                <%--                                            <h3>John Doe</h3>--%>
                                <%--                                            <span>Graphic Designer</span>--%>
                                <%--                                            <ul>--%>
                                <%--                                                <li><a href="#" title="" class="followw">Follow</a></li>--%>
                                <%--                                                <li><a href="#" title="" class="envlp"><img--%>
                                <%--                                                        src="images/envelop.png" alt=""></a></li>--%>
                                <%--                                                <li><a href="#" title="" class="hire">hire</a></li>--%>
                                <%--                                            </ul>--%>
                                <%--                                            <a href="#" title="">View Profile</a>--%>
                                <%--                                        </div>--%>
                                <%--                                        <div class="user-profy">--%>
                                <%--                                            <img src="images/resources/user1.png" alt="">--%>
                                <%--                                            <h3>John Doe</h3>--%>
                                <%--                                            <span>Graphic Designer</span>--%>
                                <%--                                            <ul>--%>
                                <%--                                                <li><a href="#" title="" class="followw">Follow</a></li>--%>
                                <%--                                                <li><a href="#" title="" class="envlp"><img--%>
                                <%--                                                        src="images/envelop.png" alt=""></a></li>--%>
                                <%--                                                <li><a href="#" title="" class="hire">hire</a></li>--%>
                                <%--                                            </ul>--%>
                                <%--                                            <a href="#" title="">View Profile</a>--%>
                                <%--                                        </div>--%>
                                <%--                                        <div class="user-profy">--%>
                                <%--                                            <img src="images/resources/user2.png" alt="">--%>
                                <%--                                            <h3>John Doe</h3>--%>
                                <%--                                            <span>Graphic Designer</span>--%>
                                <%--                                            <ul>--%>
                                <%--                                                <li><a href="#" title="" class="followw">Follow</a></li>--%>
                                <%--                                                <li><a href="#" title="" class="envlp"><img--%>
                                <%--                                                        src="images/envelop.png" alt=""></a></li>--%>
                                <%--                                                <li><a href="#" title="" class="hire">hire</a></li>--%>
                                <%--                                            </ul>--%>
                                <%--                                            <a href="#" title="">View Profile</a>--%>
                                <%--                                        </div>--%>
                                <%--                                        <div class="user-profy">--%>
                                <%--                                            <img src="images/resources/user3.png" alt="">--%>
                                <%--                                            <h3>John Doe</h3>--%>
                                <%--                                            <span>Graphic Designer</span>--%>
                                <%--                                            <ul>--%>
                                <%--                                                <li><a href="#" title="" class="followw">Follow</a></li>--%>
                                <%--                                                <li><a href="#" title="" class="envlp"><img--%>
                                <%--                                                        src="images/envelop.png" alt=""></a></li>--%>
                                <%--                                                <li><a href="#" title="" class="hire">hire</a></li>--%>
                                <%--                                            </ul>--%>
                                <%--                                            <a href="#" title="">View Profile</a>--%>
                                <%--                                        </div>--%>
                                <%--                                    </div>--%>
                                <%--                                </div>--%>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 pd-right-none no-pd">
                        <div class="right-sidebar">
                            <%--                            <div class="widget widget-about">--%>
                            <%--                                <img src="../images/logo.png" alt="">--%>
                            <%--                                <h3>Track Time on Workwise</h3>--%>
                            <%--                                <span>Pay only for the Hours worked</span>--%>
                            <%--                                <div class="sign_link">--%>
                            <%--                                    <h3>--%>
                            <%--                                        <a href="sign-in.html" title="">Sign up</a>--%>
                            <%--                                    </h3>--%>
                            <%--                                    <a href="#" title="">Learn More</a>--%>
                            <%--                                </div>--%>
                            <%--                            </div>--%>
                            <%--                            <div class="widget widget-jobs">--%>
                            <%--                                <div class="sd-title">--%>
                            <%--                                    <h3>Top Jobs</h3>--%>
                            <%--                                    <i class="la la-ellipsis-v"></i>--%>
                            <%--                                </div>--%>
                            <%--                                <div class="jobs-list">--%>
                            <%--                                    <div class="job-info">--%>
                            <%--                                        <div class="job-details">--%>
                            <%--                                            <h3>Senior Product Designer</h3>--%>
                            <%--                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing--%>
                            <%--                                                elit..</p>--%>
                            <%--                                        </div>--%>
                            <%--                                        <div class="hr-rate">--%>
                            <%--                                            <span>$25/hr</span>--%>
                            <%--                                        </div>--%>
                            <%--                                    </div>--%>
                            <%--                                    <div class="job-info">--%>
                            <%--                                        <div class="job-details">--%>
                            <%--                                            <h3>Senior UI / UX Designer</h3>--%>
                            <%--                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing--%>
                            <%--                                                elit..</p>--%>
                            <%--                                        </div>--%>
                            <%--                                        <div class="hr-rate">--%>
                            <%--                                            <span>$25/hr</span>--%>
                            <%--                                        </div>--%>
                            <%--                                    </div>--%>
                            <%--                                    <div class="job-info">--%>
                            <%--                                        <div class="job-details">--%>
                            <%--                                            <h3>Junior Seo Designer</h3>--%>
                            <%--                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing--%>
                            <%--                                                elit..</p>--%>
                            <%--                                        </div>--%>
                            <%--                                        <div class="hr-rate">--%>
                            <%--                                            <span>$25/hr</span>--%>
                            <%--                                        </div>--%>
                            <%--                                    </div>--%>
                            <%--                                    <div class="job-info">--%>
                            <%--                                        <div class="job-details">--%>
                            <%--                                            <h3>Senior PHP Designer</h3>--%>
                            <%--                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing--%>
                            <%--                                                elit..</p>--%>
                            <%--                                        </div>--%>
                            <%--                                        <div class="hr-rate">--%>
                            <%--                                            <span>$25/hr</span>--%>
                            <%--                                        </div>--%>
                            <%--                                    </div>--%>
                            <%--                                    <div class="job-info">--%>
                            <%--                                        <div class="job-details">--%>
                            <%--                                            <h3>Senior Developer Designer</h3>--%>
                            <%--                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing--%>
                            <%--                                                elit..</p>--%>
                            <%--                                        </div>--%>
                            <%--                                        <div class="hr-rate">--%>
                            <%--                                            <span>$25/hr</span>--%>
                            <%--                                        </div>--%>
                            <%--                                    </div>--%>
                            <%--                                </div>--%>
                            <%--                            </div>--%>
                            <%--                            <div class="widget widget-jobs">--%>
                            <%--                                <div class="sd-title">--%>
                            <%--                                    <h3>Most Viewed This Week</h3>--%>
                            <%--                                    <i class="la la-ellipsis-v"></i>--%>
                            <%--                                </div>--%>
                            <%--                                <div class="jobs-list">--%>
                            <%--                                    <div class="job-info">--%>
                            <%--                                        <div class="job-details">--%>
                            <%--                                            <h3>Senior Product Designer</h3>--%>
                            <%--                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing--%>
                            <%--                                                elit..</p>--%>
                            <%--                                        </div>--%>
                            <%--                                        <div class="hr-rate">--%>
                            <%--                                            <span>$25/hr</span>--%>
                            <%--                                        </div>--%>
                            <%--                                    </div>--%>
                            <%--                                    <div class="job-info">--%>
                            <%--                                        <div class="job-details">--%>
                            <%--                                            <h3>Senior UI / UX Designer</h3>--%>
                            <%--                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing--%>
                            <%--                                                elit..</p>--%>
                            <%--                                        </div>--%>
                            <%--                                        <div class="hr-rate">--%>
                            <%--                                            <span>$25/hr</span>--%>
                            <%--                                        </div>--%>
                            <%--                                    </div>--%>
                            <%--                                    <div class="job-info">--%>
                            <%--                                        <div class="job-details">--%>
                            <%--                                            <h3>Junior Seo Designer</h3>--%>
                            <%--                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing--%>
                            <%--                                                elit..</p>--%>
                            <%--                                        </div>--%>
                            <%--                                        <div class="hr-rate">--%>
                            <%--                                            <span>$25/hr</span>--%>
                            <%--                                        </div>--%>
                            <%--                                    </div>--%>
                            <%--                                </div>--%>
                            <%--                            </div>--%>
                            <div class="widget suggestions full-width">
                                <div class="sd-title">
                                    <h3>Most Viewed People</h3>
                                    <i class="la la-ellipsis-v"></i>
                                </div>
                                <div class="suggestions-list">
                                    <c:forEach items="${users}" var="user">
                                        <div class="suggestion-usd">
                                            <img src="${pageContext.request.contextPath}/images/user.png" height="40"
                                                 width="40" alt="">
                                            <div class="sgt-text">
                                                <h4>${user.fullName}</h4>
                                                <span>Graphic Designer</span>
                                            </div>
                                            <span><i class="la la-plus"></i></span>
                                        </div>
                                    </c:forEach>
                                    <div class="view-more">
                                        <a href="#" title="">View More</a>
                                    </div>
                                </div>
                            </div>
                            <div class="widget suggestions full-width">
                                <div class="sd-title">
                                    <h3>TOP 10 ACTIFS</h3>
                                    <i class="la la-ellipsis-v"></i>
                                </div>
                                <div class="suggestions-list">
                                    <c:forEach items="${tops}" var="user">
                                        <div class="suggestion-usd">
                                            <img src="${pageContext.request.contextPath}/images/user.png" height="40"
                                                 width="40" alt="">
                                            <div class="sgt-text">
                                                <h4>${user.fullName}</h4>
                                                <span>${user.filiere}</span>
                                            </div>
                                            <span><i class="la la-plus"></i></span>
                                        </div>
                                    </c:forEach>
                                    <div class="view-more">
                                        <a href="#" title="">View More</a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<div class="modal fade" id="modalCreatePublication" role="dialog" data-backdrop="static"
     data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="post" action="${pageContext.request.contextPath}/homeGroupe?action=new-post">
                <div class="modal-header">
                    <h5 class="modal-title h3">Nouvelle Publication</h5>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="contenuPub">Contenu</label>
                        <textarea type="text" required="required" rows="3" class="form-control" id="contenuPub"
                                  name="contenuPub"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="selectGroupe">Groupe</label>
                        <select name="selectedGroupe" required class="form-control" id="selectGroupe" >
                            <option value="" disabled selected>Selectionner un groupe...</option>
                            <c:forEach items="${adherateGroupes}" var="groupe">
                                <option value="${groupe.id}">${groupe.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="d-flex justify-content-end">
                        <button type="button" class="btn btn-danger mr-1" data-dismiss="modal"><i
                                class="fa fa-times"></i>
                        </button>
                        <button type="submit" class="btn btn-success"><i class="fa fa-save"></i></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="modal fade" id="modalFollowingGroup" role="dialog" data-backdrop="static"
     data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel"
     aria-hidden="true" style="border-radius: 15px">
    <div class="modal-dialog" style="border-radius: 15px">
        <div class="modal-content border-0" style="border-radius: 15px">
            <form method="post" action="${pageContext.request.contextPath}/homeGroupe?action=new-post">
                <div class="modal-header text-white" style="background: #f4845c; padding: 0.5rem; border-radius: 14px 14px 0 0">
                    <h5 class="modal-title h5">Following Group</h5>
                </div>
                <div class="modal-body pt-0 pl-0 pr-0 pb-1">
                    <div class="text-secondary font-weight-bold pr-2 pl-2"  style="background-color: #d4d4d6">
                        ${totalFollowing} Groupes
                    </div>
                    <c:forEach items="${adherateGroupes}" var="groupe">
                        <div class="pr-2 pl-2" >
                            <div class="d-flex justify-content-between">
                                <div >
                                    <span class="text-secondary">${groupe.name}</span><br>
                                    <span class="text-black-50" ><i class="fa fa-user-circle"></i>&nbsp;${groupe.user.fullName} </span>
                                </div>
                                <div class="justify-content-center">
                                    <span class="text-warning
                                     h4">${groupe.adherents.size()}</span>
                                    <br>
                                    <span class="text-black-50 h6">Followors</span>
                                </div>
                            </div>

                        </div>

                    </c:forEach>

                </div>
                <div class="modal-footer">
                    <button  type="button" class="btn btn-secondary mr-1" data-dismiss="modal"><i
                            class="fa fa-ban"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
