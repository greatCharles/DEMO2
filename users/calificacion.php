<?php require_once 'init.php';
require_once $abs_us_root.$us_url_root.'users/includes/header.php';
require_once $abs_us_root.$us_url_root.'users/includes/navigation.php';
require $abs_us_root.$us_url_root.'users/nuestras_configs/funciones.php';
require $abs_us_root.$us_url_root.'users/nuestras_configs/config.php';
?>

<?php 

$id_gau= $_GET['id_gau'];
$conexion= conexion($bd_config);
$calificacion= getCalificacion($conexion, $id_gau);
$duenio= obtener_usuario_por_id($conexion, $calificacion['0']['1']);
$mensaje= $calificacion['0']['4'];

?>
<html>
  <head>
    <script src="node_modules/sweetalert/dist/sweetalert.min.js"></script>
    <script src="js/nuestros_js.js"></script>
    <link rel="stylesheet" href="node_modules/sweetalert/dist/sweetalert.css">
    <link rel="stylesheet" href="css/estilo_comentarios.css">
  </head>
</html>

<script>
	function enviar_respuesta_calificacion(id_calificacion, id_gau) {
  swal({

  title: "Respuesta",
  text: "Escribí tu respuesta",
  type: "input",
  showCancelButton: true,
  closeOnConfirm: false,
  animation: "slide-from-top",
  inputPlaceholder: "Ej: ¿Salio todo de acuerdo a lo pactado?"
  },
    function(inputValue){
      if (inputValue === false) return false;

      if (inputValue === "") {
        swal.showInputError("No te olvides de escribir algo!");
        return false
      }
      window.location = 'respuesta_enviada_calificacion.php?respuesta=' + inputValue + '&id_calificacion=' + id_calificacion + '&id_gau=' + id_gau;
      // swal("Perfecto!", "You wrote: " + inputValue, "success");
    });
}


</script>


<div id="page-wrapper">
<div class="container">
  <div class="row">
		
		   <div class="col-md-12" style="position: relative; left:50px">
              <div class="panel panel-warning">
                <div class="panel-heading">
                	<?php if ($mensaje): ?>
                		<?php echo 'El usuario '.$duenio.' te calificó '.$calificacion['0']['3'].' y dijo:' ;?>	
                	<?php else: ?>
                		<?php echo 'El usuario '.$duenio.' te calificó '.$calificacion['0']['3'] ; ?>
					<?php endif; ?> 
					 <?php if ($user->isLoggedIn() && $user->data()->id == $calificacion['0']['2'] && $calificacion['0']['5'] == NULL): ?>
                    <a style= "position:absolute; right:25px" href="javascript:enviar_respuesta_calificacion(<?php echo $calificacion['0']['0']?>, <?php echo $id_gau?>)">Responder</a>
                <?php endif; ?>              	 
                </div>
				<?php if ($mensaje): ?>
	                <div class="panel-body">
	                  <!-- imprimimos la calificacion en pantalla -->
	                  <p><?php echo $mensaje ;?></p>
	                </div>
	        	<?php endif; ?>

	        	

				



              </div>
              <?php if ($calificacion['0']['5'] != NULL):?>
	        		<?php $nombre_colaborador = obtener_usuario_por_id($conexion, $calificacion['0']['2']); ?>
		            <div class="col-md-12" style="position: relative; left:50px">
		              <div class="panel panel-success">
		                <div class="panel-heading">
		                  <?php echo "El usuario " . $nombre_colaborador . " respondió:  "; ?>
		                  
		                </div>
		                <div class="panel-body">
		                  <!-- imprimimos la respuesta en pantalla -->
		                  <p><?php echo $calificacion['0']['5'] ?></p>
		                </div>
		              </div>
		            </div>
        		<?php endif; ?>
            </div>
  </div>
</div>
	<div style="text-align: center">  		<a style="text-align: center;" class="btn btn-primary" href= "account.php">Volver a mi cuenta</a>
</div>
<br>
</div>








<!-- Content Ends Here -->
<!-- footers -->
<?php require_once $abs_us_root.$us_url_root.'users/includes/page_footer.php'; // the final html footer copyright row + the external js calls ?>

<!-- Place any per-page javascript here -->
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<?php require_once $abs_us_root.$us_url_root.'users/includes/html_footer.php'; // currently just the closing /body and /html ?>
