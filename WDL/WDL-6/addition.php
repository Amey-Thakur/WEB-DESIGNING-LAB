<!DOCTYPE html>
<html lang="en">
<!--
    Author: Amey Thakur
    GitHub: https://github.com/Amey-Thakur
    Repository: https://github.com/Amey-Thakur/WEB-DESIGNING-LAB
    Description: Web Designing Laboratory - Experiment 6: PHP Introduction (addition.php)
    Task: Process the POST request from index.html, perform addition, and display results.
-->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP Result | Addition</title>
    <!-- Linking shared stylesheet for consistent UI -->
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>
    <header class="main-header">
        <h1>Web Designing Laboratory</h1>
        <h2>Experiment No. 06: Result</h2>
    </header>

    <main class="container">
        <!-- Results Card to display the calculation output -->
        <section class="calculator-card result-card">
            <h3>Arithmetic Addition Result</h3>
            
            <?php
            // Server-side logic to handle the form data
            // Checking if the script was accessed via a POST request
            if ($_SERVER["REQUEST_METHOD"] == "POST") {
                // Retrieving values from the $_POST superglobal
                // isset() checks if the keys exist; intval() converts input to integers for safety
                $val1 = isset($_POST['num1']) ? intval($_POST['num1']) : 0;
                $val2 = isset($_POST['num2']) ? intval($_POST['num2']) : 0;

                // Simple arithmetic addition logic
                $sum = $val1 + $val2;

                // Rendering the result section with dynamic data
                echo "<div class='result-display'>";
                echo "<p class='formula'>Operation: <code>$val1 + $val2</code></p>";
                echo "<div class='final-sum'>Sum: <span>$sum</span></div>";
                echo "</div>";
                
                // Educational note explaining the PHP operation
                echo "<p class='logic-note'><strong>Logic:</strong> This program utilizes the standard arithmetic addition operator <code>+</code> to compute the sum of integers captured from the global <code>\$_POST</code> array.</p>";
            } else {
                // Error handling for direct script access without form submission
                echo "<p class='error'>Invalid request method. Please access this page through the provided form.</p>";
            }
            ?>

            <!-- Navigation back to the input form -->
            <div class="button-group" style="justify-content: center; max-width: 200px; margin: 30px auto 0;">
                <a href="index.html" class="btn btn-submit" style="text-decoration: none; display: block; text-align: center;">GO BACK</a>
            </div>
        </section>
    </main>

    <footer class="main-footer">
        <p>Amey Thakur B-50 | TEC Computer Engineering</p>
    </footer>

    <!-- Result-specific styling -->
    <style>
        .result-display {
            background-color: #f0f7ff;
            border-left: 5px solid var(--primary-color);
            padding: 20px;
            margin: 20px 0;
            border-radius: 4px;
        }
        .formula {
            font-size: 1.1rem;
            color: var(--secondary-color);
            margin-bottom: 10px;
        }
        .final-sum {
            font-size: 2rem;
            font-weight: 600;
            color: var(--text-color);
        }
        .final-sum span {
            color: var(--success-color);
        }
        .logic-note {
            font-size: 0.9rem;
            color: #666;
            font-style: italic;
            margin-top: 20px;
        }
        .error {
            color: #ff0000;
            font-weight: bold;
        }
    </style>
</body>
</html>
