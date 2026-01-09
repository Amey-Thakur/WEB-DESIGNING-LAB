<?php
/*
    Author: Amey Thakur
    GitHub: https://github.com/Amey-Thakur
    Repository: https://github.com/Amey-Thakur/WEB-DESIGNING-LAB
    Description: Web Designing Laboratory - Experiment 7: Prime Numbers Logic (Prime.php)
    Task: Process the input range and identify prime numbers using loop and conditional logic.
*/
?>
<style>
div{
   font-family: Cursive;
   font-size: 25px;
   color: RED;
}
</style>

<?php
  echo "<body style='background-color: Black'>";
     // Capturing numbers from POST request
     $n1=$_POST['fn'];
     $n2=$_POST['ln'];
     echo"<div align='center'>";
     echo"Prime numbers between $n1 and $n2";
     echo "<br />";
          // Loop through the range provided by the user
          for($i=$n1;$i<=$n2;$i++)
          {
               // Prime number identification logic
               if($i==2 || $i==3 || $i==5 || $i==7)
               {
                   echo" $i";
                   echo "<br />";
               }
               else if(($i%2)!=0 && ($i%3)!=0 && ($i%5)!=0 && ($i%7)!=0)
               {
                    echo" $i";
                    echo "<br />";
               }
                else
                  continue;
          }
      echo "<br />";
      echo "<br />";
      echo"MEGA B-58"; // Preserving original credit string
      echo"</div>";

?>
