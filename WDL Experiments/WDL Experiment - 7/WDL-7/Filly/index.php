<!DOCTYPE html>
<html lang="en">
<!--
    Author: Mega Satish
    GitHub: https://github.com/Mega-Satish
    Description: Web Designing Laboratory - Experiment 7: Prime Number Identifier (index.php)
    Task: Create a PHP-based form to identify prime numbers within a specified range.
-->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Prime Number Identifier using PHP">
    <meta name="author" content="Amey Thakur">
    <title>Prime Identifier | Mega Satish B-58</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header class="main-header">
        <h1>Web Designing Laboratory</h1>
        <h2>Experiment No. 07: Prime Number Identifier</h2>
    </header>

    <main class="container">
        <!-- Student Identification Section -->
        <section class="student-info">
            <table class="id-table">
                <tr>
                    <th>Name:</th>
                    <td>Mega Satish</td>
                    <th>Roll No:</th>
                    <td>B-58</td>
                </tr>
                <tr>
                    <th>Branch:</th>
                    <td>Computer Engineering</td>
                    <th>Semester:</th>
                    <td>V</td>
                </tr>
            </table>
        </section>

        <!-- Prime Number Input Form -->
        <section class="calculator-card">
            <h3>Prime Range Search</h3>
            <p class="description">Enter the range (start and end integers) to find all prime numbers between them.</p>
            
            <!-- 
                Form Action: Prime.php 
                Method: POST (securely sends data to the server)
                Validation: Handled via HTML5 'required' and PHP-side checks.
            -->
            <form name="Filly" action="Prime.php" method="POST" class="calc-form">
                <div class="form-group">
                    <label for="fn">First Integer (Start):</label>
                    <input type="number" id="fn" name="fn" placeholder="Enter First Number" required>
                </div>
                
                <div class="form-group">
                    <label for="ln">Last Integer (End):</label>
                    <input type="number" id="ln" name="ln" placeholder="Enter Last Number" required>
                </div>
                
                <div class="button-group">
                    <button type="submit" class="btn btn-submit">FIND PRIMES</button>
                    <button type="reset" class="btn btn-reset">RESET</button>
                </div>
            </form>
        </section>
    </main>

    <footer class="main-footer">
        <p>Mega Satish B-58 | TEC Computer Engineering</p>
    </footer>
</body>
</html>
