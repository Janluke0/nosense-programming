<?php
session_start();
$row_size = 100;
//print_r($_SESSION);
if(!array_key_exists("position", $_SESSION)){  
  $_SESSION["position"] = 0;
  $_SESSION["direction"] = 1;
}else{
  if(($_SESSION["position"]==($row_size -1) && $_SESSION["direction"] > 0 )
    || ($_SESSION["position"]==0 && $_SESSION["direction"] < 0 )){
    $_SESSION["direction"] = -$_SESSION["direction"];
  }
  $_SESSION["position"] += $_SESSION["direction"];
  
}
?>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="refresh" content="0.2"/>
    <style>
      body{margin: 0;border: 0;}
      table{border: solid 1px red;width: 100%}
    </style>
  </head>
  <body>
    <table>
      <tr>
        <?php
        for ($i = 0; $i < $row_size ; $i++) {
          print("<td>");
          if($i == $_SESSION["position"] ){
            print("<a href='#'><img height=100 src='cat.png'/></a>\n");
          }
          print("</td>");
        }
        ?>
      </tr>
    </table>
  </body>
</html>