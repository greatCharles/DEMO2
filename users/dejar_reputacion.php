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
      <h1 style="text-align:center">Reputacion</h1>
      <div class="jumbotron text-center">

        <p>Por favor, califica a <?php echo "$nombre_elegido"; ?> eligiendo una de las siguientes opciones</p>

        <div class="radio">
  			  <label><input type="radio" name="feedback" id="feedback" value="positivo" checked>Positivo</label>
    		</div>
    		<div class="radio">
     			<label><input type="radio" name="feedback" id="feedback" value="neutral">Neutral</label>
    		</div>
    		<div class="radio">
      		<label><input type="radio" name="feedback" id="feedback" value="negativo">Negativo</label>
    		</div><br>
        <p>Deja tu opinión acerca de <?php echo "$nombre_elegido"; ?></p>
        <textarea name="opinion" id="opinion" rows="6" cols="60"></textarea><br>

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
