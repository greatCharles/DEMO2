<?php $id_gau= $_GET['id_gau']?>
<?php $id_aplicante = $_GET['id_aplicante'] ?>
<?php $comentario = $_GET['comentario'] ?>
<?php require_once 'init.php'; ?>
<?php require_once $abs_us_root.$us_url_root.'users/includes/header.php'; ?>
<?php require_once $abs_us_root.$us_url_root.'users/includes/navigation.php'; ?>
<?php require $abs_us_root.$us_url_root.'users/nuestras_configs/funciones.php'; ?>
<?php require $abs_us_root.$us_url_root.'users/nuestras_configs/config.php'; ?>

<?php
	$consulta = "INSERT INTO postulacion (id_user, id_gauchada, fecha, comentario) VALUES ('$id_aplicante', '$id_gau', NOW(), '$comentario')";
	if (!mysqli_query(conexion($bd_config), $consulta)) {
		echo "Error: " . $consulta . "<br>" . mysqli_error(conexion($bd_config));
	}
	$gauchada = obtener_gauchada_por_id(conexion($bd_config), $id_gau);
	$dueño = $gauchada['0']['6'];
	$postulante = obtener_usuario_por_id(conexion($bd_config), $id_aplicante);
	$cuerpo_notificacion = 'El usuario ' . $postulante . ' se ha postulado a tu gauchada ' . $gauchada['0']['1'];
	$link_gauchada = 'single_view.php?id='.$id_gau.'#seccion-postu';
	$tipo_notificacion='positivo';
	$consulta2 = "INSERT INTO notificaciones (id_usuario, cuerpo, fecha, link, tipo) VALUES ('$dueño', '$cuerpo_notificacion', NOW(), '$link_gauchada','$tipo_notificacion')";
	mysqli_query(conexion($bd_config), $consulta2);
 ?>

<div id="page-wrapper">
<div class="container">
<div class="row">
  <div class="col-xs-12">
  	<div class="jumbotron text-center">
  		<h2>Tu postulación se procesó satisfactoriamente!</h2><br><br>
  		<a class="btn btn-primary" href= "single_view.php?id=<?php echo $id_gau ?>">Volver a la Gauchada</a>
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
