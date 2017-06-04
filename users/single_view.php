<?php
require_once 'init.php';
require_once $abs_us_root.$us_url_root.'users/includes/header.php';
require_once $abs_us_root.$us_url_root.'users/includes/navigation.php';
require $abs_us_root.$us_url_root.'users/nuestras_configs/funciones.php';
require $abs_us_root.$us_url_root.'users/nuestras_configs/config.php';

$conexion= conexion($bd_config);
$id_gauchada= id_gauchada($_GET['id']);
$gauchada= obtener_gauchada_por_id($conexion, $id_gauchada);

 if(!$gauchada){
  Redirect::to($abs_us_root.$us_url_root.'index.php');
 }

$gauchada= $gauchada['0'];
$usuario=obtener_usuario_por_id($conexion, $gauchada['6']);
header('X-Frame-Options: DENY');?>
<div id="page-wrapper">
<div class="container">
<?php require 'views/_single_view.php';?>
</div>
</div>

<?php require_once $abs_us_root.$us_url_root.'users/includes/page_footer.php';?>
