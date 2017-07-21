<?php

function conexion($bd_config){
  try{
    $conexion= mysqli_connect('localhost', $bd_config['usuario'], '', $bd_config['basedatos']);
    return $conexion;
  }catch(PDOException $e){
      echo "ERROR: ". $e->getMessage();
      return false;
  }
}

function limpiarDatos($datos){
  $datos= trim($datos);
  $datos= stripslashes($datos);
  $datos= htmlspecialchars($datos);
  return $datos;
}

function pagina_actual(){
  return isset($_GET['p']) ? (int)$_GET['p'] : 1;
}

function getGauchada($post_por_pagina, $conexion){
  $inicio= (pagina_actual() > 1) ? pagina_actual() * $post_por_pagina - $post_por_pagina : 0;
  $consulta = "SELECT SQL_CALC_FOUND_ROWS * FROM gauchada WHERE estado='activa' ORDER BY id_gauchada DESC LIMIT $inicio, $post_por_pagina";
  $result= mysqli_query($conexion, $consulta);
  return mysqli_fetch_all($result);
}

function numero_paginas($post_por_pagina, $conexion){
  $consulta= "SELECT COUNT(*) FROM gauchada as total";
  $total_post= mysqli_query($conexion, $consulta);
  $total_post= mysqli_fetch_all($total_post);
  $numero_paginas= ceil($total_post['0']['0'] / $post_por_pagina);
  return $numero_paginas;
}

function id_gauchada($id){
  return (int)limpiarDatos($id);
}

function obtener_gauchada_por_id($conex, $id){
  $result=$conex->query("SELECT * FROM gauchada WHERE id_gauchada= $id LIMIT 1");
  $result= mysqli_fetch_all($result);
  return ($result) ? $result : false;

}

function obtener_usuario_por_id($conex, $id){
  $result=$conex->query("SELECT username FROM users WHERE id= $id LIMIT 1");
  $result= mysqli_fetch_all($result);
  return $result['0']['0'];
}

function getCreditos($conex, $id){
  $result= $conex->query("SELECT creditos FROM users WHERE id= $id");
  $result= mysqli_fetch_all($result);
  return $result['0']['0'];
}

function devolver($conex, $id){
  $creditos= getCreditos($conex, $id) + 1;
  $conex->query("UPDATE users SET creditos= $creditos WHERE id= $id");
  return $creditos;
}

function setCreditos($conex, $id){
  $creditos= getCreditos($conex, $id) - 1;
  $conex->query("UPDATE users SET creditos= $creditos WHERE id= $id");
  return $creditos;
}

function getMisGauchadas($conex, $id){
  $consulta = "SELECT * FROM gauchada WHERE id_usuario= $id AND estado='activa'";
  $result= mysqli_query($conex, $consulta);
  return mysqli_fetch_all($result);
}

function getGauchadasParticipe($conex, $id){
  $consulta = "SELECT * FROM gauchada WHERE id_elegido= $id";
  $result= mysqli_query($conex, $consulta);
  return mysqli_fetch_all($result);
}

function getComentarios($conex, $id){
  $consulta= "SELECT * FROM comentarios WHERE id_gauchada= $id ORDER BY id_comentario DESC";
  $result= mysqli_query($conex, $consulta);
  return mysqli_fetch_all($result);
}

function getPostulaciones($conexion, $id_gau){
  $result= $conexion->query("SELECT * FROM postulacion WHERE id_gauchada = $id_gau ORDER BY id_postulacion DESC");
  $result= mysqli_fetch_all($result);
  return $result;
}

function estaPostulado($conexion, $id_gau, $id_user){
  $result= $conexion->query("SELECT * FROM postulacion WHERE id_gauchada= $id_gau AND id_user= $id_user");
  return (mysqli_num_rows($result) > 0);
}

function poseePostulantes($conexion, $id_gau){
  $result= $conexion->query("SELECT * FROM postulacion WHERE id_gauchada= $id_gau");
  return (mysqli_num_rows($result) > 0);
}

function obtener_id_postulacion($conexion, $id_gau, $id_user){
  $result= $conexion->query("SELECT * FROM postulacion WHERE id_gauchada= $id_gau AND id_user= $id_user");
  $result= mysqli_fetch_all($result);
  return $result;
}

function obtener_datos_usuario($conex, $id){
  $result=$conex->query("SELECT * FROM users WHERE id= $id LIMIT 1");
  $result= mysqli_fetch_all($result);
  return $result;
}

function setPuntos($conex, $id_elegido, $id_gau, $calificacion){
  switch ($calificacion) {
    case 'positivo':
      $conex->query("UPDATE users SET puntos=puntos + 2 WHERE id=$id_elegido");
      $conex->query("UPDATE gauchada SET completada=1 WHERE id_gauchada=$id_gau");
      break;
    case 'neutral':
      $conex->query("UPDATE gauchada SET completada=1 WHERE id_gauchada=$id_gau");
      break;
    case 'negativo':
      $conex->query("UPDATE users SET puntos=puntos - 1 WHERE id=$id_elegido");
      $conex->query("UPDATE gauchada SET completada=1 WHERE id_gauchada=$id_gau");
      break;
  }
}

function getNotificaciones($conex, $id_usuario){
    $result= $conex->query("SELECT * FROM notificaciones WHERE id_usuario= $id_usuario ORDER BY id_notificacion DESC");
    $result= mysqli_fetch_all($result);
    return $result;
  }

function marcarNotiComoLeida($conex, $id_notificacion){
    $conex->query("UPDATE notificaciones SET estado = 'Leida' WHERE id_notificacion= $id_notificacion");
  }

function tienePostulantes($conex,$id_gau){
  $result=$conex->query("SELECT * FROM postulacion WHERE id_gauchada = $id_gau");
  return (mysqli_num_rows($result) > 0);
}

function borrarDatosCuenta($conex, $id_user){
  $conex->query("DELETE FROM users WHERE id = $id_user");
  $conex->query("DELETE FROM notificaciones WHERE id_usuario = $id_user");
  $conex->query("DELETE FROM postulacion WHERE id_user = $id_user");
  $conex->query("DELETE FROM comentarios WHERE id_user = $id_user");
  $conex->query("UPDATE gauchada SET estado = 'inactiva' WHERE id_usuario = $id_user");
}

function getReputaciones($conex){
    $result=$conex->query("SELECT * FROM reputaciones ORDER BY minimo");
    $result= mysqli_fetch_all($result);
    return $result;
}

function agregarReputacion($conex,$nombre,$minimo){
  $sql = "INSERT INTO reputaciones (nombre,minimo) VALUES ('$nombre','$minimo')";
  $test = mysqli_query($conex, $sql);
  return $test;
}

function modificarReputacion($conex, $nombre, $minimo, $id){
  $consulta= "UPDATE reputaciones SET nombre= '$nombre', minimo= '$minimo' WHERE id_reputacion= $id";
  $test = mysqli_query($conex, $consulta);
  return $test;
}

function eliminarReputacion($conex, $id){
  $consulta= "DELETE FROM reputaciones WHERE id_reputacion='$id'";
  $test = mysqli_query($conex, $consulta);
  return $test;
}

function getReputacion($conex, $puntaje){
  $consulta= mysqli_query($conex, "SELECT nombre FROM reputaciones WHERE minimo <= $puntaje ORDER BY minimo DESC LIMIT 1");
  if ( mysqli_num_rows($consulta) != 0 ){
    $result= mysqli_fetch_all($consulta);
    }
  else{
      $consulta= mysqli_query($conex, "SELECT nombre FROM reputaciones ORDER BY minimo LIMIT 1");
      $result= mysqli_fetch_all($consulta);
    }
  return $result['0']['0'];
}

function getCategorias($conex){
    $result=$conex->query("SELECT * FROM categoria");
    $result= mysqli_fetch_all($result);
    return $result;
}

function agregarCategoria($conex,$nombre){
  $sql = "INSERT INTO categoria (nombre) VALUES ('$nombre')";
  $test = mysqli_query($conex, $sql);
  return $test;
}

function modificarCategoria($conex, $nombre, $id){
  $consulta= "UPDATE categoria SET nombre= '$nombre' WHERE id_categoria= $id";
  $test = mysqli_query($conex, $consulta);
  return $test;
}

function eliminarCategoria($conex, $id){
  $consulta= "DELETE FROM categoria WHERE id_categoria='$id'";
  $test = mysqli_query($conex, $consulta);
  return $test;
}

function getUsuarios($conex){
  $consulta = "SELECT * FROM users ORDER BY puntos DESC";
  $test = mysqli_query($conex, $consulta);
  $usuarios = mysqli_fetch_all($test);
  return $usuarios;
}




?>
