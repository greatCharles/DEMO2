<form action= "<?=$form_action;?>" method="post" name="" enctype="multipart/form-data" class="form_signup" >

    <h2 class="form-signin-heading">Modificar gauchada</h2>

    <div class="form-group">

        <label for= titulo>Título</label>
        <input class="form-control" type="text" placeholder="Título" name="titulo" id="titulo" required="true" value="<?php echo $gaucha['0']['1']; ?> "><br>

        <label for="descripcion">Descripción</label>
        <textarea class="form-control" style="height: 200px" type="text" placeholder="Escribe una descripción de la gauchada que necesites." name="descripcion" id="descripcion" required="true" > <?php echo $gaucha['0']['2'];?> </textarea><br>

        <label for="ubicacion">Ubicación</label><br>
        <label>Localidad - Provincia</label>
            <select name="ubicacion">
               <option value="<?php echo $gaucha['0']['8']; echo ' - '; echo $gaucha['0']['7'];?> ">
                      <?php echo $gaucha['0']['8']; echo ' - '; echo $gaucha['0']['7'];?></option>
               <?php while($fila= mysqli_fetch_array($result_locali)):;?>
                   <option value="<?php echo $fila[0]; echo ' - ' ;echo $fila[1]?>">
                        <?php echo $fila[0]; echo ' - ' ;echo $fila[1]?></option>
               <?php endwhile; ?>
            </select>
        </form><br><br>

        <label for= "categoria">Categoría</label><br>
        <select name="categoria" id="categoria">
            <option value="<?php echo $gaucha['0']['9'];?> "><?php echo $gaucha['0']['9'];?></option>
            <?php while($fila= mysqli_fetch_array($result)):;?>
              <option value="<?php echo $fila[0];?>"><?php echo $fila[0];?></option>
            <?php endwhile; ?>
        </select>

        <br><br>

        <label for="foto">Foto (opcional)</label>
        <input type="file" name="foto" id=""> <br>

        <?php if ($gaucha['0']['5'] != '0000-00-00'): ?>
            <p>La gauchada está programada para: <?php echo $gaucha['0']['5'] ?></p>
          <?php endif; ?>

        <input type="checkbox" name="c1" onclick="showMe('div1')">Deseo modificar la fecha para su realización<br>
        <div id="div1" style="display: none">
                <br>
                <label for= "fecha_exacta">Fecha: </label>
                <input type="date" name="fecha_exacta" class="">
                <br>
        </div>
        <br>

        <input type="submit" class= "btn btn-primary" value="Enviar">
        <a href= 'account.php' class="btn btn-primary">Cancelar</a>
    </div>

</form>
