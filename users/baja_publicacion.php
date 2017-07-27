<?php $id_gau = $_GET['id_gau']?>
<?php require_once 'init.php'; ?>
<?php require_once $abs_us_root.$us_url_root.'users/includes/header.php'; ?>
<?php require_once $abs_us_root.$us_url_root.'users/includes/navigation.php'; ?>
<?php require $abs_us_root.$us_url_root.'users/nuestras_configs/funciones.php'; ?>
<?php require $abs_us_root.$us_url_root.'users/nuestras_configs/config.php'; ?>

<?php

$conexion= conexion($bd_config);
$gauchada= obtener_gauchada_por_id($conexion, $id_gau);
$postulantes= getPostulaciones($conexion, $id_gau);
$cuerpo_notificacion= 'El dueño de la gauchada '.$gauchada['0']['1'].' ha decidido eliminarla, por lo tanto tu postulación se dio de baja también';
$tipo_notificacion = 'negativo';
foreach($postulantes as $postulacion){
  $id_postulante= $postulacion['1'];
  $consulta_notificacion= "INSERT INTO notificaciones (id_usuario, cuerpo, fecha, tipo) VALUES ('$id_postulante', '$cuerpo_notificacion', NOW(),'$tipo_notificacion')";
  $conexion->query($consulta_notificacion);
}
?>


<div id="page-wrapper">
<div class="container">
<div class="row">
  <div class="col-xs-12">
  	<div class="jumbotron text-center">
		 <?php
			$consulta_baja = "UPDATE gauchada SET estado= 'inactiva' WHERE id_gauchada=$id_gau";
			if ($conexion->query($consulta_baja)) {
        if(!poseePostulantes($conexion,$id_gau)){
          devolver($conexion, $gauchada['0']['6']);
          echo '<p>Tu gauchada ha sido eliminada exitosamente y se te ha devuelto el crédito gastado</p>';
        }
      else{
				echo '<p>Tu gauchada ha sido eliminada exitosamente.<br>Dado que poseía postulantes no pudimos devolverte el crédito gastado</p>';
      }
			} else {
				echo "Error: " . $consulta_baja . "<br>" . mysqli_error(conexion($bd_config));
			}
		 ?>
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

<?php require_once $abs_us_root.$us_url_root.'users/includes/html_footer.php'; // currently just the closing /body and /html ?>
