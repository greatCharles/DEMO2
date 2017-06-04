<?php
ini_set("allow_url_fopen", 1);
?>
<?php require_once 'init.php'; ?>
<?php require_once $abs_us_root.$us_url_root.'users/includes/header.php'; ?>
<?php require_once $abs_us_root.$us_url_root.'users/includes/navigation.php'; ?>
<?php if (!securePage($_SERVER['PHP_SELF'])){die();} ?>

<?php $form_action = 'publicar_gauchada.php' ?>








<?php header('X-Frame-Options: DENY'); ?>
<div id="page-wrapper">
<div class="container">
<?php require 'views/_publicar_gauchada.php';?>
</div>
</div>

<!-- footers -->
<?php require_once $abs_us_root.$us_url_root.'users/includes/page_footer.php'; // the final html footer copyright row + the external js calls ?>
