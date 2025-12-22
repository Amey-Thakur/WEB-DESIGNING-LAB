<!DOCTYPE html>
<html lang="en">
<!--
    Author: Amey Thakur
    GitHub: https://github.com/Amey-Thakur
    Repository: https://github.com/Amey-Thakur/WEB-DESIGNING-LAB
    Description: Web Designing Laboratory - Experiment 8: Data Insertion (insert.php)
    Task: Connect to MySQL database and insert registration data using prepared statements.
-->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Result | PHP & MySQL</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header class="main-header">
        <h1>Web Designing Laboratory</h1>
        <h2>Experiment No. 08: Result</h2>
    </header>

    <main class="container">
        <section class="calculator-card result-card">
            <h3>Database Action Status</h3>

            <?php
            // Capturing data from the POST request
            $Name = $_POST['Name'];
            $Password = $_POST['Password'];
            $Gender = $_POST['Gender'];
            $Email = $_POST['Email'];
            $Contact = $_POST['Contact'];
            $DOB = $_POST['DOB'];
            $Country = $_POST['Country'];

            // Server-side validation check
            if (!empty($Name) && !empty($Password) && !empty($Gender) && !empty($Email)) 
            {
                // Database Connection Configuration
                $host = "localhost";
                $dbUsername = "root";
                $dbPassword = "";
                $dbname = "filly";
                
                // 1. Establish MySQLi connection
                $conn = new mysqli($host, $dbUsername, $dbPassword, $dbname);
                
                if (mysqli_connect_error()) 
                {
                    echo "<p class='error'>Connection Failed: " . mysqli_connect_error() . "</p>";
                } 
                else 
                {
                    // 2. Prepare SQL queries to prevent SQL Injection
                    $SELECT = "SELECT email From form Where email = ? Limit 1";
                    $INSERT = "INSERT Into form (Name, Password, Gender, Email, Contact, DOB, Country) values(?, ?, ?, ?, ?, ?, ?)";
            
                    // 3. Execute Select statement to check for duplicates
                    $stmt = $conn->prepare($SELECT);
                    $stmt->bind_param("s", $Email);
                    $stmt->execute();
                    $stmt->bind_result($existingEmail);
                    $stmt->store_result();
                    $rnum = $stmt->num_rows;
                  
                    echo "<div class='result-display'>";
                    if ($rnum == 0) 
                    {
                        $stmt->close();
                        // 4. Prepare and bind the Insert statement
                        $stmt = $conn->prepare($INSERT);
                        // "ssssiis" corresponds to data types: string, string, string, string, int, int, string
                        // Note: Depending on your DB schema, phone/date might be strings or ints.
                        $stmt->bind_param("sssssss", $Name, $Password, $Gender, $Email, $Contact, $DOB, $Country);
                        
                        if ($stmt->execute()) {
                            echo "<div class='status success'>Registration Successful!</div>";
                            echo "<p>Data for <strong>$Name</strong> has been recorded in the database.</p>";
                        } else {
                            echo "<div class='status error'>Execution Error: " . $stmt->error . "</div>";
                        }
                    } 
                    else 
                    {
                        echo "<div class='status error'>Registration Failed</div>";
                        echo "<p>Email address <code>$Email</code> is already registered.</p>";
                    }
                    echo "</div>";
                       
                    $stmt->close();
                    $conn->close();
                }
            } 
            else 
            {
                echo "<p class='error'>Error: All required fields must be filled.</p>";
            }
            ?>

            <div class="button-group" style="justify-content: center; max-width: 250px; margin: 30px auto 0;">
                <a href="form.html" class="btn btn-submit" style="text-decoration: none; display: block; text-align: center;">RETURN TO FORM</a>
            </div>
        </section>
    </main>

    <footer class="main-footer">
        <p>Amey Thakur B-50 | TEC Computer Engineering</p>
    </footer>

    <style>
        .result-display { margin: 20px 0; padding: 25px; border-radius: 8px; background: #fdfdfd; }
        .status { font-size: 1.5rem; font-weight: 600; margin-bottom: 15px; }
        .success { color: #28a745; border-bottom: 2px solid #28a745; display: inline-block; }
        .error { color: #dc3545; border-bottom: 2px solid #dc3545; display: inline-block; }
        .error-p { color: #ff0000; font-weight: bold; }
    </style>
</body>
</html>
