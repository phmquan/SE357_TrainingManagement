<!DOCTYPE html>
<html lang="en">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Trainers Overview</title>
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
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link " href="/admin/trainer">Admin Dashboard</a>
                                </li>
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
                        <main class="col-md-10 ms-sm-auto px-md-4 ">
                            <div class="container">
                                <div class="col-12 mx-auto">
                                    <h3 class="d-flex justify-content-between align-items-center mt-4">Create a Trainee
                                    </h3>
                                    <form:form method="post" action="/admin/trainee/create" modelAttribute="newTrainee"
                                        enctype="multipart/form-data">
                                        <div class="row g-3">
                                            <c:set var="errorEmail">
                                                <form:errors path="user.email" cssClass="invalid-feedback" />
                                            </c:set>
                                            <div class="col mb-3">
                                                <label for="exampleInputEmail1" class="form-label">Email
                                                    address</label>
                                                <form:input type="email"
                                                    class="form-control ${not empty errorEmail ? 'is-invalid':''}"
                                                    path="user.email" />
                                                ${errorEmail}
                                            </div>
                                            <div class="col mb-3">
                                                <c:set var="errorPassword">
                                                    <form:errors path="user.password" cssClass="invalid-feedback" />
                                                </c:set>
                                                <label for="exampleInputPassword1" class="form-label">Password</label>
                                                <form:input type="password"
                                                    class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                                    path="user.password" />
                                                ${errorPassword}
                                            </div>
                                        </div>
                                        <div class="row g-3">
                                            <div class="col mb-3">
                                                <c:set var="errorFullName">
                                                    <form:errors path="user.fullName" cssClass="invalid-feedback" />
                                                </c:set>
                                                <label for="exampleInputPassword1" class="form-label">Full
                                                    Name</label>
                                                <form:input type="text"
                                                    class="form-control ${not empty errorFullName ? 'is-invalid':''}"
                                                    path="user.fullName" />
                                                ${errorFullName}
                                            </div>

                                            <div class="col mb-3">
                                                <label for="exampleInputPassword1" class="form-label">Phone</label>
                                                <form:input type="text" class="form-control" path="user.phone" />
                                            </div>
                                        </div>

                                        <div class="mb-3">
                                            <label for="exampleInputPassword1" class="form-label">Address</label>
                                            <form:input type="text" class="form-control" path="user.address" />
                                        </div>
                                        <div class="row g-3">
                                            <div class="mb-3 col">
                                                <label class="mb-2">Role: </label>
                                                <form:select class="form-select col" path="user.role.id">
                                                    <option selected></option>
                                                    <form:option value="3">TRAINEE</form:option>
                                                </form:select>
                                            </div>
                                            <div class="mb-3 col">
                                                <label class="mb-2">Membership: </label>
                                                <form:select class="form-select col" path="membership">
                                                    <option selected></option>
                                                    <form:option value="Basic">BASIC</form:option>
                                                    <form:option value="Professional">PROFESSIONAL</form:option>
                                                </form:select>
                                            </div>
                                        </div>


                                        <div class="col-12 mb-5">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </form:form>
                                </div>
                            </div>


                        </main>
                    </div>
                </div>


            </body>

</html>