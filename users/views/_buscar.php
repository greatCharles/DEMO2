<form action= "<?=$form_action;?>" method="post" name="" enctype="multipart/form-data" class="form_signup" >

    <h2 class="form-signin-heading">Búsqueda</h2>

    <div class="form-group col-xs-6">

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


        <input type="submit" class= "btn btn-primary" value="Buscar">
    </div>

      <?php   if ($resultado):?>
        <div class="container-fluid">
    					<div class="col-md-12">
    								<?php foreach($resultado as $gauchada): ?>
    									<div class="col-md-4">
    										<div class="thumbnail">
    											<a href="single_view.php?id=<?php echo $gauchada['0']?>">
    											</a>
    											<div class="caption">
    													<h3>
    															<a href="single_view.php?id=<?php echo $gauchada['0']?>"><?php echo $gauchada['1']?></a>
    													</h3>
    													<p><?php echo substr($gauchada['2'],0, 200).'...'?></p>
    													<a href="single_view.php?id=<?php echo $gauchada['0']?>">Ver más...</a><br><br>
    										  </div>
    										</div>
    									</div>
    								<?php endforeach; ?>
    					</div>
    		</div>
    <?php else: ?>
    <?php   echo 'No se encontraron gauchadas.'; ?>
  <?php endif; ?>


</form>
