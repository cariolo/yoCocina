<?php
  //datos para salir deslogearse 
    session_start();
    session_destroy();
 
    header('location: index.php');
?>