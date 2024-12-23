<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
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

        /* Main Content */
        .content {
            padding: 20px;
        }

        .today-schedule,
        .assigned-trainees,
        .questions {
            background-color: #fff;
            border-radius: 10px;
            padding: 15px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        /* Trainee avatars */
        .trainee-avatar {
            width: 40px;
            height: 40px;
            line-height: 40px;
            text-align: center;
            background-color: #ffe6e6;
            border-radius: 50%;
            font-weight: 700;
            color: #a0522d;
            margin-right: 10px;
        }

        .question-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 10px;
            margin-bottom: 10px;
        }

        /* Schedule cards */
        .schedule-card {
            border-left: 5px solid;
            border-radius: 10px;
            margin-bottom: 10px;
            padding: 10px;
        }

        .legs-training {
            border-color: #28a745;
        }

        .abs-training {
            border-color: #007bff;
        }

        .cardio {
            border-color: #dc3545;
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
</head>

<body>
    <div class="container-fluid">
        <div class="header-bar d-flex justify-content-between align-items-center">
            <!-- Logo -->
            <h4 class=" mb-4">Aerten</h4>

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
                        <a class="nav-link active" href="#">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Schedule</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/trainer/exercise">Exercises</a>
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
            <main class="col-md-10 content">
                <!-- Today's Schedule -->
                <section class="today-schedule">
                    <h5>Today's Schedule</h5>
                    <div class="schedule-card legs-training">
                        <strong>Tom Hanks</strong><br>
                        08:00 - 10:00<br>
                        Legs Training
                    </div>
                    <div class="schedule-card abs-training">
                        <strong>Chris Evans</strong><br>
                        13:00 - 15:00<br>
                        Abs Training
                    </div>
                    <div class="schedule-card cardio">
                        <strong>Lebron James</strong><br>
                        13:00 - 15:00<br>
                        Cardio
                    </div>
                </section>

                <!-- Assigned Trainees -->
                <section class="assigned-trainees">
                    <h5>Assigned Trainees</h5>
                    <div class="d-flex">
                        <div class="trainee-avatar">TH</div>
                        <div class="trainee-avatar">TH</div>
                        <div class="trainee-avatar">TH</div>
                        <div class="trainee-avatar">TH</div>
                        <div class="trainee-avatar">TH</div>
                    </div>
                </section>

                <!-- Questions Section -->
                <section class="questions">
                    <h5>Questions</h5>
                    <div class="question-card">
                        <strong>Tom Hanks</strong>
                        <p>Hi coach, Lebron and I went hooping yesterday and I broke my ankle. Can you recommend a
                            better routine for me to whoop his ahh?</p>
                    </div>
                    <div class="question-card">
                        <strong>Tom Hanks</strong>
                        <p>Hi coach, Lebron and I went hooping yesterday and I broke my ankle. Can you recommend a
                            better routine for me to whoop his ahh?</p>
                    </div>
                    <div class="question-card">
                        <strong>Tom Hanks</strong>
                        <p>Hi coach, Lebron and I went hooping yesterday and I broke my ankle. Can you recommend a
                            better routine for me to whoop his ahh?</p>
                    </div>
                    <button class="btn btn-primary">Reply</button>
                </section>
            </main>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>