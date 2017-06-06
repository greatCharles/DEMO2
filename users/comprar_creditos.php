<html>
	<head>
	  <script src="node_modules/sweetalert/dist/sweetalert.min.js"></script>
	  <link rel="stylesheet" href="node_modules/sweetalert/dist/sweetalert.css">
	</head>
</html>

<?php

	//Si el usuario no está logueado lo redirigimos al login
	require_once 'init.php';
	if (!$user->isLoggedIn()) {
		Redirect::to("users/login.php");
	}
	//
	require_once $abs_us_root.$us_url_root.'users/includes/header.php';
	require_once $abs_us_root.$us_url_root.'users/includes/navigation.php';

 	//si POST viene cargado significa que ya llenaron los datos, por lo tanto modificamos los creditos del usuario.
	if ($_POST) {
		$num_tarjeta = $_POST['num_tarjeta'];
		$cod_seg = $_POST['cod_seg'];
		// Si el numero de la tarjeta tiene 16 digitos y el codigo de seguridad tiene 3 entonces agrego el nuevo saldo.
		if (mb_strlen($num_tarjeta) == 16  && (mb_strlen($cod_seg) == 3)) {
			$currentID = $user->data()->id;
			$conex= mysqli_connect('localhost', 'root', '', 'db');
			$consulta = "SELECT creditos FROM users WHERE id=$currentID";
			$query= mysqli_query($conex, $consulta);
			$array_credito = mysqli_fetch_assoc($query);
			$saldo_previo = $array_credito['creditos'];
			$saldo_posterior = $saldo_previo + $_POST['cant_creditos'];
			$updateQuery = "UPDATE users SET creditos=$saldo_posterior WHERE id=$currentID";
			mysqli_query($conex, $updateQuery);
			// redirigimos a pantalla de éxito
			header("Location:compra_exitosa.php?creditos_comprados=".urlencode($_POST['cant_creditos']));
		}elseif (mb_strlen($num_tarjeta) != 16 || mb_strlen($cod_seg) != 3) {
			// emitimos alerta
			echo '<script> sweetAlert("Oops...", "Asegúrate de que el número de la tarjeta de crédito tenga 16 dígitos y el código de seguridad 3!", "error");</script>';
		}

	}


 ?>

 <div id="page-wrapper">
	<div class="container">
		<?php require 'views/_comprar_creditos.php';?>
	</div>
</div>

<!-- Content Ends Here -->
<!-- footers -->
<?php require_once $abs_us_root.$us_url_root.'users/includes/page_footer.php'; // the final html footer copyright row + the external js calls ?>

<!-- Place any per-page javascript here -->
<script src="https://www.google.com/recaptcha/api.js" async defer></script>

<?php require_once $abs_us_root.$us_url_root.'users/includes/html_footer.php'; // currently just the closing /body and /html ?>
