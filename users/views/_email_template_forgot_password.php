<?php
$db = DB::getInstance();
$query = $db->query("SELECT * FROM email");
$results = $query->first();
?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
  </head>
  <body>
    <p>Hola <?=$fname;?>,</p>
    <p>Usted está recibiendo este correo por que hubo una petición de cambio de contraseña. Si usted no ha realizado esta acción, ignore este correo.</p>
    <p>Si fue usted, haga click en el link para continuar con el proceso de reseteo de contraseña.</p>
    <p><a href="<?php echo $results->verify_url."users/forgot_password_reset.php?email=".$email."&vericode=$vericode&reset=1"; ?>">Reestablecer contraseña</a></p>
    <p>Sinceramente,</p>
    <p>unaGauchada</p>
  </body>
</html>
