<?php $id_user = $_GET['id_user']?>
<?php $id_gau= $_GET['id_gau']?>
<?php require_once 'init.php';
require_once $abs_us_root.$us_url_root.'users/includes/header.php';
require_once $abs_us_root.$us_url_root.'users/includes/navigation.php';
require $abs_us_root.$us_url_root.'users/nuestras_configs/funciones.php';
require $abs_us_root.$us_url_root.'users/nuestras_configs/config.php';
?>

<?php

$conexion= conexion($bd_config);
$usuario= obtener_datos_usuario($conexion, $id_user);
$conexion->query("UPDATE gauchada SET id_elegido= $id_user WHERE id_gauchada= $id_gau");
$conexion->query("UPDATE postulacion SET estado= 'Rechazado' WHERE id_gauchada= $id_gau AND id_user <> $id_user");
$conexion->query("UPDATE postulacion SET estado= 'Elegido' WHERE id_gauchada= $id_gau AND id_user = $id_user");

$gauchada = obtener_gauchada_por_id($conexion, $id_gau);
$cuerpo_notificacion = "Has sido seleccionado como colaborador para realizar la gauchada: " . $gauchada['0']['1'];
$link_gauchada = 'single_view.php?id=' . $id_gau;
$tipo_notificacion='positivo';
$conexion->query("INSERT INTO notificaciones (id_usuario, cuerpo, fecha, link, tipo) VALUES ('$id_user', '$cuerpo_notificacion', NOW(), '$link_gauchada', '$tipo_notificacion')");
$telefono= $usuario['0']['41'];

// Mandar las notificaciones a los postulantes rechazados
$cuerpo_notificacion2="Lo sentimos, has sido rechazado como colaborador para la gauchada: " . $gauchada['0']['1'];
$tipo_notificacion2="negativo";
$postulantes=getPostulaciones($conexion, $id_gau);
foreach($postulantes as $postulacion){
  if($postulacion['1'] != $id_user){
    $id_postulante= $postulacion['1'];
    $consulta_notificacion= "INSERT INTO notificaciones (id_usuario, cuerpo, fecha, link, tipo) VALUES ('$id_postulante', '$cuerpo_notificacion2', NOW(), '$link_gauchada', '$tipo_notificacion2')";
    $conexion->query($consulta_notificacion);
    }
  }


?>
<div id="page-wrapper">
<div class="container">
  <div class="row">
    <div class="col-xs-12 text-center">
      <div class="jumbotron">
        <h1>Felicitaciones!</h1>
        <p>Se ha elegido el postulante <?php echo $usuario['0']['2'] ?>.</p><br><br>
          <h2>Datos de contacto:</h2> <br><br>
            <p>Nombre: <?php echo $usuario['0']['4'] ?></p>
            <p>Apellido: <?php echo $usuario['0']['5'] ?></p>
            <p>Email: <?php echo $usuario['0']['1'] ?></p>
            <?php if($telefono != NULL): ?>
              <p>Telefono: <?php echo $telefono; ?></p>
            <?php endif; ?>
        <!-- <a class="btn btn-primary" href= "single_view.php?id=<?php echo $id_gau ?>">Ver Gauchada</a> -->
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
