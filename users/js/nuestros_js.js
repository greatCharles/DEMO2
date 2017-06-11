function confirmar(id_gau) {
  swal({   title: "Estás seguro?",   text: "No vas a poder recuperar esta Gauchada!",   type: "warning",   showCancelButton: true,   confirmButtonColor: "#DD6B55",   confirmButtonText: "Si, quiero borrarla!",   closeOnConfirm: false }, function(){ window.location = 'baja_publicacion.php?id_gau=' + id_gau   });
}

function enviar_comentario() {
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
      swal("Perfecto!", "You wrote: " + inputValue, "success");
    });
}
