<?php $id_elegido = $_GET['id_elegido']?>
<?php $id_gau = $_GET['id_gau']?>
<?php require_once 'init.php';
require_once $abs_us_root.$us_url_root.'users/includes/header.php';
require_once $abs_us_root.$us_url_root.'users/includes/navigation.php';
require $abs_us_root.$us_url_root.'users/nuestras_configs/funciones.php';
require $abs_us_root.$us_url_root.'users/nuestras_configs/config.php';
?>
<?php
	$conexion= conexion($bd_config);
	$calificación = $_POST['feedback'];
	setPuntos($conexion, $id_elegido, $id_gau, $calificación);
 ?>

<div id="page-wrapper">
<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <div class="jumbotron text-center">
        <?php switch ($calificación) {
        	case 'positivo':
        		echo '<h1>Felicitaciones!</h1>';
        		echo '<p>Su calificación se registró con éxito. Gracias por ser usuario de unaGauchada!</p><br><br>';
        		break;
        	case 'negativo':
        		echo '<h1>Oh, no!</h1>';
        		echo '<p>Su calificación se registró con éxito, deseamos que la proxima vez tenga una mejor experiencia!</p><br><br>';
        		break;
        	
        	case 'neutral':
        		echo '<h1>Felicitaciones!</h1>';
        		echo '<p>Su calificación se registró con éxito!</p><br><br>';
        		break;
        } ?>
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