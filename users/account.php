<html>
  <head>
    <script src="node_modules/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="node_modules/sweetalert/dist/sweetalert.css">
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
?>


<div id="page-wrapper">
	<div class="container">
			    <ul class="nav nav-tabs">
			        <li class="nav active"><a href="#A" data-toggle="tab">Perfil</a></li>
			        <li class="nav"><a href="#B" data-toggle="tab">Mis gauchadas</a></li>
			        <li class="nav"><a href="#C" data-toggle="tab">Gauchadas en las que participé</a></li>
			    </ul>
			    <!-- Tab panes -->
			    <div class="tab-content">
			        <div class="tab-pane fade in active" id="A">
										<h1><?=ucfirst($user->data()->username)?></h1>
										<p><?=ucfirst($user->data()->fname)." ".ucfirst($user->data()->lname)?></p>
										<p>Miembro desde: <?=$signupdate?></p>
										<!-- <p>Número de ingresos: <?=$user->data()->logins?></p> -->
										<p>Créditos disponibles: <?php echo getCreditos($conexion, $user->data()->id) ?></p>
										<!-- <p><img src="<?=$grav; ?>" class="img-thumbnail" alt="Generic placeholder thumbnail"></p> -->
										<p><a href="user_settings.php" class="btn btn-primary">Modificar Perfil</a></p>
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
																			<img class="img-responsive" src="<?php echo 'img_gauchadas/'. $gauchada['10']; ?>">
																	</a>
															</div>
															<div class="col-md-7">
																	<div class="caption">
																		<h3>
																				<a href="single_view.php?id=<?php echo $gauchada['0']?>"><?php echo $gauchada['1']?></a>
																		</h3>
																		<p><?php echo substr($gauchada['2'],0, 200).'...'?></p>
																			<a href="single_view.php?id=<?php echo $gauchada['0']?>">Ver más...</a><br><br>
																	</div>
															</div>
															<div class="col-md-2">
																<br><br>
																<a href="modificar_gauchada.php?id_gauchada=<?php echo $gauchada['0']; ?>">Modificar</a><br><br>
																<a href="javascript:confirmar()">Eliminar</a>


																<script type="text/javascript">
														          function confirmar() {
														          	swal({   title: "Estás seguro?",   text: "No vas a poder recuperar esta Gauchada!",   type: "warning",   showCancelButton: true,   confirmButtonColor: "#DD6B55",   confirmButtonText: "Si, quiero borrarla!",   closeOnConfirm: false }, function(){ window.location = 'baja_publicacion.php?id_gau=<?php echo $gauchada['0'] ?>'   });
														          }
														        </script>
															</div>
														</div>
													<?php endforeach; ?>
										</div>
									</div>
								</div>
			       <div class="tab-pane fade" id="C">Acá irían las gauchadas en las que participé</div>
			 	 </div>
	</div> <!-- /container -->
</div> <!-- /#page-wrapper -->




<!-- footers -->
<?php require_once $abs_us_root.$us_url_root.'users/includes/page_footer.php'; // the final html footer copyright row + the external js calls ?>

<!-- Place any per-page javascript here -->

<?php require_once $abs_us_root.$us_url_root.'users/includes/html_footer.php'; // currently just the closing /body and /html ?>
