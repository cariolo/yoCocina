 <?php
// datos para la conexion a mysql
define('DB_SERVER','localhost');
define('DB_NAME','práctica dart');
define('DB_USER','carlos');
define('DB_PASS','charles');

$con = mysql_connect(DB_SERVER,DB_USER,DB_PASS);
mysql_select_db(DB_NAME,$con);
?> 