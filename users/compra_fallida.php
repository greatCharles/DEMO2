<?php require_once 'init.php'; ?>
<?php require_once $abs_us_root.$us_url_root.'users/includes/header.php'; ?>
<?php require_once $abs_us_root.$us_url_root.'users/includes/navigation.php'; ?>

<div id="page-wrapper">
<div class="container">
<div class="row">
  <div class="col-xs-12">
  	<div class="jumbotron text-center">
  		<h1>Ooops! Parece que no tienes créditos suficientes</h1>
      <h2>Necesitas al menos 1 crédito para poder publicar una gauchada...</h2><br><br>
      <a class="btn btn-primary btn-lg" href="comprar_creditos.php">Comprar creditos</a>
      </div>
  </div>
 </div>
</div>
</div>
</div>

<!-- footers -->
<?php require_once $abs_us_root.$us_url_root.'users/includes/page_footer.php'; // the final html footer copyright row + the external js calls ?>

<!-- Place any per-page javascript here -->
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<?php require_once $abs_us_root.$us_url_root.'users/includes/html_footer.php'; // currently just the closing /body and /html ?>

<?php require_once $abs_us_root.$us_url_root.'users/includes/html_footer.php'; // currently just the closing /body and /html ?>
