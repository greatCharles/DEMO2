<form action= "<?=$form_action;?>" method="post" name="" enctype="multipart/form-data" class="form_signup" >

    <h2 class="form-signin-heading">Búsqueda</h2>

    <div class="form-group col-xs-6">

        <div>
        <label for= titulo>Por título</label>
        <input class="form-control" type="text" placeholder="Título a buscar" name="titulo" id="titulo" style="width: 70%"><br>
        </div>

        <div>
        <label for="ubicacion">Por Ubicación</label><br>
        <label>Localidad - Provincia</label>
            <select name="ubicacion">
              <option value=""></option>
               <?php while($fila= mysqli_fetch_array($result_locali)):;?>
                   <option value="<?php echo $fila[0]; echo ' - ' ;echo $fila[1]?>">
                        <?php echo $fila[0]; echo ' - ' ;echo $fila[1]?></option>
               <?php endwhile; ?>
            </select>
            </div>
      <br>

        <div>
        <label for= "categoria">Por categoría</label><br>
        <label>Seleccione una categoría</label>
        <select name="categoria" id="categoria">
            <option value=""></option>
            <?php while($fila= mysqli_fetch_array($result)):;?>
            <option value="<?php echo $fila[0];?>"><?php echo $fila[0];?></option>
            <?php endwhile; ?>
        </select>
        </div>
        <br>


        <input type="submit" class= "btn btn-primary" value="Buscar"><hr>
    </div>

      <?php   if ($resultado):?>
        <div class="container-fluid">
    					<div class="col-md-12">
    								<?php foreach($resultado as $gauchada): ?>
                      <?php $cant_gau++; ?>
    									<div class="col-md-4">
    										<div class="thumbnail">
    											<a href="single_view.php?id=<?php echo $gauchada['0']?>"></a>
                          <?php if($gauchada['10']): ?>
  													<img class="img-responsive" src="<?php echo 'img_gauchadas/'.$gauchada['10']; ?>">
  												<?php else: ?>
  													<img class="img-responsive" src="img_gauchadas/sin_imagen.jpg">
  												<?php endif; ?>
    											<div class="caption">
    													<h3>
    															<a href="single_view.php?id=<?php echo $gauchada['0']?>"><?php echo $gauchada['1']?></a>
    													</h3>
    													<p><?php echo substr($gauchada['2'],0, 200).'...'?></p>
    													<a href="single_view.php?id=<?php echo $gauchada['0']?>">Ver más...</a><br><br>
    										  </div>
    										</div>
    									</div>
                      <?php if($cant_gau==3):?>
                        <div class="col-md-12"></div>
                      <?php endif; ?>
    								<?php endforeach; ?>
    					</div>
    		</div>
    <?php else: ?>
        <script type="text/javascript">
          alert("No se encontraron gauchadas");
        </script>

  <?php endif; ?>


</form>
