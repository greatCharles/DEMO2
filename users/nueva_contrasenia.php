<?php require_once 'init.php'; ?>
<?php require_once $abs_us_root.$us_url_root.'users/includes/header.php'; ?>
<?php require_once $abs_us_root.$us_url_root.'users/includes/navigation.php'; ?>
<?php require $abs_us_root.$us_url_root.'users/nuestras_configs/funciones.php';
require $abs_us_root.$us_url_root.'users/nuestras_configs/config.php'; ?>

<?php 
$conexion = conexion($bd_config);
if ($_POST) {
    if(emailExiste($conexion, $_POST['email'])){
        $characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
        $random_string_length= 8;
        $string = '';
        $max = strlen($characters) - 1;
        for ($i = 0; $i < $random_string_length; $i++) {
            $string .= $characters[mt_rand(0, $max)];
        }

        $nuevo_pass= password_hash($string, PASSWORD_BCRYPT, array('cost' => 12));
        $myfile = fopen("email.txt", "w") or die("No se puede abrir el archivo!");
        $txt = $string;
        fwrite($myfile, $txt);
        fclose($myfile);
        modificarContrasenia($conexion, $nuevo_pass, $_POST['email']);
        echo '
        <div id="page-wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="jumbotron text-center">
                            <h2>Tu contraseña ha sido modificada</h2><br>
                            <p>Verifica tu casilla de email para obtenerla</p>
                        </div>
                    </div>
                    </div>
                    </div>
                    </div>';

    }else{
        echo '<div id="page-wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="jumbotron text-center">
                            <h2>El email ingresado no existe</h2><br><br>
                            <a href="forgot_password.php" class="btn btn-primary">Volver</a>
                         </div>
                    </div>
                    </div>
                    </div>
                    </div>';

    }
}





?>





<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<!-- footer -->
<!-- footers -->
<?php require_once $abs_us_root.$us_url_root.'users/includes/page_footer.php'; // the final html footer copyright row + the external js calls ?>

<!-- Place any per-page javascript here -->

<?php require_once $abs_us_root.$us_url_root.'users/includes/html_footer.php'; // currently just the closing /body and /html ?>
