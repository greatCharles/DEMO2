<?php 
	$texto_respuesta = $_GET['respuesta'];
	$id_calificacion = $_GET['id_calificacion'];
	$id_gau = $_GET['id_gau'];
 ?>
<?php require_once 'init.php'; ?>
<?php require_once $abs_us_root.$us_url_root.'users/includes/header.php'; ?>
<?php require_once $abs_us_root.$us_url_root.'users/includes/navigation.php'; ?>
<?php require $abs_us_root.$us_url_root.'users/nuestras_configs/funciones.php'; ?>
<?php require $abs_us_root.$us_url_root.'users/nuestras_configs/config.php'; ?>


<?php 
	$conexion = conexion($bd_config);
	$consulta = "UPDATE calificaciones SET respuesta = '$texto_respuesta' WHERE id_calificacion = '$id_calificacion'";
	mysqli_query($conexion, $consulta);
 ?>



<div id="page-wrapper">
<div class="container">
<div class="row">
  <div class="col-xs-12">
  	<div class="jumbotron text-center">
  		<h2>Tu respuesta se procesó satisfactoriamente!</h2><br><br>
  		<a class="btn btn-primary" href= "calificacion.php?id_gau=<?php echo $id_gau ?>">Volver</a>
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
