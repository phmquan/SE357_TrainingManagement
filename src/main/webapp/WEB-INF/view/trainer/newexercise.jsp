<!DOCTYPE html>
<html lang="en">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Exercises Page</title>
                <!-- Bootstrap CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
                <!-- Custom CSS -->
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        background-color: #f8f9fa;
                    }

                    /* Sidebar */
                    .sidebar {
                        background-color: #fff;
                        height: 100vh;
                        border-right: 1px solid #ddd;
                    }

                    .sidebar .nav-link {
                        color: #333;
                        font-weight: 500;
                    }

                    .sidebar .active {
                        background-color: #a0522d;
                        color: #fff !important;
                        border-radius: 5px;
                    }

                    /* Content Section */
                    .content {
                        padding: 30px;
                    }

                    .exercise-card {
                        border: 1px solid #ddd;
                        border-radius: 10px;
                        padding: 10px;
                        display: flex;
                        align-items: center;
                        justify-content: space-between;
                        margin-bottom: 15px;
                        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                        background-color: #fff;
                    }

                    .exercise-details {
                        display: flex;
                        align-items: center;
                    }

                    .exercise-image {
                        width: 50px;
                        height: 50px;
                        object-fit: cover;
                        margin-right: 15px;
                    }

                    .btn-new-exercise {
                        position: absolute;
                        top: 20px;
                        right: 20px;
                        background-color: #a0522d;
                        color: white;
                    }

                    .btn-new-exercise:hover {
                        background-color: #822b15;
                        color: white;
                    }

                    .header-bar {
                        background-color: #fff;
                        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                        height: 60px;
                        display: flex;
                        align-items: center;
                        justify-content: space-between;
                        padding: 0 20px;
                    }

                    /* Avatar image styling */
                    .avatar-img {
                        width: 40px;
                        height: 40px;
                        border-radius: 50%;
                        object-fit: cover;
                        cursor: pointer;
                    }

                    /* Dropdown menu */
                    .dropdown-menu {
                        right: 10px;
                        left: auto;
                        margin-top: 10px;
                    }
                </style>
                <script>
                    function previewPictures(event) {
                        const files = event.target.files;
                        const previewContainer = document.getElementById('picturePreview');
                        previewContainer.innerHTML = ''; // Clear previous previews

                        Array.from(files).forEach(file => {
                            const reader = new FileReader();
                            reader.onload = function (e) {
                                const img = document.createElement('img');
                                img.src = e.target.result;
                                img.classList.add('img-thumbnail', 'm-2');
                                img.style.width = '150px';
                                img.style.height = '150px';
                                previewContainer.appendChild(img);
                            }
                            reader.readAsDataURL(file);
                        });
                    }
                </script>
            </head>

            <body>
                <div class="container-fluid">
                    <div class="header-bar d-flex justify-content-between align-items-center">
                        <!-- Logo -->
                        <h4 class="mb-4">Aerten</h4>

                        <!-- Avatar Dropdown -->
                        <div class="dropdown">
                            <img src="https://via.placeholder.com/40" alt="Avatar" class="avatar-img dropdown-toggle"
                                id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton">
                                <li><a class="dropdown-item" href="#">Account Info</a></li>
                                <li>
                                    <form method="post" action="/logout">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <button class="dropdown-item">Logout</button>
                                    </form>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="row">
                        <!-- Sidebar -->
                        <nav class="col-md-2 sidebar d-flex flex-column p-3">

                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="/trainer">Dashboard</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Schedule</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" href="#">Exercises</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Trainees</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Questions</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Settings</a>
                                </li>
                            </ul>
                        </nav>

                        <!-- Main Content -->
                        <main class="col-md-10 ms-sm-auto px-md-4">

                            <div class="container">
                                <div class="d-flex justify-content-between align-items-center mt-4">
                                    <h2>Create Exercises</h2>
                                </div>
                                <div class="col-12 mx-auto">

                                    <form:form method="post" action="/trainer/exercise/create"
                                        modelAttribute="newExercise" enctype="multipart/form-data">
                                        <div class="row g-3">
                                            <c:set var="errorExerciseTitle">
                                                <form:errors path="title" cssClass="invalid-feedback" />
                                            </c:set>
                                            <div class="col mb-3">
                                                <label for="exampleInputEmail1" class="form-label">Exercise
                                                    title</label>
                                                <form:input type="title"
                                                    class="form-control ${not empty errorExerciseTitle ? 'is-invalid':''}"
                                                    path="title" />
                                                ${errorExerciseTitle}
                                            </div>
                                            <div class="col mb-3">
                                                <c:set var="errorDescription">
                                                    <form:errors path="description" cssClass="invalid-feedback" />
                                                </c:set>
                                                <label for="exampleInputPassword1"
                                                    class="form-label">Description</label>
                                                <form:input
                                                    class="form-control ${not empty errorDescription ? 'is-invalid' : ''}"
                                                    path="description" />
                                                ${errorDescription}
                                            </div>
                                        </div>
                                        <div class="mb-3 col-12 col-md-6">
                                            <label for="avatarFile" class="form-label">Upload Picture:</label>
                                            <input class="form-control" type="file" id="avatarFile"
                                                accept=".png, .jpg, .jpeg" name="descPicture" multiple />
                                        </div>
                                        <div class="col mb-3">
                                            <div id="picturePreview" class="d-flex flex-wrap"></div>
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

                <!-- Bootstrap Icons -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"
                    rel="stylesheet" />

                <!-- Bootstrap JS -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            </body>

</html>