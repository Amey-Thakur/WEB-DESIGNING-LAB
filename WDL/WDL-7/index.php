<!DOCTYPE html>
<!--
    Author: Amey Thakur
    GitHub: https://github.com/Amey-Thakur
    Repository: https://github.com/Amey-Thakur/WEB-DESIGNING-LAB
    Description: Web Designing Laboratory - Experiment 7: Prime Numbers Identifier (index.php)
    Task: Create a form to accept a range of numbers and send them to a PHP script to find primes.
-->
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <meta name="description" content="Prime Numbers">
	  <meta name="keywords" content="Prime Numbers">
  	<meta name="author" content="Amey Thakur">
    <title>Amey B-50</title>
    <link rel="stylesheet" href="./css/style.css">
    </head>

    <body><br>
      <!-- Metadata/Sidebar section displaying student identification -->
      <aside id="sidebar">
                    <p>
                    <table border="0" bgcolor="#000000" align="center" cellspacing= "20">
                    <tr style="color:#000dff">
                    <th >Name</th>
                    <th>College</th>
                    <th>Department</th>
                    <th>Class</th>
                    <th>Division</th>
                    <th>Roll Number</th>
                    </tr>
                    <tr style="color:#ff0000">
                    <td>MEGA SATISH</td>
                    <td>Terna Engineering College</td>
                    <td>Computer Engineering</td>
                    <td>Third Year</td>
                    <td>B</td>
                    <td>58</td>
                    </tr>
                    </table>
                  </p>
                  </aside>

                  <center>
                    <p style="color:#000dff">WDL EXAM</p>
                    <p style="color:#ff0000">PRIME NUMBERS IDENTIFIER</p>
                  </center>

<!-- Input form for the numeric range -->
<form name="Filly" action="Prime.php" method="post" class="docs">
<table border="0" bgcolor="#000000" align="center" cellspacing= "40">
  <tr style="color:#000dff">
      <th align="right">SEARCH</th>
      <th align="left">PRIME NUMBERS</th>
  </tr>
<div>
  <tr>
    <td>First Integer</td>
    <td><input type="number" placeholder="Enter First Number" size="10" id="fn" name="fn" required></td>
  </tr>
</div>
<div>
  <tr>
    <td>Last Integer</td>
    <td><input type="number" placeholder="Enter Last Number" size="10" id="ln" name="ln" required></td>
  </tr>
</div>

<div>
<tr>
  <td colspan="2" align="center">
    <input type="reset" value="RESET" name="reset" id="button" style="color:#ff0000">&nbsp &nbsp &nbsp &nbsp &nbsp
    <input type="submit" value="FIND" name="submit" id="button" style="color:#ff0000"></td>
</tr>
</div>
</table>
</form>

    <footer>
        <center><p style="color:#f70000">MEGA SATISH B-50</p></center>
    </footer>
  </body>
</html>
