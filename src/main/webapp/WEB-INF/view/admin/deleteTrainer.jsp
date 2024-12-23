<html lang="en">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Trainers Delete</title>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
                <style>
                    body {
                        font-family: Arial, sans-serif;
                    }

                    .sidebar {
                        background-color: #f8f9fa;
                        min-height: 100vh;
                    }

                    .sidebar .nav-link {
                        color: #000;
                        font-weight: bold;
                    }

                    .sidebar .nav-link.active {
                        background-color: #e0e0e0;
                    }

                    .table-actions {
                        display: flex;
                        gap: 5px;
                    }
                </style>
            </head>

            <body class="sb-nav-fixed">
                <div class="container-fluid bg-white border-bottom shadow-sm">
                    <div class="d-flex justify-content-between align-items-center py-2 px-4">
                        <!-- Left Section: Page Title -->
                        <div>
                            <h5 class="mb-0">Aerten</h5>
                        </div>

                        <!-- Right Section: Actions and Profile -->
                        <div class="d-flex align-items-center">
                            <!-- Export Button -->




                            <!-- Profile Icon -->
                            <div class="dropdown">
                                <button class="btn btn-light dropdown-toggle d-flex align-items-center" type="button"
                                    id="profileDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                    <img src="https://via.placeholder.com/40" alt="Profile" class="rounded-circle me-2"
                                        width="40" height="40" />
                                    <c:out value="${sessionScope.email}" />
                                </button>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profileDropdown">
                                    <li>
                                        <form method="post" action="/logout">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <button class="dropdown-item">Logout</button>
                                        </form>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container-fluid px-3">
                    <div class="row">
                        <nav class="col-md-2 d-none d-md-block sidebar p-3">
                            <h5>Admin Dashboard</h5>
                            <ul class="nav flex-column mt-4">
                                <li class="nav-item">
                                    <a class="nav-link" href="">Trainers</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/admin/trainee">Trainees</a>
                                </li>
                            </ul>
                        </nav>
                        <div class="col-md-10" id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-3">
                                    <h1 class="mt-4">Delete Trainer</h1>
                                    <div class="mt-5">
                                        <div class="row">
                                            <div class="mx-auto">
                                                <h3 class="border-bottom border-2 border-light">Delete Trainer With ID
                                                    ${id}</h3>
                                                <div class="alert alert-danger" role="alert">
                                                    Please confirm that you want to delete trainer ${id}
                                                </div>
                                                <form:form method="post" action="/admin/trainer/delete"
                                                    modelAttribute="trainer">
                                                    <div class="mb-3" style="display:none">
                                                        <label for="exampleInputPassword1" class="form-label">ID</label>
                                                        <form:input type="text" class="form-control" path="id"
                                                            value="${id}" />
                                                    </div>
                                                    <button class="btn btn-danger">Delete</button>
                                                </form:form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </main>
                        </div>
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/scripts.js"></script>

            </body>

</html>