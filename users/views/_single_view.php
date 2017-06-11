

<html>
  <head>
    <script src="node_modules/sweetalert/dist/sweetalert.min.js"></script>
    <script src="js/nuestros_js.js"></script>
    <link rel="stylesheet" href="node_modules/sweetalert/dist/sweetalert.css">
    
  </head>
</html>


<?php
  $id_gau =  $gauchada[0];
  $id_user = $user->data()->id;
?>

<div class="col-md-6">
  <img class="img-thumbnail" src="<?php echo 'img_gauchadas/'.$gauchada['10']; ?>"  >
  <h2 >
    <?php echo $gauchada['1'] ?>
  </h2>
  <p><?php echo $gauchada['2'] ?></p>
</div>
<div class="col-md-6">
  <div class="jumbotron">
    <h3> Detalles de la gauchada </h3> <br>
    <p>
    <h4>Dueño: <?php echo $usuario ?></h4>
    <h4>Ubicación: <?php echo $gauchada['8']?> , <?php echo $gauchada['7'] ?></h4>
    <h4>Fecha de la publicación: <?php echo $gauchada['3'] ?></h4>
    <?php if($gauchada['5'] != '0000-00-00'): ?>
      <h4>Fecha de realización: <?php echo $gauchada['5'] ?></h4>
    <?php endif; ?>
    <br><br><br><br><br>
    <?php if($user->isLoggedIn()): ?>
      <?php if($gauchada['6'] != $user->data()->id): ?>
        <div class="btn btn-danger btn-lg btn-block" role="button">Quiero Postularme</div><br>
        <div class="btn btn-success btn-lg btn-block" role="button" onClick="enviar_comentario(<?php echo "$id_gau";?>, <?php echo "$id_user"; ?>);">Enviar un comentario</div>
      <?php else: ?>
        <div class="btn btn-danger btn-lg btn-block" role="button" onClick="confirmar(<?php echo "$id_gau"; ?>);">Dar de baja la publicación</div><br>
      <?php endif; ?>
    <?php else: ?>
        <p>Quieres postularte para realizar esta gauchada?</p><br>
        <a class="btn btn-primary" href="#">Inicia sesión</a>
    <?php endif; ?>
    </p>
  </div>
</div>
