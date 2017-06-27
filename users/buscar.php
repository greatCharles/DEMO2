<?php
ini_set("allow_url_fopen", 1);
?>
<?php require_once 'init.php'; ?>
<?php require_once $abs_us_root.$us_url_root.'users/includes/header.php'; ?>
<?php require_once $abs_us_root.$us_url_root.'users/includes/navigation.php'; ?>
<?php require $abs_us_root.$us_url_root.'users/nuestras_configs/funciones.php'; ?>
<?php require $abs_us_root.$us_url_root.'users/nuestras_configs/config.php'; ?>

<?php
//conexion a la bd y categorias
$conex= mysqli_connect('localhost', 'root', '', 'db');
$consulta= "SELECT nombre FROM categoria";
$result= mysqli_query($conex, $consulta);

//Esto es todo lo que se hace cuando se envía el formulario
$query_locali = "SELECT localidad, provincia FROM localidades";
$result_locali = mysqli_query($conex, $query_locali);
$form_action = 'buscar.php';
$cant_gau= 0;
?>

<!-- parte dificil -->
<?php
$titulo='%%';
$ubicacion='%%';
$categoria='%%';
$localidad='%%';
$provincia='%%';
if ($_POST) {
  $titulo= '%'.$_POST['titulo'].'%';
  $categoria= '%'.$_POST['categoria'].'%';
  $ubicacion= $_POST['ubicacion'];
  if($ubicacion){
    $ubicacion= explode(' - ',$ubicacion);
    $localidad= '%'.$ubicacion['0'].'%';
    $provincia ='%'.$ubicacion['1'].'%';
  }
}

$busqueda= "SELECT * FROM gauchada WHERE titulo LIKE '$titulo' AND categoria LIKE '$categoria' AND provincia LIKE '$provincia' AND localidad LIKE '$localidad' AND estado='activa'";
$resultado= mysqli_query($conex, $busqueda);
$resultado= mysqli_fetch_all($resultado)

?>

<?php header('X-Frame-Options: DENY'); ?>
<div id="page-wrapper">
<div class="container">
<?php require 'views/_buscar.php';?>

</div>
</div>
<?php require_once $abs_us_root.$us_url_root.'users/includes/page_footer.php';
