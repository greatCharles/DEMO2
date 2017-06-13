<?php $comentario = $_GET['comentario']?>
<?php $id_gauchada = $_GET['id_gauchada']?>
<?php $id_user = $_GET['id_user']?>
<?php require_once 'init.php'; ?>
<?php require_once $abs_us_root.$us_url_root.'users/includes/header.php'; ?>
<?php require_once $abs_us_root.$us_url_root.'users/includes/navigation.php'; ?>
<?php require $abs_us_root.$us_url_root.'users/nuestras_configs/funciones.php'; ?>
<?php require $abs_us_root.$us_url_root.'users/nuestras_configs/config.php'; ?>
<?php
	if ($_GET) {
		$consulta = "INSERT INTO comentarios (fecha, id_gauchada, id_user, cuerpo) VALUES (NOW(), '$id_gauchada', '$id_user', '$comentario')";
		if (mysqli_query(conexion($bd_config), $consulta)) {
				echo "tremendoo";
			} else {
				echo "Error: " . $consulta . "<br>" . mysqli_error(conexion($bd_config));
			}
	}
?>


<div id="page-wrapper">
<div class="container">
<div class="row">
  <div class="col-xs-12">
  	<div class="jumbotron text-center">
  		<h1>Felicitaciones!</h1>
  		<p>Tu comentario ha sido enviado!</p>
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
