<?php
session_start();
include_once "conexion.php";
<!DOCTYPE html>

<html>
  <head>
    <meta charset="utf-8">
    <title>YoCocina</title>
    <link rel="stylesheet" href="yococina.css">
  </head>
  <body>

    <div id="container">
      <div id="cabecera"><h1>YoCocina</h1></div>
            
      <div id="loggin">
        
      </div>
      <div id="recetas_container">
      
      </div>
      <div id="footer">
       <p>Este es el pie de página</p>
      </div>

    </div>

    <script type="application/dart" src="yococina.dart"></script>
    <script src="packages/browser/dart.js"></script>
  </body>
</html>