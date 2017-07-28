<?php require_once 'init.php';
require_once $abs_us_root.$us_url_root.'users/includes/header.php';
require_once $abs_us_root.$us_url_root.'users/includes/navigation.php';
require $abs_us_root.$us_url_root.'users/nuestras_configs/funciones.php';
require $abs_us_root.$us_url_root.'users/nuestras_configs/config.php';


?>






<?php

$conex = conexion($bd_config);
if($_POST){
  $fecha_desde= $_POST['fecha_desde'];
  $fecha_hasta= $_POST['fecha_hasta'];
  $ganancias = getGanancias($conex, $fecha_desde, $fecha_hasta);
  $monto_total = $ganancias['0']['0'];
  $cant_transacciones = $ganancias['0']['1'];
}

?>

<div id="page-wrapper">
<div class="container">
  <div class="row">
    <div class="col-xs-5">
      <div class="jumbotron">
        <form action= "ganancias.php" method="post" name="" enctype="multipart/form-data" class="form_signup" >
          <p>Reporte de ganancias</p>


          <label style="text-align: left;">Fecha desde</label><br>
          <input type="date" class="form-control" style="width: 250px" name="fecha_desde" id="fecha_desde" required><br><br>
          <label style="text-align: left;">Fecha hasta</label><br>
          <input type="date" class="form-control" style="width: 250px" name="fecha_hasta" id="fecha_hasta" required><br><br>
          <button class="submit btn  btn-primary" type="submit"><i class="fa fa-check-circle-o"></i>Solicitar estadisticas</button>
        </form>
      </div>
    </div>
    <?php if($_POST): ?>
      <div class="col-xs-7">
        <div class="jumbotron">
          <?php if($cant_transacciones > 0): ?>
              <p>Transacciones totales: <?php echo $cant_transacciones?> <br> Monto total: $<?php echo $monto_total ?></p>
            <?php else: ?>
              <p>No hubo transacciones entre las fechas seleccionadas.</p>
          <?php endif; ?>
        </div>
      </div>
    <?php endif; ?>
  </div>
</div>
</div>
<!-- Content Ends Here -->
<!-- footers -->
<?php require_once $abs_us_root.$us_url_root.'users/includes/page_footer.php'; // the final html footer copyright row + the external js calls ?>

<!-- Place any per-page javascript here -->
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<?php require_once $abs_us_root.$us_url_root.'users/includes/html_footer.php'; // currently just the closing /body and /html ?>
