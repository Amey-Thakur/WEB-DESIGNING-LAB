<?php
/*
    Author: Amey Thakur
    GitHub: https://github.com/Amey-Thakur
    Repository: https://github.com/Amey-Thakur/WEB-DESIGNING-LAB
    Description: Web Designing Laboratory - Experiment 8: Database Insertion Logic (insert.php)
    Task: Validate form data and perform secure insertion into a MySQL database using Prepared Statements.
*/

     echo "<br />";
     echo "<br />";
     echo "<body style='background-color: Black'>";
     echo "<div align='center'>";
     echo "<br />";

// Capturing data from the global $_POST superglobal
$Name = $_POST['Name'];
$Password = $_POST['Password'];
$Gender = $_POST['Gender'];
$Email = $_POST['Email'];
$Contact = $_POST['Contact'];
$DOB = $_POST['DOB'];
$Country = $_POST['Country'];

// Basic validation to check if any required fields are empty
if (!empty($Name) || !empty($Password) || !empty($Gender) || !empty($Email) || !empty($Contact) || !empty($DOB) || !empty($Country)) 
{
    // Database configuration credentials
    $host = "localhost";
    $dbUsername = "root";
    $dbPassword = "";
    $dbname = "filly";
    
    // Establishing a connection to the MySQL server using mysqli
    $conn = new mysqli($host, $dbUsername, $dbPassword, $dbname);
    
     // Error handling for connection failure
     if (mysqli_connect_error()) 
     {
          die('Connect Error('. mysqli_connect_errno().')'. mysqli_connect_error());
     } 
     else 
     {
            // SQL query to check if the email is already registered to prevent duplicates
            $SELECT = "SELECT Email From form Where Email = ? Limit 1";
            // SQL query to insert new registration data
            $INSERT = "INSERT Into form (Name, Password, Gender, Email, Contact, DOB, Country) values(?, ?, ?, ?, ?, ?, ?)";
    
               // Preparing the SELECT statement for execution
               $stmt = $conn->prepare($SELECT);
               $stmt->bind_param("s", $Email);
               $stmt->execute();
               $stmt->bind_result($Email);
               $stmt->store_result();
               $rnum = $stmt->num_rows;
              
               if ($rnum==0) 
               {
                    // Email not found, ready to insert new data
                    $stmt->close();
                    $stmt = $conn->prepare($INSERT);
                    // Binding parameters to the prepared statement for security (prevents SQL Injection)
                    $stmt->bind_param("ssssiss", $Name, $Password, $Gender, $Email, $Contact, $DOB, $Country);
                    $stmt->execute();
                    echo "<p style='color:RED; font-size:25px;'>Data Recorded Successfully</p>";
                 } 
                 else 
                 {
                    // Handle duplicate registration case
                    echo "<p style='color:RED; font-size:25px;'>Email Address is Already Registered</p>";
                 }
                   
                   // Closing statements and the database connection
                   $stmt->close();
                   $conn->close();
           }
} 
else 
{
       // Error message for incomplete form submission
       echo "<p style='color:RED; font-size:25px;'>All fields are required</p>";
       die();
}

     echo "<br />";
     echo "<br />";
     echo "<p style='color:RED; font-size:25px;'>Amey B-50</p>";
     echo"</div>";

?>
