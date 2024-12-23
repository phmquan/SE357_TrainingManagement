<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Design</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        /* Sidebar Styling */
        .sidebar {
            background-color: #ffffff;
            min-height: 100vh;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }

        .sidebar .nav-link {
            color: #333;
            font-weight: 500;
        }

        .sidebar .nav-link.active {
            background-color: #d4755e;
            color: white;
            border-radius: 8px;
        }

        /* Header Styling */
        .header-bar {
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            height: 60px;
            padding: 0 20px;
        }

        .avatar-img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            cursor: pointer;
        }

        .dropdown-menu {
            right: 0;
            left: auto;
            margin-top: 10px;
        }

        /* Main Content Styling */
        .content-wrapper {
            padding: 20px;
        }

        .schedule-card {
            background-color: #f5f7ff;
            border: 1px solid #d1e3ff;
            border-radius: 8px;
            padding: 10px;
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 10px;
        }

        .schedule-card span {
            background-color: #ffeed8;
            color: #d4755e;
            font-weight: bold;
            padding: 10px;
            border-radius: 50%;
        }

        /* Questions Section */
        .questions-card {
            background-color: #fff;
            border-radius: 8px;
            padding: 10px 15px;
            margin-bottom: 10px;
            border: 1px solid #e0e0e0;
        }

        .questions-card h6 {
            font-weight: bold;
        }

        .btn-create {
            background-color: #6c214e;
            color: #fff;
            border-radius: 8px;
        }
    </style>
</head>

<body>
    <!-- Main Container -->
    <div class="d-flex">
        <!-- Sidebar -->
        <div class="sidebar p-3">
            <h5 class="text-center mb-4">Aerten</h5>
            <nav class="nav flex-column">
                <a class="nav-link active" href="#"> <i class="bi bi-grid"></i> Dashboard</a>
                <a class="nav-link" href="#">Schedule</a>
                <a class="nav-link" href="#">Questions</a>
                <a class="nav-link" href="#">Settings</a>
            </nav>
        </div>

        <!-- Content Area -->
        <div class="w-100">
            <!-- Header -->
            <div class="header-bar d-flex justify-content-between align-items-center">
                <h6 class="m-0">Dashboard</h6>
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

            <!-- Main Content -->
            <div class="content-wrapper d-flex">
                <!-- Schedule -->
                <div class="col-md-6 pe-4">
                    <h5>Today Schedule</h5>
                    <div class="schedule-card">
                        <span>CE</span>
                        <div>
                            <h6 class="m-0">Chris Evans</h6>
                            <small>13:00 - 15:00</small><br>
                            <strong>Abs Training</strong>
                        </div>
                    </div>
                </div>

                <!-- Questions Section -->
                <div class="col-md-6">
                    <div class="d-flex justify-content-between align-items-center">
                        <h5>Questions</h5>
                        <button class="btn btn-create btn-sm">Create question ➡️</button>
                    </div>
                    <div class="questions-card">
                        <h6>Tom Hanks</h6>
                        <p>Hi coach, Lebron and I went hooping yesterday and that n broke my ankle. Can you recommend a
                            better routine for me to whoop his ahh?</p>
                    </div>
                    <div class="questions-card">
                        <h6>Tom Hanks</h6>
                        <p>Hi coach, Lebron and I went hooping yesterday and that n broke my ankle. Can you recommend a
                            better routine for me to whoop his ahh?</p>
                    </div>
                    <div class="questions-card">
                        <h6>Tom Hanks</h6>
                        <p>Hi coach, Lebron and I went hooping yesterday and that n broke my ankle. Can you recommend a
                            better routine for me to whoop his ahh?</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap Bundle JS (Includes Popper.js) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>