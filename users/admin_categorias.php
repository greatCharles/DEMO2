
<?php require_once 'init.php';
require_once $abs_us_root.$us_url_root.'users/includes/header.php';
require_once $abs_us_root.$us_url_root.'users/includes/navigation.php';
require $abs_us_root.$us_url_root.'users/nuestras_configs/funciones.php';
require $abs_us_root.$us_url_root.'users/nuestras_configs/config.php';
?>

<?php
	$conex = conexion($bd_config);
	$categorias = getCategorias($conex);

?>
<form action= "categoria_creada.php" method="post" name="" enctype="multipart/form-data" class="form_signup" >
<div id="page-wrapper">
<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <h1>Listado de Categorias</h1><br>
      <table class='jumbotron table table-hover table-list-search'>
					<th>Nombre</th>
					<?php foreach ($categorias as $categoria): ?>
						<?php $nombre= $categoria['1']; $id= $categoria['0']; ?>
						<tr><td><?php echo $nombre; ?></td>
							<?php $url1= "modificar_categoria.php?nombre=$nombre&id=$id" ?>
							<td> <a href="<?php echo $url1; ?>">Modificar</a></td>
							<td> <a href="eliminar_categoria.php?id=<?php echo $id; ?>">Eliminar</a></td>
						</tr>
					<?php endforeach; ?>
	   </table><hr>

      <h1>Crear Categoria</h1><br><br>
      <div class="jumbotron">
        <div class="form-group">
        	<label for="username" >Nombre de la categoria</label>
        	<input  class="form-control" type="text" name="nombre" id="nombre" placeholder="Ej: Gastronómicos" required>
    	  </div>

      <button class="submit  btn  btn-primary" type="submit"><i class="fa fa-check-circle-o"></i>Crear</button>
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
