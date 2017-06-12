<?php
ini_set("allow_url_fopen", 1);
?>
<?php require_once 'init.php'; ?>
<?php require_once $abs_us_root.$us_url_root.'users/includes/header.php'; ?>
<?php require_once $abs_us_root.$us_url_root.'users/includes/navigation.php'; ?>
<?php require $abs_us_root.$us_url_root.'users/nuestras_configs/funciones.php'; ?>
<?php require $abs_us_root.$us_url_root.'users/nuestras_configs/config.php'; ?>

<?php if (!securePage($_SERVER['PHP_SELF'])){die();} ?>
<?php $id_gauchada=$_GET['id_gauchada']; ?>
<?php $form_action = 'modificar_gauchada.php?id_gauchada=' . $id_gauchada ?>
<?php $id_gauchada=$_GET['id_gauchada']; ?>
<?php

//conexion a la bd y categorias
$conex= mysqli_connect('localhost', 'root', '', 'db');
$consulta= "SELECT nombre FROM categoria";
$result= mysqli_query($conex, $consulta);

//Esto es todo lo que se hace cuando se envía el formulario
$query_locali = "SELECT localidad, provincia FROM localidades";
$result_locali = mysqli_query($conex, $query_locali);

$gaucha=obtener_gauchada_por_id($conex,$id_gauchada);
//insertando en db

if($_POST){
	//Variables para insertar
	$tit=$_POST['titulo'];
	$desc=$_POST['descripcion'];
	$ubicacion= $_POST['ubicacion'];
	$ubicacion_explode= explode(' - ', $ubicacion);
	$localidad= $ubicacion_explode[0];
	$provincia= $ubicacion_explode[1];
	$cat=$_POST['categoria'];
	$usu_id=($user->data()->id);
	//Seteo variable en caso de que se necesita la gauchada para una fecha especifica
	if($_POST['fecha_exacta']){
		 $fecha_exacta= $_POST['fecha_exacta'];
		}else {
			$fecha_exacta= NULL;
		}
	//Muevo la foto a mi directorio local
	$be_imageName       =   $_FILES["foto"]["name"];
	$be_imageTempName   =   $_FILES["foto"]["tmp_name"];
	$be_imageSize       =   $_FILES["foto"]["size"];
	move_uploaded_file($be_imageTempName,"img_gauchadas/".$be_imageName);
	//Inserto en la db
	$sql="UPDATE gauchada
				SET titulo= '$tit', descripcion= '$desc', provincia= '$provincia', localidad='$localidad', id_usuario= '$usu_id' , categoria= '$cat', imagen= '$be_imageName', fecha_exacta= '$fecha_exacta'
  			WHERE id_gauchada='$id_gauchada'";
	if (mysqli_query($conex, $sql)) {
		// echo "New record created successfully";
		Redirect::to('modificacion_exitosa.php');
		} else {
		echo "Error: " . $sql . "<br>" . mysqli_error($conex);
		}

}


?>

<?php header('X-Frame-Options: DENY'); ?>
<div id="page-wrapper">
<div class="container">
<?php require 'views/_modificar_gauchada.php';?>
</div>
</div>


<!-- footers -->
<?php require_once $abs_us_root.$us_url_root.'users/includes/page_footer.php'; // the final html footer copyright row + the external js calls ?>
