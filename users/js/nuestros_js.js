function confirmarBajaGauchada(id_gau) {
  swal({   title: "Estás seguro?",   text: "En caso de que la publicación posea postulantes se perderá el credito gastado!",   type: "warning",   showCancelButton: true,   confirmButtonColor: "#DD6B55",   confirmButtonText: "Si, quiero borrarla!",   closeOnConfirm: false }, function(){ window.location = 'baja_publicacion.php?id_gau=' + id_gau   });
}

function confirmarBajaPostulacion(id_postu) {
  swal({ title: "Estás seguro?", text: "Podrás volver a postularte luego si quieres!", type: "warning", showCancelButton: true, confirmButtonColor:"#DD6B55", confirmButtonText: "Si, estoy seguro!",   closeOnConfirm: false }, function(){ window.location = 'baja_postulacion.php?id_postu=' + id_postu });
}

function confirmarPostulanteElegido(id_postu) {
  swal({   title: "Estás seguro de elegirlo?",   text: "Se desestimarán las demás postulaciones",   type: "warning",   showCancelButton: true,   confirmButtonColor: "#DD6B55",   confirmButtonText: "Si, quiero elegirlo!",   closeOnConfirm: false }, function(){ window.location = 'postulante_elegido.php?id_postu=' + id_postu   });
}


function enviar_comentario(id_gau, id_user) {
  swal({
  title: "Comentario",
  text: "Escribí tu comentario",
  type: "input",
  showCancelButton: true,
  closeOnConfirm: false,
  animation: "slide-from-top",
  inputPlaceholder: "Ej: ¿De donde sós?"
  },
    function(inputValue){
      if (inputValue === false) return false;

      if (inputValue === "") {
        swal.showInputError("No te olvides de escribir algo!");
        return false
      }
      window.location = 'comentario_enviado.php?comentario=' + inputValue + '&id_gauchada=' + id_gau + '&id_user=' + id_user;
      // swal("Perfecto!", "You wrote: " + inputValue, "success");
    });
}

function enviar_respuesta(id_coment, id_gau) {
  swal({
  title: "Respuesta",
  text: "Escribí tu respuesta",
  type: "input",
  showCancelButton: true,
  closeOnConfirm: false,
  animation: "slide-from-top",
  inputPlaceholder: "Ej: ¿No, no me sirve. Saludos."
  },
    function(inputValue){
      if (inputValue === false) return false;

      if (inputValue === "") {
        swal.showInputError("No te olvides de escribir algo!");
        return false
      }
      window.location = 'respuesta_enviada.php?respuesta=' + inputValue + '&id_coment=' + id_coment + '&id_gau=' + id_gau;
      // swal("Perfecto!", "You wrote: " + inputValue, "success");
    });
}
