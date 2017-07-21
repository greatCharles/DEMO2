<?php require_once 'init.php';
require_once $abs_us_root.$us_url_root.'users/includes/header.php';
require_once $abs_us_root.$us_url_root.'users/includes/navigation.php';
require $abs_us_root.$us_url_root.'users/nuestras_configs/funciones.php';
require $abs_us_root.$us_url_root.'users/nuestras_configs/config.php';
?>

<?php $conex = conexion($bd_config); ?>
<?php getUsuarios($conex); ?>

<div id="page-wrapper">
<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <div class="jumbotron">
        <form action= "mostrar_estadisticas.php" method="post" name="" enctype="multipart/form-data" class="form_signup" >
          <p>Estadisticas de usuarios con mas reputación</p>
          <label style="text-align: left;">Número de usuarios</label>
          <input type="number" class="form-control" name="num_limite" id="num_limite"  placeholder="Ej: 5" required><br>

          <button class="submit btn  btn-primary" type="submit"><i class="fa fa-check-circle-o"></i>Solicitar estadisticas</button>
        </form>
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
