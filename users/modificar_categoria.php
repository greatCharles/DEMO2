<?php

$nombre = $_GET['nombre'];
$id = $_GET['id'];

?>

<?php require_once 'init.php';
require_once $abs_us_root.$us_url_root.'users/includes/header.php';
require_once $abs_us_root.$us_url_root.'users/includes/navigation.php';
require $abs_us_root.$us_url_root.'users/nuestras_configs/funciones.php';
require $abs_us_root.$us_url_root.'users/nuestras_configs/config.php';
?>

<?php $conex = conexion($bd_config);


?>

<div id="page-wrapper">
<div class="container">
  <div class="row">
    <div class="col-xs-12">

			<h1>Modificar Categoría</h1>

      <form action= "categoria_mod_exitosa.php?id=<?php echo $id; ?>" method="post" name="" enctype="multipart/form-data" class="form_signup" >

        <label for= titulo>Nombre</label>
        <input class="form-control" type="text" placeholder="Nombre" name="nombre" id="nombre" required="true" value="<?php echo $nombre; ?> "><br>

        <input type="submit" class= "btn btn-primary" value="Modificar">
        <a href= "admin_categorias.php" class="btn btn-primary">Cancelar</a>

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
