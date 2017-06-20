<form action= "<?=$form_action;?>" method="post" name="" enctype="multipart/form-data" class="form_signup" >

    <h2 class="form-signin-heading">Búsqueda</h2>

    <div class="form-group">

        <input type="checkbox" name="c1" onclick="showMe('div4')">Por Título<br>
        <div id="div4" style="display: none"
        <label for= titulo>Por título</label>
        <input class="form-control" type="text" placeholder="Título a buscar" name="titulo" id="titulo" required="true"><br>
        </div>
        <br>
        <input type="checkbox" name="c1" onclick="showMe('div1')">Por ubicación<br>
        <div id="div1" style="display: none"
        <label for="ubicacion">Ubicación</label><br>
        <label>Localidad - Provincia</label>
            <select name="ubicacion">
               <?php while($fila= mysqli_fetch_array($result_locali)):;?>
                   <option value="<?php echo $fila[0]; echo ' - ' ;echo $fila[1]?>">
                        <?php echo $fila[0]; echo ' - ' ;echo $fila[1]?></option>
               <?php endwhile; ?>
            </select>
            </div>
      <br>

        <input type="checkbox" name="c1" onclick="showMe('div2')">Por categoria<br>
        <div id="div2" style="display: none"
        <label for= "categoria">Seleccione una categoría</label><br>
        <select name="categoria" id="categoria">
            <?php while($fila= mysqli_fetch_array($result)):;?>
            <option value="<?php echo $fila[0];?>"><?php echo $fila[0];?></option>
            <?php endwhile; ?>
        </select>
        </div>
        <br>

        <input type="checkbox" name="c1" onclick="showMe('div3')">Por una fecha específica<br>
        <div id="div3" style="display: none">
                <br>
                <label for= "fecha_exacta">Fecha: </label>
                <input type="date" name="fecha_exacta" class="">
                <br>
        </div>
        <br>




        <input type="submit" class= "btn btn-primary" value="Buscar">
    </div>

</form>
