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
?>


<div id="page-wrapper">
	<div class="container">
			    <ul class="nav nav-tabs">
			        <li class="nav active"><a href="#A" data-toggle="tab">Perfil</a></li>
			        <li class="nav"><a href="#B" data-toggle="tab">Mis gauchadas</a></li>
			        <li class="nav"><a href="#C" data-toggle="tab">Sarasa</a></li>
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
			        <div class="tab-pane fade" id="B">Content inside tab B</div>
			        <div class="tab-pane fade" id="C">Content inside tab C</div>
			    </div>
	</div> <!-- /container -->
</div> <!-- /#page-wrapper -->




<!-- footers -->
<?php require_once $abs_us_root.$us_url_root.'users/includes/page_footer.php'; // the final html footer copyright row + the external js calls ?>

<!-- Place any per-page javascript here -->

<?php require_once $abs_us_root.$us_url_root.'users/includes/html_footer.php'; // currently just the closing /body and /html ?>
