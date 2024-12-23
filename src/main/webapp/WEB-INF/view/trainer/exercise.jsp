<!DOCTYPE html>
<html lang="en">

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
            <main class="col-md-10 content ">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h2>Exercises</h2>
                    <a href="/trainer/exercise/create" class="btn btn-primary">New Exercise</a>
                </div>

                <!-- Exercise Cards -->
                <div class="exercise-card">
                    <div class="exercise-details">
                        <img src="https://images.squarespace-cdn.com/content/v1/5ffcea9416aee143500ea103/1638119148144-BDOC8L97ARVAS5BWW9ZQ/Incline%2BDumbbell%2BFly.jpeg"
                            alt="Exercise" class="exercise-image">
                        <div>
                            <strong>Dumbbell fly</strong><br>
                            <span>Chest</span>
                        </div>
                    </div>
                    <button class="btn btn-sm btn-outline-secondary">
                        <i class="bi bi-pencil"></i>
                    </button>
                </div>

                <div class="exercise-card">
                    <div class="exercise-details">
                        <img src="https://static.strengthlevel.com/images/exercises/squat/squat-800.jpg" alt="Exercise"
                            class="exercise-image">
                        <div>
                            <strong>Squat</strong><br>
                            <span>Legs</span>
                        </div>
                    </div>
                    <button class="btn btn-sm btn-outline-secondary">
                        <i class="bi bi-pencil"></i>
                    </button>
                </div>

                <div class="exercise-card">
                    <div class="exercise-details">
                        <img src="https://cdn-0.weighttraining.guide/wp-content/uploads/2016/11/incline-dumbbell-bench-press-resized.png?ezimgfmt=ng%3Awebp%2Fngcb4"
                            alt="Exercise" class="exercise-image">
                        <div>
                            <strong>Dumbbell bench press</strong><br>
                            <span>Chest</span>
                        </div>
                    </div>
                    <button class="btn btn-sm btn-outline-secondary">
                        <i class="bi bi-pencil"></i>
                    </button>
                </div>

                <div class="exercise-card">
                    <div class="exercise-details">
                        <img src="https://cdn.shopify.com/s/files/1/1497/9682/files/2_a09de347-1652-4b84-96bf-fdc8bbc42481.jpg?v=1648825457"
                            alt="Exercise" class="exercise-image">
                        <div>
                            <strong>Barbell bench press</strong><br>
                            <span>Chest</span>
                        </div>
                    </div>
                    <button class="btn btn-sm btn-outline-secondary">
                        <i class="bi bi-pencil"></i>
                    </button>
                </div>

                <div class="exercise-card">
                    <div class="exercise-details">
                        <img src="https://www.endomondo.com/wp-content/uploads/2024/02/Standing-Dumbbell-Lateral-Shoulder-Raises-2.jpg"
                            alt="Exercise" class="exercise-image">
                        <div>
                            <strong>Dumbbell fly</strong><br>
                            <span>Chest</span>
                        </div>
                    </div>
                    <button class="btn btn-sm btn-outline-secondary">
                        <i class="bi bi-pencil"></i>
                    </button>
                </div>
            </main>
        </div>
    </div>

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet" />

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>