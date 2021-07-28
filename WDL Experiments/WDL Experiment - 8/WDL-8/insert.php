<style>
div{
   font-family: Cursive;
   font-size: 25px;
   color: RED;
}
</style>

<?php
    
     echo "<br />";
     echo "<br />";
     echo "<body style='background-color: Black'>";
     echo "<div align='center'>";
     echo "<br />";

$Name = $_POST['Name'];
$Password = $_POST['Password'];
$Gender = $_POST['Gender'];
$Email = $_POST['Email'];
$Contact = $_POST['Contact'];
$DOB = $_POST['DOB'];
$Country = $_POST['Country'];

if (!empty($Name) || !empty($Password) || !empty($Gender) || !empty($Email) || !empty($Contact) || !empty($DOB) || !empty($Country)) 
{
    $host = "localhost";
    $dbUsername = "root";
    $dbPassword = "";
    $dbname = "filly";
    
    $conn = new mysqli($host, $dbUsername, $dbPassword, $dbname);
    
     if (mysqli_connect_error()) 
     {
          die('Connect Error('. mysqli_connect_errno().')'. mysqli_connect_error());
     } 
     else 
     {
            $SELECT = "SELECT email From form Where email = ? Limit 1";
           $INSERT = "INSERT Into form (Name, Password, Gender, Email, Contact,  DOB, Country) values(?, ?, ?, ?, ?, ?, ?)";
    
               

               $stmt = $conn->prepare($SELECT);
               $stmt->bind_param("s", $email);
               $stmt->execute();
               $stmt->bind_result($email);
               $stmt->store_result();
               $rnum = $stmt->num_rows;
              
               if ($rnum==0) 
               {
                          $stmt->close();
                          $stmt = $conn->prepare($INSERT);
            $stmt->bind_param("ssssiis", $Name, $Password, $Gender, $Email, $Contact, $DOB, $Country);
                          $stmt->execute();
                          echo "Data Recorded Successfully";
                 } 
                 else 
                 {
                         echo "Email Address is Already Registered";
                  }
                   
                  $stmt->close();
                  $conn->close();
          }
} 
else 
{
       echo "All field are required";
       die();
}

     echo "<br />";
     echo "<br />";
     echo"Amey B-50";
     echo"</div>";

?>
