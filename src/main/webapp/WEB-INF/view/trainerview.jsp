<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trainers Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        :root {
            --primary-color: #702144;
            --sidebar-width: 240px;
        }
        body {
            min-height: 100vh;
            background-color: #f8f9fa;
        }
        .header {
            height: 60px;
            background: white;
            border-bottom: 1px solid #eee;
            padding: 0.5rem 1rem;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }
        .sidebar {
            width: var(--sidebar-width);
            background: white;
            border-right: 1px solid #eee;
            height: calc(100vh - 60px);
            position: fixed;
            top: 60px;
            padding-top: 1rem;
        }
        .main-content {
            margin-left: var(--sidebar-width);
            margin-top: 60px;
            padding: 2rem;
        }
        .nav-item {
            padding: 0.5rem 1rem;
            margin-bottom: 0.5rem;
        }
        .nav-item.active {
            background-color: #8B4513;
            color: white;
            border-radius: 5px;
        }
        .nav-item i {
            margin-right: 10px;
        }
        .table-container {
            background: white;
            border-radius: 10px;
            padding: 1rem;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
        }
        .status-badge {
            padding: 0.25rem 0.75rem;
            border-radius: 20px;
            font-size: 0.875rem;
        }
        .status-active {
            background-color: #e8f5e9;
            color: #2e7d32;
        }
        .status-inactive {
            background-color: #ffebee;
            color: #c62828;
        }
        .btn-new-trainer {
            background-color: var(--primary-color);
            color: white;
        }
        .trainer-avatar {
            width: 32px;
            height: 32px;
            border-radius: 50%;
        }
        .header-profile {
            width: 32px;
            height: 32px;
            border-radius: 50%;
        }
        .table th {
            color: #666;
            font-weight: 500;
        }
        .pagination {
            margin-bottom: 0;
        }
        .search-box {
            max-width: 400px;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
<!-- Header -->
<div class="header">
    <div class="d-flex justify-content-between align-items-center">
        <div class="d-flex align-items-center">
            <svg width="100" height="30" viewBox="0 0 100 30">
                <text x="0" y="20" fill="#702144" font-size="20" font-weight="bold">Aerten</text>
            </svg>
        </div>
        <div class="d-flex align-items-center">
            <i class="bi bi-gear me-3"></i>
            <i class="bi bi-bell me-3"></i>
            <div class="header-profile bg-secondary"></div>
        </div>
    </div>
</div>

<!-- Sidebar -->
<div class="sidebar">
    <div class="nav flex-column">
        <div class="nav-item active">
            <i class="bi bi-person-workspace"></i>
            Trainers
        </div>
        <div class="nav-item">
            <i class="bi bi-people"></i>
            Trainees
        </div>
        <div class="nav-item">
            <i class="bi bi-gear"></i>
            Settings
        </div>
    </div>
</div>

<!-- Main Content -->
<div class="main-content">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h4 class="mb-1">Trainers <span class="badge bg-secondary">10</span></h4>
        </div>
        <div class="d-flex gap-2">
            <button class="btn btn-outline-secondary">
                <i class="bi bi-download me-2"></i>Export
            </button>
            <button class="btn btn-new-trainer">
                <i class="bi bi-plus me-2"></i>New Trainer
            </button>
        </div>
    </div>

    <div class="table-container">
        <div class="d-flex justify-content-between mb-4">
            <div class="search-box">
                <div class="input-group">
                        <span class="input-group-text bg-transparent border-end-0">
                            <i class="bi bi-search"></i>
                        </span>
                    <input type="text" class="form-control border-start-0" placeholder="Search Employee by name, ID or any related keywords">
                </div>
            </div>
            <div class="d-flex gap-2">
                <button class="btn btn-outline-secondary">
                    <i class="bi bi-funnel"></i>
                </button>
                <button class="btn btn-outline-secondary">
                    <i class="bi bi-grid"></i>
                </button>
            </div>
        </div>

        <table class="table">
            <thead>
            <tr>
                <th>
                    <input type="checkbox" class="form-check-input">
                </th>
                <th>Name</th>
                <th>Employee ID</th>
                <th>Password</th>
                <th>Status</th>
                <th>Assigned Trainees</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    <input type="checkbox" class="form-check-input">
                </td>
                <td>
                    <div class="d-flex align-items-center">
                        <img src="/api/placeholder/32/32" class="trainer-avatar me-2" alt="Trainer">
                        <div>
                            <div>Tanner Finsha</div>
                            <small class="text-muted">@TannerFisher@gmail.com</small>
                        </div>
                    </div>
                </td>
                <td>#23454GH6J7YT6</td>
                <td>@12bill|123</td>
                <td>
                    <span class="status-badge status-active">Active</span>
                </td>
                <td>#223112312312123</td>
                <td>
                    <div class="dropdown">
                        <button class="btn btn-link" data-bs-toggle="dropdown">
                            <i class="bi bi-three-dots-vertical"></i>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Edit</a></li>
                            <li><a class="dropdown-item" href="#">Assign</a></li>
                            <li><a class="dropdown-item" href="#">Delete</a></li>
                        </ul>
                    </div>
                </td>
            </tr>
            <!-- Add more rows as needed -->
            </tbody>
        </table>

        <div class="d-flex justify-content-between align-items-center mt-4">
            <button class="btn btn-outline-secondary">
                <i class="bi bi-arrow-left me-2"></i>Previous
            </button>
            <ul class="pagination">
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><span class="page-link">...</span></li>
                <li class="page-item"><a class="page-link" href="#">8</a></li>
                <li class="page-item"><a class="page-link" href="#">9</a></li>
                <li class="page-item"><a class="page-link" href="#">10</a></li>
            </ul>
            <button class="btn btn-outline-secondary">
                Next<i class="bi bi-arrow-right ms-2"></i>
            </button>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>