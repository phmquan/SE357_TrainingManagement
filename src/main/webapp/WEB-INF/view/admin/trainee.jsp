<!DOCTYPE html>
<html lang="en">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Trainee Overview</title>
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

            <body>
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
                <div class="container-fluid">

                    <div class="row">
                        <!-- Sidebar -->
                        <nav class="col-md-2 d-none d-md-block sidebar p-3">
                            <h5 class="">Admin Dashboard</h5>
                            <ul class="nav flex-column mt-4">
                                <li class="nav-item">
                                    <a class="nav-link " href="/admin/trainer">Trainers</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" href="/admin/trainee">Trainees</a>
                                </li>
                            </ul>
                        </nav>

                        <!-- Main Content -->
                        <main class="col-md-10 ms-sm-auto px-md-4">

                            <div class="d-flex justify-content-between align-items-center mt-4">
                                <h2>Trainees</h2>
                                <a href="/admin/trainee/create" class="btn btn-primary">+ New Trainer</a>
                            </div>

                            <div class="mt-3">

                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Phone number</th>
                                            <th scope="col">Assigned trainer</th>
                                            <th scope="col">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${trainees}" var="trainee">
                                            <tr>
                                                <td>${trainee.id}</td>
                                                <td>${trainee.user.fullName}</td>
                                                <td>${trainee.user.email}</td>
                                                <td>${trainee.user.phone}</td>
                                                <td>
                                                    ${trainee.trainer.user.fullName}
                                                </td>

                                                <td class="table-actions">
                                                    <a href="/admin/trainee/update/${trainee.id}"
                                                        class="btn btn-sm btn-primary">Edit</a>
                                                    <a href="/admin/trainee/delete/${trainee.id}"
                                                        class="btn btn-sm btn-danger">Delete</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <!-- Repeat rows for other trainers -->
                                    </tbody>
                                </table>
                            </div>

                            <!-- Pagination -->
                            <!-- <nav aria-label="Page navigation example" class="mt-4">
                                <ul class="pagination justify-content-center">
                                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                </ul>
                            </nav> -->
                        </main>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            </body>

</html>