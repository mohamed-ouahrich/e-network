<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    response.setHeader("Cache-Control", "no-cache,no-store");
    if (session.getAttribute("user") == null) {%>
<jsp:forward page="/login"></jsp:forward>
<%}%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <%--    <link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet"/>--%>
    <%--    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet"/>--%>
    <link href="${pageContext.request.contextPath}/css/bootstrap-4.6.1-dist/bootstrap-4.6.1-dist/css/bootstrap.min.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/responsive.css" rel="stylesheet"/>

    <link href="${pageContext.request.contextPath}/css/fontawesome-free-5.15.4-web/css/all.css"
          rel="stylesheet">

    <title>Profile</title>
</head>

<body>
<%@include file="header.jsp" %>
<main>
    <div class="main-section ">
        <div class="container">
            <div class="main-section-data">
                <div class="row">
                    <div class="card col-lg-12 p-0">
                        <div class="card-header  d-flex justify-content-between align-items-center ">
                            <h2 class="text-dark h4 font-weight-bold">
                                Liste des profiles
                            </h2>
                            <button type="button" class="btn btn-success rounded-pill" data-toggle="modal"
                                    data-target="#modalCreateGroup"><i class="fa fa-plus"></i>Ajouter
                            </button>

                        </div>
                        <div class="card-body">
                            <table class="table table-striped table-groupe">
                                <thead class="header-table font-weight-bold ">
                                <tr>
                                    <th scope="col">Nom</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Filiére</th>
                                    <th scope="col">Date Création</th>
                                    <th scope="col">Groupe</th>
                                    <th scope="col"></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="profile" items="${profiles}">
                                    <tr>
                                        <th>${profile.fullName}</th>
                                        <td>${profile.gmail}</td>
                                        <td>${profile.filiere}</td>
                                        <td>${profile.dateCreation}</td>
                                        <td>${profile.groupe.name}</td>
                                        <td>
                                            <div class="float-right rounded-pill" role="group"
                                                 aria-label="Basic example">
                                                <button type="button" class="btn btn-secondary edit rounded-pill"
                                                        data-toggle="modal"
                                                        data-target="#modalEdit"><i
                                                        class="fa fa-edit"></i>Modifier
                                                </button>
                                                <button type="button" class="btn btn-danger delete rounded-pill"
                                                        data-toggle="modal"
                                                        data-target="#modalDelete"><i class="fa fa-trash"></i>Supprimer
                                                </button>
                                                <input type="hidden" name="id" id="id" value="${groupe.id}"/>
                                                <input type="hidden" id="h-name" value="${groupe.name}"/>

                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>

                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>

</main>
<div class="modal fade" id="modalEdit" role="dialog" data-backdrop="static"
     data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="post" action="${pageContext.request.contextPath}/groupe?action=edit">
                <div class="modal-header">
                    <h5 class="modal-title">Modification du profile</h5>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="name">Nom Groupe</label>
                        <input type="text" required="required" class="form-control" id="edit-name" name="name">
                    </div>

                    <div class="d-flex justify-content-end">
                        <button type="button" class="btn btn-danger mr-1" data-dismiss="modal"><i
                                class="fa fa-times"></i>
                        </button>
                        <button type="submit" class="btn btn-success"><i class="fa fa-save"></i></button>
                        <input type="hidden" name="id" id="edit-h-id"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="modal fade" id="modalCreateGroup" role="dialog" data-backdrop="static"
     data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="post" action="${pageContext.request.contextPath}/groupe?action=new">
                <div class="modal-header">
                    <h5 class="modal-title h3">Ajout du profile</h5>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="name">Nom Groupe</label>
                        <input type="text" required="required" class="form-control" id="name" name="name">
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
<div class="modal fade" id="modalDelete" role="dialog" data-backdrop="static"
     data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="post" action="${pageContext.request.contextPath}/groupe?action=delete">
                <%--                <div class="modal-header">--%>
                <%--                    <h5 class="modal-title">Supression du grpupe</h5>--%>
                <%--                </div>--%>
                <div class="modal-body">
                    <div class="d-flex justify-content-lg-center m-2">
                        <span><i class="fa fa-times-circle fa-4x text-danger"></i></span>
                    </div>
                    <div class="d-flex justify-content-center m-2">
                        <p class="text-dark h2">êtes-vous sûr ?</p>
                    </div>
                    <div class="d-flex justify-content-center m-2">
                        <p class="text-secondary text-center h5">Voulez-vous vraiment supprimer ce profile ? Ce processus
                            ne peut pas être annulé.</p>
                    </div>

                    <div class="d-flex justify-content-center">
                        <button type="button" class="btn btn-outline-secondary mr-1" data-dismiss="modal"><i
                                class="fa fa-ban"></i>
                        </button>
                        <button type="submit" class="btn btn-lg btn-outline-danger"><i class="fa fa-trash"></i></button>
                        <input type="hidden" name="groupeID" id="groupeID"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/css/jquery.min.js"></script>
<script type="application/javascript"
        src="${pageContext.request.contextPath}/css/bootstrap-4.6.1-dist/bootstrap-4.6.1-dist/js/bootstrap.js"></script>
<script>
    $(document).ready(() => {
        $('.table-groupe .delete').on('click', function () {
            const id = $(this).parent().find('#id').val();
            $('#modalDelete #groupeID').val(id);
        })

        $('.table-groupe .edit').on('click', function () {
            const id = $(this).parent().find('#id').val();
            const name = $(this).parent().find('#h-name').val();
            $('#modalEdit #edit-h-id').val(id);
            $('#modalEdit #edit-name').val(name);
        })
    })

</script>
</html>
