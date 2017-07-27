<?php $respuesta = $_GET['respuesta']?>
<?php $id_coment = $_GET['id_coment']?>
<?php $id_gau = $_GET['id_gau']?>
<?php require_once 'init.php'; ?>
<?php require_once $abs_us_root.$us_url_root.'users/includes/header.php'; ?>
<?php require_once $abs_us_root.$us_url_root.'users/includes/navigation.php'; ?>
<?php require $abs_us_root.$us_url_root.'users/nuestras_configs/funciones.php'; ?>
<?php require $abs_us_root.$us_url_root.'users/nuestras_configs/config.php'; ?>
<?php

$consulta = "UPDATE comentarios SET cuerpo_respuesta = '$respuesta', fecha_respuesta = NOW() WHERE id_comentario = '$id_coment'";
if (!mysqli_query(conexion($bd_config), $consulta)){
		echo "Error: " . $consulta . "<br>" . mysqli_error(conexion($bd_config));
}

$gauchada = obtener_gauchada_por_id(conexion($bd_config), $id_gau);
$nombre_dueño = obtener_usuario_por_id(conexion($bd_config), $gauchada['0']['6']);
$consulta_id_comentador= mysqli_query(conexion($bd_config), "SELECT id_user FROM comentarios WHERE id_comentario= $id_coment");
$array_consulta= mysqli_fetch_all($consulta_id_comentador);
$id_usuario_comentador= $array_consulta['0']['0'];
$cuerpo_notificacion = 'El usuario ' . $nombre_dueño . ' ha respondido tu comentario en la gauchada ' .$gauchada['0']['1'];
$link_gauchada = 'single_view.php?id='.$id_gau.'#seccion-comments';
$tipo_notificacion='positiva';
$consulta2 = "INSERT INTO notificaciones (id_usuario, cuerpo, fecha, link, tipo) VALUES ('$id_usuario_comentador', '$cuerpo_notificacion', NOW(), '$link_gauchada', '$tipo_notificacion')";
mysqli_query(conexion($bd_config), $consulta2);

?>

<div id="page-wrapper">
<div class="container">
<div class="row">
  <div class="col-xs-12">
  	<div class="jumbotron text-center">
  		<h2>Tu respuesta ha sido enviada!</h2><br><br>
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
