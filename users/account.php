<html>
  <head>
    <script src="node_modules/sweetalert/dist/sweetalert.min.js"></script>
    <script src="js/nuestros_js.js"></script>
    <link rel="stylesheet" href="node_modules/sweetalert/dist/sweetalert.css">
    <link rel="stylesheet" href="css/estilo_notifi.css">
  </head>
</html>

<?php
/*
UserSpice 4
An Open Source PHP User Management System
by the UserSpice Team at http://UserSpice.com

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

?>
<?php require_once 'init.php'; ?>
<?php require_once $abs_us_root.$us_url_root.'users/includes/header.php'; ?>
<?php require_once $abs_us_root.$us_url_root.'users/includes/navigation.php'; ?>
<?php require $abs_us_root.$us_url_root.'users/nuestras_configs/funciones.php'; ?>
<?php require $abs_us_root.$us_url_root.'users/nuestras_configs/config.php'; ?>

<?php if (!securePage($_SERVER['PHP_SELF'])){die();}?>

<?php
	$grav = get_gravatar(strtolower(trim($user->data()->email)));
	$get_info_id = $user->data()->id;
	// $groupname = ucfirst($loggedInUser->title);
	$raw = date_parse($user->data()->join_date);
	$signupdate = $raw['month']."/".$raw['day']."/".$raw['year'];
	$userdetails = fetchUserDetails(NULL, NULL, $get_info_id);
	$conexion= conexion($bd_config); //Fetch user details
	$mis_gauchadas= getMisGauchadas($conexion, $user->data()->id);
	$notificaciones = getNotificaciones($conexion, $user->data()->id);
  $gauchadas_participe= getGauchadasParticipe($conexion, $user->data()->id);
  $calificaciones= getMisCalificaciones($conexion, $user->data()->id);
  $puntaje= $user->data()->puntos;


?>


<div id="page-wrapper">
	<div class="container">
			    <ul class="nav nav-tabs">
			        <li class="nav active"><a href="#A" data-toggle="tab">Perfil</a></li>
			        <li class="nav"><a href="#B" data-toggle="tab">Mis gauchadas</a></li>
              <li class="nav"><a href="#D" data-toggle="tab">Gauchadas en las que participé</a></li>
			        <li class="nav"><a href="#C" data-toggle="tab">Notificaciones</a></li>
              <li class="nav"><a href="#E" data-toggle="tab">Mis calificaciones</a></li>
			    </ul>
			    <!-- Tab panes -->
			    <div class="tab-content">
			        <div class="tab-pane fade in active" id="A">
										<h1><?=ucfirst($user->data()->username)?></h1>
										<p><?=ucfirst($user->data()->fname)." ".ucfirst($user->data()->lname)?></p>
                    <p>Reputación: <?php echo getReputacion($conexion, $puntaje);?> con <?php echo $puntaje  ?> puntos </p>
										<p>Miembro desde: <?=$signupdate?></p>
										<!-- <p>Número de ingresos: <?=$user->data()->logins?></p> -->
										<p>Créditos disponibles: <?php echo getCreditos($conexion, $user->data()->id) ?> <a href="comprar_creditos.php">(Comprar más)</a></p>
										<!-- <p><img src="<?=$grav; ?>" class="img-thumbnail" alt="Generic placeholder thumbnail"></p> -->
										<p><a href="user_settings.php" class="btn btn-primary">Modificar Perfil</a></p>
                                        <p style="width: 300"><a href="javascript:confirmarBajaCuenta(<?php echo "$get_info_id"; ?>)" class="btn btn-danger">Eliminar cuenta</a></p>
										<!-- <p><a class="btn btn-primary" href="profile.php?id=<?=$get_info_id;?>" role="button">Perfil público</a></p> -->
					    </div>
							<!--Contenido de Mis Gauchadas-->
			        <div class="tab-pane fade" id="B">
								<div class="container-fluid">
										<div class="row">
													<?php foreach($mis_gauchadas as $gauchada): ?>
    														<div class="col-md-12">
    															<hr><div class="col-md-3">
    																	<a href="single_view.php?id=<?php echo $gauchada['0']?>">
                                        <?php if($gauchada['10']): ?>
                													<img class="img-responsive" src="<?php echo 'img_gauchadas/'. $gauchada['10']; ?>">
                												<?php else: ?>
                													<img class="img-responsive" src="img_gauchadas/sin_imagen.jpg">
                												<?php endif; ?>
    																	</a>
    															</div>
    															<div class="col-md-6">
    																	<div class="caption">
    																		<h3>
    																				<a href="single_view.php?id=<?php echo $gauchada['0']?>"><?php echo $gauchada['1']?></a>
    																		</h3>
    																		<p><?php echo substr($gauchada['2'],0, 200).'...'?></p>
    																			<a href="single_view.php?id=<?php echo $gauchada['0']?>">Ver más...</a><br><br>
    																	</div>
    															</div>
    															<div class="col-md-3">
    																<br><br>
                                    <a href="single_view.php?id=<?php echo $gauchada['0']; ?>#seccion-postu">Ver postulantes</a><br>
                                    <a href="single_view.php?id=<?php echo $gauchada['0']; ?>#seccion-comments">Ver comentarios</a><br>
                                    <?php if($gauchada['11'] && $gauchada['12'] == '0'): ?> <!-- Checkeo que la gauchada tenga colaborador y no esté ya calificada para mostrar el boton de calificar -->
                                    	<a href="dejar_reputacion.php?id=<?php echo $gauchada['0']; ?>">Dejar reputacion</a><br>
                                    <?php elseif($gauchada['12'] == '1'): ?> <!-- Si la gauchada está completada, se lo hago saber al usuario -->
                                    	<p style="color: green">Ya calificaste a <?php echo obtener_usuario_por_id($conexion, $gauchada['11']); ?> <a href="calificacion.php?id_gau=<?php echo $gauchada['0']; ?>">( Ver )</a></p>
                                    <?php endif; ?>
                                    <?php if(tienePostulantes($conexion,$gauchada['0'])): ?>
                                      <a onclick="javascript:error_1()" href="#">Modificar</a>
                                    <?php else: ?>
                                      <a href="modificar_gauchada.php?id_gauchada=<?php echo $gauchada['0']; ?>">Modificar</a>
                                    <?php endif; ?>
                                  <br>
                                  <?php if($gauchada['6'] == $user->data()->id): ?>
    																 <a href="javascript:confirmar()">Eliminar</a>
                                  <?php endif; ?>
    																<script type="text/javascript">
    														          function confirmar() {
    														          	swal({   title: "Estás seguro?",   text: "No vas a poder recuperar esta Gauchada!",   type: "warning",   showCancelButton: true,   confirmButtonColor: "#DD6B55",   confirmButtonText: "Si, quiero borrarla!",   closeOnConfirm: false }, function(){ window.location = 'baja_publicacion.php?id_gau=<?php echo $gauchada['0'] ?>'   });
    														          }
                                          function error_1(){
                                            sweetAlert("Oops...", "La gauchada posee postulantes por lo tanto no se puede modificar", "error");
                                          }
														        </script>
    															</div>
    														</div>
													<?php endforeach; ?>
										</div>
									</div>
                  <br>
					  </div>
            <!--Contenido de Gauchadas en las que participé como colaborador-->
            <div class="tab-pane fade" id="D">
              <div class="container-fluid">
                  <div class="row">
                        <?php foreach($gauchadas_participe as $gauchada_p): ?>

                              <div class="col-md-12">
                                <hr><div class="col-md-3">
                                    <a href="single_view.php?id=<?php echo $gauchada_p['0']?>">
                                      <?php if($gauchada_p['10']): ?>
                                        <img class="img-responsive" src="<?php echo 'img_gauchadas/'. $gauchada_p['10']; ?>">
                                      <?php else: ?>
                                        <img class="img-responsive" src="img_gauchadas/sin_imagen.jpg">
                                      <?php endif; ?>
                                    </a>
                                </div>
                                <div class="col-md-7">
                                    <div class="caption">
                                      <h3>
                                          <a href="single_view.php?id=<?php echo $gauchada_p['0']?>"><?php echo $gauchada_p['1']?></a>
                                      </h3>
                                      <p><?php echo substr($gauchada_p['2'],0, 200).'...'?></p>
                                        <a href="single_view.php?id=<?php echo $gauchada_p['0']?>">Ver más...</a><br><br>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                  <br><br>
                                  <a href="single_view.php?id=<?php echo $gauchada_p['0']; ?>#seccion-comments">Ver comentarios</a><br>
                                  
                                <br>
                                  <script type="text/javascript">
                                        function confirmar() {
                                          swal({   title: "Estás seguro?",   text: "No vas a poder recuperar esta Gauchada!",   type: "warning",   showCancelButton: true,   confirmButtonColor: "#DD6B55",   confirmButtonText: "Si, quiero borrarla!",   closeOnConfirm: false }, function(){ window.location = 'baja_publicacion.php?id_gau=<?php echo $gauchada['0'] ?>'   });
                                        }
                                        function error_1(){
                                          sweetAlert("Oops...", "La gauchada posee postulantes por lo tanto no se puede modificar", "error");
                                        }
                                  </script>
                                </div>
                              </div>
                        <?php endforeach; ?>
                  </div>
                </div>
                <br>
            </div>
            <!--Hasta acá Contenido de Gauchadas en las que participé como colaborador-->


             <!-- Notificaciones -->
					   <div class="tab-pane fade" id="C">
					   	  <div class="container-fluid">
    							<div class="row">
    								<?php foreach($notificaciones as $notificacion): ?>
    									<br>
    									<div class="col-md-12">

    											<?php if($notificacion['6'] == "negativo"): ?>

                            <div class="alert" onclick="<?php marcarNotiComoLeida($conexion, $notificacion['0']); ?>">


                                <span class="closebtn" onclick="this.parentElement.style.display='none'">&times;</span>
                                <a class="link-notifi" href=<?php echo $notificacion['5'] ?>><?php echo $notificacion['2'] ?></a>
                            </div>

                            <!-- <div onclick="<?php marcarNotiComoLeida($conexion, $notificacion['0']); ?>" class="alert alert-danger" role="alert">
                               <?php echo $notificacion['2'] ?>
                            </div>              -->
    										  <?php else: ?>
                            <div class="alert alert-info">
                                <span class="closebtn" onclick="this.parentElement.style.display='none'">&times;</span>
                                <a class= "link-notifi" href=<?php echo $notificacion['5'] ?>><?php echo $notificacion['2'] ?></a>
                            </div>

                            <!-- <div class="alert alert-info" role="alert">
    											     <?php echo $notificacion['2'] ?>
    											  </div> -->
    										  <?php endif; ?>

    									</div>
    								<?php endforeach; ?>
    							</div>
						 </div>
					  </div>
            <!-- Hasta acá Notificaciones -->

            <!-- Mis calificaciones -->
            <script>
            	function enviar_respuesta_calificacion2(id_calificacion, id_gau) {
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
                  window.location = 'respuesta_enviada_calificacion.php?respuesta=' + inputValue + '&id_calificacion=' + id_calificacion + '&id_gau=' + id_gau + '&voy_a_tab=' + 'si';
                  // swal("Perfecto!", "You wrote: " + inputValue, "success");
                });
            }
            </script>
            <br>
            <div class="tab-pane fade" id="E">
               <div class="container-fluid">
                 <div class="row">
                   <?php foreach($calificaciones as $calificacion): ?>
                      <?php $duenio = obtener_usuario_por_id($conexion, $calificacion['1']); ?>
                      <?php $mensaje = $calificacion['4']; ?>
                      <?php $gauchada = obtener_gauchada_por_id($conexion, $calificacion['6']); ?>
                      <?php $titulo_gauchada = $gauchada['0']['1'];?>
                       <div class="col-md-12" style="position: relative; left:50px">
                              <hr>
                              <!--Lo que dijo el dueño de la gauchada -->
                              <div class="panel panel-warning">
                                <div class="panel-heading">
                                	<?php if ($mensaje): ?>
                                		<?php echo 'El usuario '.$duenio.' te calificó '.$calificacion['3'] . ' en la gauchada '?><a href="single_view.php?id=<?php echo $gauchada['0']['0'] ?>"> <?php echo $titulo_gauchada ?></a> y dijo:
                                	<?php else: ?>
                                		<?php echo 'El usuario '.$duenio.' te calificó '.$calificacion['3'] . ' en la gauchada '?><a href="single_view.php?id=<?php echo $gauchada['0']['0'] ?>"> <?php echo $titulo_gauchada ?></a> ;
                					        <?php endif; ?>
                					        <?php if ($calificacion['5'] == NULL): ?>
                                    <a style= "position:absolute; right:25px" href="javascript:enviar_respuesta_calificacion2(<?php echo $calificacion['0']?>, <?php echo $calificacion['6'] ?>)">Responder</a>
                                  <?php endif; ?>
                                </div>
                				        <?php if ($mensaje): ?>
                	                 <div class="panel-body">
                	                  <!-- imprimimos la calificacion en pantalla -->
                	                    <p><?php echo $mensaje ;?></p>
                	                 </div>
                	        	    <?php endif; ?>
                              </div>
                              <!--Lo que responde el colaborador-->
                              <?php if ($calificacion['5'] != NULL):?>
                  	        		 <div class="col-md-12" style="position: relative; left:50px">
                  		              <div class="panel panel-success">
                  		                <div class="panel-heading">
                  		                  <?php echo "Vos le respondiste: "; ?>
                  		                </div>
                  		                <div class="panel-body">
                  		                  <!-- imprimimos la respuesta en pantalla -->
                  		                  <p><?php echo $calificacion['5'] ?></p>
                  		                </div>
                  		              </div>
                  		            </div>

                        		   <?php endif; ?>
                      </div>

                   <?php endforeach; ?>
                </div>
              </div>
            </div>
           <!-- Hasta acá Mis calificaciones -->
         </div>



<!-- 			onclick="<?php marcarNotiComoLeida($conexion, $notificacion['0']); ?>"
 -->	</div> <!-- /container -->
</div> <!-- /#page-wrapper -->




<!-- footers -->
<?php require_once $abs_us_root.$us_url_root.'users/includes/page_footer.php'; // the final html footer copyright row + the external js calls ?>

<!-- Place any per-page javascript here -->

<?php require_once $abs_us_root.$us_url_root.'users/includes/html_footer.php'; // currently just the closing /body and /html ?>
