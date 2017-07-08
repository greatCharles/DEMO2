<?php require_once 'init.php';
require_once $abs_us_root.$us_url_root.'users/includes/header.php';
require_once $abs_us_root.$us_url_root.'users/includes/navigation.php';
require $abs_us_root.$us_url_root.'users/nuestras_configs/funciones.php';
require $abs_us_root.$us_url_root.'users/nuestras_configs/config.php';

$id_user= $_GET['id_user'];
$conexion= conexion($bd_config);
$usuario= obtener_datos_usuario($conexion, $id_user);
$puntaje= $usuario['0']['40'];
$miembro_desde= strtotime($usuario['0']['18']);
$meses = array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");

?>

<div id="page-wrapper">
<div class="container">
  <div class="row">
    <div class="col-xs-12 text-center">
      <div class="jumbotron">
          <h2>Perfil de: <?php echo $usuario['0']['2'] ?><br><br>
            <p>Nombre: <?php echo $usuario['0']['4'] ?></p>
            <p>Apellido: <?php echo $usuario['0']['5'] ?></p>
            <p>Miembro desde: <?php echo date('d', $miembro_desde)." de ".$meses[date('n', $miembro_desde)-1]. " del ".date('Y', $miembro_desde); ?></p>
            <p>Reputacion: <?php echo getReputacion($conexion, $puntaje);?></p>
      </div>
    </div>
  </div>
</div>
</div>
<!-- Content Ends Here -->
<!-- footers -->
<?php require_once $abs_us_root.$us_url_root.'users/includes/page_footer.php'; // the final html footer copyright row + the external js calls ?>

<!-- Place any per-page javascript here -->
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<?php require_once $abs_us_root.$us_url_root.'users/includes/html_footer.php'; // currently just the closing /body and /html ?>
