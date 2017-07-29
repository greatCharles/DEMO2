<?php $limite = $_POST['num_limite'] ?>
<?php require_once 'init.php';
require_once $abs_us_root.$us_url_root.'users/includes/header.php';
require_once $abs_us_root.$us_url_root.'users/includes/navigation.php';
require $abs_us_root.$us_url_root.'users/nuestras_configs/funciones.php';
require $abs_us_root.$us_url_root.'users/nuestras_configs/config.php';
?>

<?php $conex = conexion($bd_config); ?>
<?php $usuarios = getUsuarios($conex); ?>
<?php $cant_usuarios = count(getUsuarios($conex)); ?>

<div id="page-wrapper">
<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <div class="jumbotron">
        
        <?php if ($limite > $cant_usuarios):?><br>
          <table class='jumbotron table table-hover table-list-search'>
          <h4 style="text-align: center">No existen tantos usuarios, a continuación se detallan todos los usuarios del sistema.</h4>
          <hr>
          <th>Usuario</th><th>Puntaje</th>
            <?php for ($i=0; $i < $cant_usuarios; $i++):?>
              <tr>
                <td><?php echo $usuarios[$i]['2']; ?></td>
                <td><?php echo $usuarios[$i]['40'] ?></td>
              </tr>
            <?php endfor; ?>
          </table>
        <?php else: ?>
          <table class='jumbotron table table-hover table-list-search'>
          <h4 style="text-align: center">Estadisticas de los <?php echo "$limite";?> usuarios con mas puntaje</h4>
          <th>Usuario</th><th>Puntaje</th>
            <?php for ($i=0; $i < $limite; $i++):?>
              <tr>
                <td><?php echo $usuarios[$i]['2']; ?></td>
                <td><?php echo $usuarios[$i]['40'] ?></td>
              </tr>
            <?php endfor; ?>

          </table>

        <?php endif; ?>
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
