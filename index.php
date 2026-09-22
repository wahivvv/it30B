arl
<?php

// Database connection
$host = 'localhost';
$db = 'it30b_lab_db';
$user = 'root';
$pass = '';
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";

$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
} catch (PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}

// Session
session_start();

// Determine current section
$SECTION = $_GET['section'] ?? 'students';

// Determine CRUD Operation
$ACTION = $_GET['action'] ?? '';


// =========================
// CREATE STUDENT
// =========================
if ($SECTION === 'students' && $ACTION === 'create') {

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {

        $firstName = trim($_POST['student_first_name'] ?? '');
        $lastName  = trim($_POST['student_last_name'] ?? '');
        $course    = trim($_POST['student_course'] ?? '');

        if ($firstName !== '' && $lastName !== '' && $course !== '') {

            $sql = "
                INSERT INTO students (
                    student_first_name,
                    student_last_name,
                    student_course
                )
                VALUES (?, ?, ?)
            ";

            $stmt = $pdo->prepare($sql);

            $stmt->execute([
                $firstName,
                $lastName,
                $course
            ]);

            // Go back to student list
            header("Location: index.php?section=students");
            exit;
        }
    }
}


// =========================
// FETCH STUDENTS
// =========================
if ($SECTION === 'students') {

    $stmt = $pdo->query("
        SELECT *
        FROM students
        ORDER BY student_id DESC
    ");

    $students = $stmt->fetchAll();
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Library System</title>
</head>

<body>

    <h1>Simple Library System</h1>

    <nav>
        <a href="index.php?section=students">Students</a> |
        <a href="index.php?section=books">Books</a> |
        <a href="index.php?section=borrow">Borrow</a>
    </nav>

    <hr>


    <!-- =========================
         STUDENT SECTION
    ========================== -->

    <?php if ($SECTION === 'students') : ?>

        <h1>Students</h1>

        <p>
            <a href="index.php?section=students&action=create">
                Add Student
            </a>
        </p>


        <!-- CREATE STUDENT FORM -->

        <?php if ($ACTION === 'create') : ?>

            <h2>Create Student</h2>

            <form method="POST">

                <p>
                    <label>First Name</label>
                    <br>

                    <input
                        type="text"
                        name="student_first_name"
                        required
                    >
                </p>


                <p>
                    <label>Last Name</label>
                    <br>

                    <input
                        type="text"
                        name="student_last_name"
                        required
                    >
                </p>


                <p>
                    <label>Course</label>
                    <br>

                    <input
                        type="text"
                        name="student_course"
                        required
                    >
                </p>


                <button type="submit">
                    Save
                </button>

                <a href="index.php?section=students">
                    Cancel
                </a>

            </form>


        <!-- STUDENT LIST -->

        <?php else : ?>

            <table border="1">

                <thead>

                    <tr>
                        <th>ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Course</th>
                        <th>Created at</th>
                        <th>Actions</th>
                    </tr>

                </thead>

                <tbody>

                    <?php foreach ($students as $student) : ?>

                        <tr>

                            <td>
                                <?= htmlspecialchars($student['student_id']) ?>
                            </td>

                            <td>
                                <?= htmlspecialchars($student['student_first_name']) ?>
                            </td>

                            <td>
                                <?= htmlspecialchars($student['student_last_name']) ?>
                            </td>

                            <td>
                                <?= htmlspecialchars($student['student_course']) ?>
                            </td>

                            <td>
                                <?= htmlspecialchars($student['student_created_at']) ?>
                            </td>

                            <td>
                                <a href="#">Edit</a>
                                <a href="#">Delete</a>
                            </td>

                        </tr>

                    <?php endforeach; ?>

                </tbody>

            </table>

        <?php endif; ?>

    <?php endif; ?>


    <!-- =========================
         BOOKS SECTION
    ========================== -->

    <?php if ($SECTION === 'books') : ?>

        <h1>Books</h1>

    <?php endif; ?>


    <!-- =========================
         BORROW SECTION
    ========================== -->

    <?php if ($SECTION === 'borrow') : ?>

        <h1>Borrow</h1>

    <?php endif; ?>


</body>

</html>