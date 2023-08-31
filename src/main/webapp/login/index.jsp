<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" isELIgnored="false" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link href="${pageContext.request.contextPath}/css/bootstrap-4.6.1-dist/bootstrap-4.6.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/fontawesome-free-5.15.4-web/css/all.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/css/jquery.min.js"></script>
    <script type="application/javascript"
            src="${pageContext.request.contextPath}/css/bootstrap-4.6.1-dist/bootstrap-4.6.1-dist/js/bootstrap.js"></script>
    <script>
        /*global $, document, window, setTimeout, navigator, console, location*/
        $(document).ready(function () {
            $(".alert").delay(4000).slideUp(200, function() {
                $(this).alert('close');
            });

            'use strict';

            var usernameError = true,
                emailError = true,
                passwordError = true,
                passConfirm = true;

            // Detect browser for css purpose
            if (navigator.userAgent.toLowerCase().indexOf('firefox') > -1) {
                $('.form form label').addClass('fontSwitch');
            }

            // Label effect
            $('input').focus(function () {

                $(this).siblings('label').addClass('active');
            });

            // Form validation
            $('input').blur(function () {

                // User Name
                if ($(this).hasClass('name')) {
                    if ($(this).val().length === 0) {
                        $(this).siblings('span.error').text('Please type your full name').fadeIn().parent('.form-group').addClass('hasError');
                        usernameError = true;
                    } else if ($(this).val().length > 1 && $(this).val().length <= 6) {
                        $(this).siblings('span.error').text('Please type at least 6 characters').fadeIn().parent('.form-group').addClass('hasError');
                        usernameError = true;
                    } else {
                        $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                        usernameError = false;
                    }
                }
                // Email
                if ($(this).hasClass('email')) {
                    if ($(this).val().length == '') {
                        $(this).siblings('span.error').text('Please type your email address').fadeIn().parent('.form-group').addClass('hasError');
                        emailError = true;
                    } else {
                        $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                        emailError = false;
                    }
                }

                // PassWord
                if ($(this).hasClass('pass')) {
                    if ($(this).val().length < 8) {
                        $(this).siblings('span.error').text('Please type at least 8 charcters').fadeIn().parent('.form-group').addClass('hasError');
                        passwordError = true;
                    } else {
                        $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                        passwordError = false;
                    }
                }

                // PassWord confirmation
                if ($('.pass').val() !== $('.passConfirm').val()) {
                    $('.passConfirm').siblings('.error').text('Passwords don\'t match').fadeIn().parent('.form-group').addClass('hasError');
                    passConfirm = false;
                } else {
                    $('.passConfirm').siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                    passConfirm = false;
                }

                // label effect
                if ($(this).val().length > 0) {
                    $(this).siblings('label').addClass('active');
                } else {
                    $(this).siblings('label').removeClass('active');
                }
            });


            // form switch
            $('a.switch').click(function (e) {
                $(this).toggleClass('active');
                e.preventDefault();

                if ($('a.switch').hasClass('active')) {
                    $(this).parents('.form-peice').addClass('switched').siblings('.form-peice').removeClass('switched');
                } else {
                    $(this).parents('.form-peice').removeClass('switched').siblings('.form-peice').addClass('switched');
                }
            });


            // Form submit
            // $('form.signup-form').submit(function (event) {
            //     event.preventDefault();
            //
            //     if (usernameError == true || emailError == true || passwordError == true || passConfirm == true) {
            //         $('.name, .email, .pass, .passConfirm').blur();
            //     } else {
            //         $('.signup, .login').addClass('switched');
            //
            //         setTimeout(function () {
            //             $('.signup, .login').hide();
            //         }, 700);
            //         setTimeout(function () {
            //             $('.brand').addClass('active');
            //         }, 300);
            //         setTimeout(function () {
            //             $('.heading').addClass('active');
            //         }, 600);
            //         setTimeout(function () {
            //             $('.success-msg p').addClass('active');
            //         }, 900);
            //         setTimeout(function () {
            //             $('.success-msg a').addClass('active');
            //         }, 1050);
            //         setTimeout(function () {
            //             $('.form').hide();
            //         }, 700);
            //     }
            // });

            // Reload page
            $('a.profile').on('click', function () {
                location.reload(true);
            });
        });

    </script>
</head>
<body>
<div class="container">
    <c:if test="${not empty errorMessage }">
        <div style="position: absolute; top: 5px;right: 5px" class="alert alert-danger" role="alert">
            ${errorMessage}
        </div>
    </c:if>
    <c:if test="${not empty succesMessage }">
        <div style="position: absolute; top: 5px;right: 5px" class="alert alert-success" role="alert">
                ${succesMessage}
        </div>
    </c:if>
    <section id="formHolder">

        <div class="row">

            <!-- Brand Box -->
            <div class="col-sm-6 brand">
                <a  class="logo">E-NETWORK <span class="text-dark">.</span></a>

                <div class="heading">
                    <h2>ENSIAS</h2>
                    <p>Restez connectés!</p>
                </div>

                <div class="success-msg">
                    <p>Great! You are one of our members now</p>
                    <a href="#" class="profile">Your Profile</a>
                </div>
            </div>


            <!-- Form Box -->
            <div class="col-sm-6 form">

                <!-- Login Form -->
                <div class="login form-peice ">

                    <form class="login-form" action="${pageContext.request.contextPath}/login?action=login" method="post">
                        <div class="form-group">
                            <label for="loginemail">Email Adderss</label>
                            <input type="email" name="loginemail" id="loginemail" required>
                        </div>

                        <div class="form-group">
                            <label for="loginPassword">Password</label>
                            <input type="password" name="loginPassword" id="loginPassword" required>
                        </div>

                        <div class="CTA">
                            <input type="submit" value="Login">
                            <a href="#" class="switch">je suis nouveau</a>
                        </div>
                    </form>
                </div><!-- End Login Form -->


                <!-- Signup Form -->
                <div class="signup form-peice switched">
                    <form class="signup-form" action="${pageContext.request.contextPath}/user?action=new" method="post">

                        <div class="form-group">
                            <label for="name">Full Name</label>
                            <input type="text" name="username" id="name" class="name">
                            <span class="error"></span>
                        </div>

                        <div class="form-group">
                            <label for="email">Email Adderss</label>
                            <input type="email" name="emailAdress" id="email" class="email">
                            <span class="error"></span>
                        </div>


                        <div class="form-group">
                            <label for="phone">Filière</label>
                            <select class="form-control" id="phone" name="filiere" required>
                                <option value="BI&A">Business Intelligence & Analytics</option>
                                <option value="GD">Génie de la Data</option>
                                <option value="GL">Génie Logiciel</option>
                                <option value="IDSIT">Ingénierie en Data Science and IOT</option>
                                <option value="SSI">Sécurité des Systèmes d'Information</option>
                                <option value="SSE">Smart System Engineering</option>
                                <option value="2SCL">Smart Supply Chain & Logitics</option>

                            </select>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" name="password" id="password" class="pass">
                            <span class="error"></span>
                        </div>

                        <div class="form-group">
                            <label for="passwordCon">Confirm Password</label>
                            <input type="password" name="passwordCon" id="passwordCon" class="passConfirm">
                            <span class="error"></span>
                        </div>

                        <div class="CTA">
                            <button class="btn btn-danger rounded-pill" type="submit" value="Signup Now" >Créer</button>
                            <a href="#" class="switch">j'ai un compte</a>
                        </div>
                    </form>
                </div><!-- End Signup Form -->
            </div>
        </div>

    </section>


    <footer>
        <p>
            &copy; <a href="http://mohmdhasan.tk" target="_blank">E.N.S.I.A.S</a>
        </p>
    </footer>

</div>
</body>
</html>
