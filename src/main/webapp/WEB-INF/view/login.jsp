<!DOCTYPE html>
<html lang="en">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        body {
            background-color: #ffffff;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .header {
            padding: 0.5rem 1rem;
            background: white;
            border-bottom: 1px solid #eee;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }
        .logo {
            height: 30px;
        }
        .header-icons {
            font-size: 1.2rem;
            color: #666;
        }
        .header-icons i {
            margin-left: 1rem;
            cursor: pointer;
        }
        .header-profile {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background: #ddd;
            margin-left: 1rem;
        }
        .main-content {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 60px;
        }
        .login-container {
            width: 100%;
            max-width: 400px;
            padding: 2rem;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.05);
        }
        .login-title {
            color: #702144;
            text-align: center;
            margin-bottom: 2rem;
            font-weight: 600;
        }
        .btn-login {
            background-color: #702144;
            border-color: #702144;
            width: 100%;
            padding: 0.5rem;
        }
        .btn-login:hover {
            background-color: #5a1a37;
            border-color: #5a1a37;
        }
        .forgot-password {
            color: #6c757d;
            text-decoration: none;
            font-size: 0.9rem;
        }
        .forgot-password:hover {
            color: #702144;
        }
        .form-label {
            font-weight: 500;
        }
    </style>
</head>
<body>
<!-- Header -->
<div class="header">
    <div class="d-flex justify-content-between align-items-center">
        <div class="d-flex align-items-center">
            <svg width="100" height="30" viewBox="0 0 100 30">
                <text x="0" y="20" fill="#702144" font-size="20" font-weight="bold">TrainingManagement</text>
            </svg>
        </div>
        <div class="d-flex align-items-center header-icons">
            <i class="bi bi-gear"></i>
            <i class="bi bi-bell"></i>
            <div class="header-profile"></div>
        </div>
    </div>
</div>

<!-- Main Content -->
<div class="main-content">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="login-container mx-auto">
                    <h2 class="login-title">Login</h2>
                    <form method="post" action="/login">
                        <c:if test="${param.error != null}">
                            <div class="my-2" style="color: red;">Invalid email or password.
                            </div>
                        </c:if>
                        <c:if test="${param.logout != null}">
                            <div class="my-2" style="color: green;">Logout Success.
                            </div>
                        </c:if>
                        <div class="mb-3">
                            <label for="userId" class="form-label">User ID</label>
                            <input type="text" class="form-control" type="email" id="userId" placeholder="Customer email / Admin email" name="username">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" type="password" id="password" placeholder="Password" name="password">
                        </div>
                        <div>
                            <input type="hidden" name="${_csrf.parameterName}"
                                   value="${_csrf.token}" />
                        </div>
                        <div class="mb-3 text-end">

                        </div>                        <button type="submit" class="btn btn-primary btn-login">Login</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS and Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>