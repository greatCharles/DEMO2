<?php require_once 'init.php';
require_once $abs_us_root.$us_url_root.'users/includes/header.php';
require_once $abs_us_root.$us_url_root.'users/includes/navigation.php';
require $abs_us_root.$us_url_root.'users/nuestras_configs/funciones.php';
require $abs_us_root.$us_url_root.'users/nuestras_configs/config.php';
?>

<div id="page-wrapper"> <!-- leave in place for full-screen backgrounds etc -->
<div class="container"> <!-- -fluid -->

<h1 class="text-center">Panel de administración</h1><br>

<div class="row"> <!-- row for Users, Permissions, Pages, Email settings panels -->
	<!-- Users Panel -->
	<div class="col-xs-6 col-md-3">
	<div class="panel panel-default">
	<div class="panel-heading"><strong>Reputaciones</strong></div>
	<div class="panel-body text-center"><div class="huge"> <i class='fa fa-user fa-1x'></i></div></div>
	<div class="panel-footer">
	<span class="pull-left"><a href="admin_reputaciones.php">Administrar</a></span>
	<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
	<div class="clearfix"></div>
	</div> <!-- /panel-footer -->
	</div><!-- /panel -->
	</div><!-- /col -->

	<!-- Permissions Panel -->
	<div class="col-xs-6 col-md-3">
	<div class="panel panel-default">
	<div class="panel-heading"><strong>Nivel de permisos</strong></div>
	<div class="panel-body text-center"><div class="huge"> <i class='fa fa-lock fa-1x'></i></div></div>
	<div class="panel-footer">
	<span class="pull-left"><a href="admin_permissions.php">Administrar</a></span>
	<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
	<div class="clearfix"></div>
	</div> <!-- /panel-footer -->
	</div><!-- /panel -->
	</div> <!-- /.col -->

	<!-- Pages Panel -->
	<div class="col-xs-6 col-md-3">
	<div class="panel panel-default">
	<div class="panel-heading"><strong>Páginas</strong></div>
	<div class="panel-body  text-center"><div class="huge"> <i class='fa fa-file-text fa-1x'></i> </div></div>
	<div class="panel-footer">
	<span class="pull-left"><a href="admin_pages.php">Administrar</a></span>
	<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
	<div class="clearfix"></div>
	</div> <!-- /panel-footer -->
	</div><!-- /panel -->
	</div><!-- /col -->

	<!-- Email Settings Panel -->
	<div class="col-xs-6 col-md-3">
	<div class="panel panel-default">
	<div class="panel-heading"><strong>Configuración de email</strong></div>
	<div class="panel-body text-center"><div class="huge"> <i class='fa fa-paper-plane fa-1x'></i> 9</div></div>
	<div class="panel-footer">
	<span class="pull-left"><a href='email_settings.php'>Administrar</a></span>
	<span class="pull-right"><i class='fa fa-arrow-circle-right'></i></span>
	<div class="clearfix"></div>
	</div> <!-- /panel-footer -->
	</div> <!-- /panel -->
	</div> <!-- /col -->

</div> <!-- /.row -->








<!-- Content Ends Here -->
<!-- footers -->
<?php require_once $abs_us_root.$us_url_root.'users/includes/page_footer.php'; // the final html footer copyright row + the external js calls ?>

<!-- Place any per-page javascript here -->
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<?php require_once $abs_us_root.$us_url_root.'users/includes/html_footer.php'; // currently just the closing /body and /html ?>