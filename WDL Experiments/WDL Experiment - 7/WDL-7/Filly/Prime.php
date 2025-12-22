<!DOCTYPE html>
<html lang="en">
<!--
    Author: Amey Thakur
    GitHub: https://github.com/Amey-Thakur
    Repository: https://github.com/Amey-Thakur/WEB-DESIGNING-LAB
    Description: Web Designing Laboratory - Experiment 7: Prime Logic (Prime.php)
    Task: Calculate and display all prime numbers within a range received from index.php.
-->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prime Results | Amey Thakur</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header class="main-header">
        <h1>Web Designing Laboratory</h1>
        <h2>Experiment No. 07: Result</h2>
    </header>

    <main class="container">
        <section class="calculator-card result-card">
            <h3>Generated Prime Numbers</h3>

            <?php
            if ($_SERVER["REQUEST_METHOD"] == "POST") {
                // Capturing the range from index.php
                $n1 = isset($_POST['fn']) ? intval($_POST['fn']) : 0;
                $n2 = isset($_POST['ln']) ? intval($_POST['ln']) : 0;

                echo "<div class='result-display'>";
                echo "<p class='formula'>Range: <code>$n1 to $n2</code></p>";
                echo "<div class='prime-list'>";

                // Prime Number Generation Logic
                // A prime number is a natural number greater than 1 that is not a product of two smaller natural numbers.
                for ($i = $n1; $i <= $n2; $i++) {
                    // Smallest prime number is 2
                    if ($i < 2) continue;

                    $isPrime = true;
                    // Check for primality
                    // We check if $i is divisible by any number from 2 up to the square root of $i
                    for ($j = 2; $j <= sqrt($i); $j++) {
                        if ($i % $j == 0) {
                            $isPrime = false;
                            break;
                        }
                    }

                    if ($isPrime) {
                        echo "<span class='prime-num'>$i</span> ";
                    }
                }

                echo "</div>"; // Close prime-list
                echo "</div>"; // Close result-display
                
                echo "<p class='logic-note'><strong>Logic:</strong> This script iterates through each integer in the given range and verifies if it has any divisors other than 1 and itself using a standard trial division algorithm.</p>";
            } else {
                echo "<p class='error'>No data received. Please use the form.</p>";
            }
            ?>

            <div class="button-group" style="justify-content: center; max-width: 200px; margin: 30px auto 0;">
                <a href="index.php" class="btn btn-submit" style="text-decoration: none; display: block; text-align: center;">GO BACK</a>
            </div>
        </section>
    </main>

    <footer class="main-footer">
        <p>Amey Thakur B-50 | TEC Computer Engineering</p>
    </footer>

    <style>
        .result-display {
            background-color: #f0f7ff;
            border-left: 5px solid #263dd4;
            padding: 20px;
            margin: 20px 0;
            border-radius: 4px;
            text-align: center;
        }
        .prime-list {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            justify-content: center;
            margin-top: 20px;
        }
        .prime-num {
            background: #263dd4;
            color: white;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 1rem;
            font-weight: 600;
        }
        .formula { color: #666; font-size: 1.1rem; }
        .logic-note { font-size: 0.9rem; color: #777; font-style: italic; margin-top: 25px; line-height: 1.4; }
    </style>
</body>
</html>
