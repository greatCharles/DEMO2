<?php $id_gau = $_GET['id']?>
<?php require_once 'init.php';
require_once $abs_us_root.$us_url_root.'users/includes/header.php';
require_once $abs_us_root.$us_url_root.'users/includes/navigation.php';
require $abs_us_root.$us_url_root.'users/nuestras_configs/funciones.php';
require $abs_us_root.$us_url_root.'users/nuestras_configs/config.php';
$conexion= conexion($bd_config);
$gau = obtener_gauchada_por_id($conexion, $id_gau);
$id_elegido = $gau['0']['11'];
$nombre_elegido = obtener_usuario_por_id($conexion, $id_elegido);


 ?>
<!-- <form action= "calificacion_exitosa.php?id_elegido=<?php echo "$id_elegido";?> " method="post" name="" enctype="multipart/form-data" class="form_signup" > -->

<form action= "calificacion_exitosa.php?id_elegido=<?php echo "$id_elegido";?>&id_gau=<?php echo "$id_gau"; ?> " method="post" name="" enctype="multipart/form-data" class="form_signup" >
<div id="page-wrapper">
<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <div class="jumbotron text-center">
        <h1>Reputacion</h1>
        <p>Por favor, contanos tu experiencia con <?php echo "$nombre_elegido"; ?> eligiendo una de las siguientes opciones</p>

        <div class="radio">
  			<label><input type="radio" name="feedback" value="positivo" checked>Todo salió de acuerdo a lo pactado y recomendaría a <?php echo "$nombre_elegido"; ?> sin dudarlo!</label>
		</div>
		<div class="radio">
 			<label><input type="radio" name="feedback" value="neutral">Tengo una opinion neutra en cuanto a <?php echo "$nombre_elegido" . '.'; ?></label>
		</div>
		<div class="radio">
  			<label><input type="radio" name="feedback" value="negativo">No recomendaria a <?php echo "$nombre_elegido" . '.'; ?></label>
		</div><br><br>
		
        <input type="submit" class= "btn btn-primary" value="Calificar">
      </div>
    </div>
  </div>
</div>
</div>
</form>
<!-- Content Ends Here -->
<!-- footers -->
<?php require_once $abs_us_root.$us_url_root.'users/includes/page_footer.php'; // the final html footer copyright row + the external js calls ?>

<!-- Place any per-page javascript here -->
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<?php require_once $abs_us_root.$us_url_root.'users/includes/html_footer.php'; // currently just the closing /body and /html ?>
