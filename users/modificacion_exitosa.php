<?php require_once 'init.php';
require_once $abs_us_root.$us_url_root.'users/includes/header.php';
require_once $abs_us_root.$us_url_root.'users/includes/navigation.php';
?>

<?php  ?>
<div id="page-wrapper">
<div class="container">
  <div class="row">
    <div class="col-xs-12">
        <div class="jumbotron text-center">
            <h1>Felicitaciones!</h1>
            <p>Su gauchada ha sido modificada exitosamente.</p>
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
