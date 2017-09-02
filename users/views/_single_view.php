<html>
  <head>
    <script src="node_modules/sweetalert/dist/sweetalert.min.js"></script>
    <script src="js/nuestros_js.js"></script>
    <link rel="stylesheet" href="node_modules/sweetalert/dist/sweetalert.css">
    <link rel="stylesheet" href="css/estilo_comentarios.css">
  </head>
</html>

<script type="text/javascript">

  function confirmar_postulacion(id_gau, id_aplicante) {
  swal({
  title: "Postulación",
  text: "Dile al dueño de la gauchada los motivos por los cuales te quieres postular!",
  type: "input",
  showCancelButton: true,
  closeOnConfirm: false,
  animation: "slide-from-top",
  inputPlaceholder: "Ej: Espero que aceptes mi postulación!"
  },
    function(inputValue){
      if (inputValue === false) return false;

      if (inputValue === "") {
        swal.showInputError("No te olvides de escribir algo!");
        return false
      }
      window.location = 'postulacion_exitosa.php?comentario=' + inputValue + '&id_gau=' + id_gau + '&id_aplicante=' + id_aplicante;
      // swal("Perfecto!", "You wrote: " + inputValue, "success");
    });
}

function confirmarPostulanteElegido(id_user, id_gau) {
  swal({   title: "Estás seguro de elegirlo?",   text: "Se desestimarán las demás postulaciones",   type: "warning",   showCancelButton: true,   confirmButtonColor: "#DD6B55",   confirmButtonText: "Si, quiero elegirlo!",   closeOnConfirm: false }, function(){ window.location = 'postulante_elegido.php?id_user=' + id_user  + '&id_gau=' + id_gau  });
}

function confirmarBajaGauchada(id_gau) {
  swal({   title: "Estás seguro?",   text: "En caso de que la publicación posea postulantes se perderá el credito gastado!",   type: "warning",   showCancelButton: true,   confirmButtonColor: "#DD6B55",   confirmButtonText: "Si, quiero borrarla!",   closeOnConfirm: false }, function(){ window.location = 'baja_publicacion.php?id_gau=' + id_gau   });
}

</script>

<?php
  $id_gau =  $gauchada[0];
  $meses = array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
  $fecha_desde= strtotime($gauchada['3']);
  $fecha_exacta= strtotime($gauchada['5']);
  if ($user->isLoggedIn()){
    $id_user = $user->data()->id;
  }
?>

<div class="col-md-6">
  <div class="thumbnail">
    <?php if($gauchada['10']): ?>
      <img class="img-responsive" src="<?php echo 'img_gauchadas/'.$gauchada['10']; ?>"  >
    <?php else: ?>
      <img class="img-responsive" src="img_gauchadas/sin_imagen.jpg">
    <?php endif; ?>
    <div class="caption">
      <h2 >
        <?php echo $gauchada['1'] ?>
      </h2>
      <p><?php echo $gauchada['2'] ?></p>
    </div>
  </div>
</div>
<div class="col-md-6">
  <div class="jumbotron">
    <h3> Detalles de la gauchada </h3> <br>
    <p>
    <h4>Dueño: <?php echo $usuario ?></h4>
    <h4>Ubicación: <?php echo $gauchada['8']?> , <?php echo $gauchada['7'] ?></h4>
    <h4>Fecha de la publicación: <?php echo date('d', $fecha_desde)." de ".$meses[date('n', $fecha_desde)-1]. " del ".date('Y', $fecha_desde); ?></h4>
    <h4>Categoría: <?php echo $gauchada['9']?></h4>
    <?php if($gauchada['5'] != '0000-00-00'): ?>
      <h4>Fecha de realización: <?php echo date('d', $fecha_exacta)." de ".$meses[date('n', $fecha_exacta)-1]. " del ".date('Y', $fecha_exacta); ?></h4>
    <?php endif; ?>
    <br><br><br><br><br>
    <?php if($user->isLoggedIn()): ?>
        <!--Si no sos el dueño de la gauchada-->
        <?php if($gauchada['6'] != $user->data()->id): ?>
          <!-- Si ya hay  un colaborador elegido y ademas ese colaborador es el usuario logueado -->
          <?php if($gauchada['11'] != NULL && $gauchada['11'] == $user->data()->id): ?>
            <p class="text-center">Felicitaciones. Has sido seleccionado como colaborador en esta gauchada.</p><br>
            <?php if($gauchada['11'] && ($gauchada['11'] == $user->data()->id)): ?>
            <?php $postulante_elegido= obtener_datos_usuario($conexion, $gauchada['6']); ?>
            <h3>Datos de contacto</h3><br>
              <h4>Nombre: <?php echo $postulante_elegido['0']['4'] ?></h4>
              <h4>Apellido: <?php echo $postulante_elegido['0']['5'] ?></h4>
              <h4>Email: <?php echo $postulante_elegido['0']['1'] ?></h4>
              <?php $telefono= $postulante_elegido['0']['41']; ?>
              <?php if($telefono != NULL): ?>
                <h4>Telefono: <?php echo $telefono; ?></h4>
              <?php endif; ?>
          <?php endif; ?><br>
          <?php endif; ?>
<!--       Si el usuario se encuentra postulado y todavia no hay un colaborador elegido  --> 
           <?php if(estaPostulado($conexion, $id_gauchada, $user->data()->id) && ($gauchada['11'] == NULL)): ?>
              <?php $id_postulacion= obtener_id_postulacion($conexion, $id_gauchada, $user->data()->id)?>
              <p class="text-center">Te encuentras postulado para esta gauchada</p><br>
              <?php if(!$gauchada['11']): ?>
              <div class="btn btn-danger btn-lg btn-block" role="button" onClick="confirmarBajaPostulacion(<?php echo $id_postulacion['0']['0']; ?>);">Cancelar Postulación</div><br>
            <?php endif; ?>
            <?php elseif(!$gauchada['11']): ?>
              <div class="btn btn-danger btn-lg btn-block" role="button" onClick="confirmar_postulacion(<?php echo "$id_gau"; ?>, <?php echo "$id_user"; ?>);">Quiero Postularme</div><br>
              <!-- Si ya hay un colaborador elegido -->
            <?php elseif($gauchada['11'] && $gauchada['11'] != $user->data()->id): ?>
              <p class="text-center">Ya se ha elegido un colaborador para esta gauchada</p>
            <?php endif; ?>
            <?php if(!$gauchada['11']): ?>
              <div class="btn btn-success btn-lg btn-block" role="button" onClick="enviar_comentario(<?php echo "$id_gau";?>, <?php echo "$id_user"; ?>);">Enviar un comentario</div>
            <?php endif; ?>
<!--             si sos el colaborador
 -->

            







       <!--Si sos el dueño de la gauchada-->
       <?php else: ?>

        

          <?php if($gauchada['11']): ?>
            <?php $postulante_elegido= obtener_datos_usuario($conexion, $gauchada['11']); ?>
            <p class="text-center">Ya elegiste un postulante para esta gauchada</p>
            <h3>Datos de contacto</h3><br>
              <h4>Nombre: <?php echo $postulante_elegido['0']['4'] ?></h4>
              <h4>Apellido: <?php echo $postulante_elegido['0']['5'] ?></h4>
              <h4>Email: <?php echo $postulante_elegido['0']['1'] ?></h4>
              <?php $telefono= $postulante_elegido['0']['41']; ?>
              <?php if($telefono != NULL): ?>
                <h4>Telefono: <?php echo $telefono; ?></h4>
              <?php endif; ?>
          <?php endif; ?><br>
        <div class="btn btn-danger btn-lg btn-block" role="button" onClick="confirmarBajaGauchada(<?php echo "$id_gau"; ?>);">Dar de baja la publicación</div><br>
      <?php endif; ?>
   <!--Si no iniciaste sesión-->
   <?php else: ?>
        <!-- <p>Quieres postularte para realizar esta gauchada?</p><br>
        <a class="btn btn-primary" href="#">Inicia sesión</a> -->
   <?php endif; ?>
  </div>
</div>

<!-- Para mostrar las postulaciones checkeo que el usuario esté loguiado y que sea el mismo que el dueño de la gauchada y que no tenga un postulante ya elegido

-->
<?php if(!$gauchada['11']): ?>
  <?php if ($user->isLoggedIn() && $user->data()->id == $gauchada['6']):?>
      <div class="col-md-12" id="seccion-postu" >
        <h1 class="text-center">Postulaciones</h1><br><br>
      </div>
      <?php if(!$postulaciones): ?>
        <div class="col-md-12">
          <p class="text-center">Por el momento no existen postulaciones para esta gauchada</p>
        </div>
      <?php else: ?>
          <?php foreach($postulaciones as $postulacion): ?>
            <?php $nombre_user= obtener_usuario_por_id($conexion, $postulacion['1']);?>
            <!-- obtenemos todos los datos del usuario postulado -->
            <?php $datos_usuario = obtener_datos_usuario($conexion, $postulacion['1']);?>
            <!-- guardamos la cantidad de puntos, los puntos estan en la posicion 0,40 del arreglo de usuarios -->
            <?php $cant_puntos_usuario = $datos_usuario['0']['40'];?>
            <!-- guardamos la reputacion para despues imprimirla adentro del parentesis -->
            <?php $reputacion_usuario = getReputacion($conexion, $cant_puntos_usuario); ?>

            <div class="col-md-12">
              <div class="panel panel-info">
                <div class="panel-heading">
                  <?php $fecha_postu= strtotime($postulacion['3']); ?>
                  <p style="display: inline;">El usuario <a class="link-usuario" href="perfil_usuario.php?id_user=<?php echo $postulacion['1']; ?>"><?php echo $nombre_user; ?></a> (<?php echo $reputacion_usuario ;?>) se postuló el <?php echo date('d', $fecha_postu)." de ".$meses[date('n', $fecha_postu)-1]. " del ".date('Y', $fecha_postu).
                            " a las ".date('H:i', $fecha_postu).' hs';?> y escribió:</p>
                <div class="btn btn-primary btn-xs" role="button" onClick="confirmarPostulanteElegido(<?php echo $postulacion['1'] ?>, <?php echo $id_gauchada ?> );" style="width: 15%; position: absolute;right: 25px;">Elegir postulante</div><br>
                </div>
                <div class="panel-body">
                  <p><?php echo $postulacion['4'] ?></p>
                </div>
              </div>
            </div>
          <?php endforeach; ?>
      <?php endif; ?>
    <?php endif; ?>
<?php endif; ?>

<!-- Postulaciones -->

<!-- Comentarios -->

<div class="col-md-12" id="seccion-comments">
  <h1 class="text-center">Comentarios</h1><br><br>
</div>
<?php if(!$comentarios): ?>
  <div class="col-md-12">
    <p class="text-center">Por el momento no existen comentarios para esta gauchada</p>
  </div>
<?php else: ?>
        <?php foreach($comentarios as $comentario): ?>
          <?php $nombre_user= obtener_usuario_por_id($conexion, $comentario['3']); ?>
          <!-- obtenemos todos los datos del usuario -->
          <?php $datos_usuario=obtener_datos_usuario($conexion, $comentario['3']); ?>
          <!-- guardamos la cantidad de puntos, los puntos estan en la posicion 0,40 del arreglo de usuarios -->
          <?php $cant_puntos_usuario = $datos_usuario['0']['40']; ?>
          <!-- guardamos la reputacion para despues imprimirla adentro del parentesis -->
          <?php $reputacion_usuario = getReputacion($conexion, $cant_puntos_usuario); ?>
          <div class="col-md-12">
            <div class="panel panel-warning">
              <div class="panel-heading">
                <!-- Aca va el nombre del usuario -->

                <?php $fecha_coment= strtotime($comentario['1']);
                      echo "El día ".date('d', $fecha_coment)." de ".$meses[date('n', $fecha_coment)-1]. " del ".date('Y', $fecha_coment).
                      " a las ".date('H:i', $fecha_coment).' hs';
                ?>
                <a class="link-usuario" href="perfil_usuario.php?id_user=<?php echo $comentario['3']; ?>"><?php echo $nombre_user;?></a> (<?php echo $reputacion_usuario ?>) comentó:
                <!-- Chequea 3 cosas para habilitar el botón de Responder -->
                <?php if ($user->isLoggedIn() && $user->data()->id == $gauchada['6'] && $comentario['5'] == NULL): ?>
                    <a style= "position:absolute; right:25px" href="javascript:enviar_respuesta(<?php echo $comentario['0'].', '.$id_gau ?>)">Responder</a>
                <?php endif; ?>
                <!-- -->
              </div>
              <div class="panel-body">
                <p><?php echo $comentario['4'] ?></p>
              </div>
            </div>
          </div>
        <!-- Checkeo si hay respuesta, si la hay la muestro en pantalla -->
        <?php if ($comentario['5'] != NULL):?>
            <div class="col-md-12" style="position: relative; left:50px">
              <div class="panel panel-default">
                <div class="panel-heading">
                  <?php $fecha_coment= strtotime($comentario['6']);
                  echo "El día ".date('d', $fecha_coment)." de ".$meses[date('n', $fecha_coment)-1]. " del ".date('Y', $fecha_coment).
                  " a las ".date('H:i', $fecha_coment).' hs';
                  ?>
                  <?php $usuario= obtener_usuario_por_id($conexion, $gauchada['6']); echo $usuario.' respondió:';?>
                </div>
                <div class="panel-body">
                  <!-- imprimimos la respuesta en pantalla -->
                  <p><?php echo $comentario['5'] ?></p>
                </div>
              </div>
            </div>
        <?php endif; ?>
    <?php endforeach; ?>
  <?php endif; ?>
