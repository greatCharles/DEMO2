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
  $consulta = "SELECT SQL_CALC_FOUND_ROWS * FROM gauchada ORDER BY id_gauchada DESC LIMIT $inicio, $post_por_pagina";
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

function setCreditos($conex, $id){
  $creditos= getCreditos($conex, $id) - 1;
  $conex->query("UPDATE users SET creditos= $creditos WHERE id= $id");
  return $creditos;
}

function getMisGauchadas($conex, $id){
  $consulta = "SELECT * FROM gauchada WHERE id_usuario= $id";
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

?>
