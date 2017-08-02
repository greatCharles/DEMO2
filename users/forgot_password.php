<?php require_once 'init.php'; ?>
<?php require_once $abs_us_root.$us_url_root.'users/includes/header.php'; ?>
<?php require_once $abs_us_root.$us_url_root.'users/includes/navigation.php'; ?>



<div id="page-wrapper">
    <div class="container">

        <div class="row">
            <div class="col-xs-12">
            <h1>Restablezca su contraseña.</h1>
            <ol>
                <li>Ingrese su email y presione "Reestablecer"</li>
                <li>Revise su email y haga click en el link que se le envió por correo</li>
                <li>Siga las instrucciones indicadas en pantalla</li>
            </ol>
            <form action="nueva_contrasenia.php" method="post" class="form ">
                
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="text" name="email" placeholder="Dirección de email" class="form-control" autofocus required>
                </div>

                <p><input type="submit" name="forgotten_password" value="Reestablecer" class="btn btn-primary"></p>
            </form>

            </div><!-- /.col -->
        </div><!-- /.row -->


    </div><!-- /.container-fluid -->
</div><!-- /#page-wrapper -->
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<!-- footer -->
<!-- footers -->
<?php require_once $abs_us_root.$us_url_root.'users/includes/page_footer.php'; // the final html footer copyright row + the external js calls ?>

<!-- Place any per-page javascript here -->

<?php require_once $abs_us_root.$us_url_root.'users/includes/html_footer.php'; // currently just the closing /body and /html ?>
