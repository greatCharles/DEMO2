<?php $nombre = $_POST['nombre'] ?>
<?php $id = $_GET['id'] ?>
<?php require_once 'init.php';
require_once $abs_us_root.$us_url_root.'users/includes/header.php';
require_once $abs_us_root.$us_url_root.'users/includes/navigation.php';
require $abs_us_root.$us_url_root.'users/nuestras_configs/funciones.php';
require $abs_us_root.$us_url_root.'users/nuestras_configs/config.php';
?>

<?php $conex = conexion($bd_config); ?>

<div id="page-wrapper">
<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <div class="jumbotron text-center">
			  <?php if (modificarCategoria($conex,$nombre,$id)): ?>
        		<p>Se ha modificado la categoría exitosamente.</p><br><br>
    		<?php else: ?>
    			  <p>Ya existe una categoría con ese nombre.</p><br>
    		<?php endif; ?>
        <a href="admin_categorias.php" class="btn btn-primary">Volver</a>
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
