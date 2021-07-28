<style>
div{
   font-family: Cursive;
   font-size: 25px;
   color: RED;
}
</style>

<?php
  echo "<body style='background-color: Black'>";
     $n1=$_POST['fn'];
     $n2=$_POST['ln'];
     echo"<div align='center'>";
     echo"Prime numbers between $n1 and $n2";
     echo "<br />";
          for($i=$n1;$i<=$n2;$i++)
          {
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
      echo"MEGA B-58";
      echo"</div>";

?>
