<?php
$db = DB::getInstance();
$query = $db->query("SELECT * FROM email");
$results = $query->first();
?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <p>Felicitaciones <?=$fname;?>,</p>
    <p>Gracias por registrarse. Por favor haga click en el link debajo para verificar su dirección de email</p>
    <p><a href="<?=$results->verify_url?>users/verify.php?email=<?=$email;?>&vericode=<?=$vericode;?>">Verifique su email</a></p>
    <p>Una vez que haya verificado el email podrá loguearse!</p>
    <p>Hasta pronto!</p>
  </body>
</html>
