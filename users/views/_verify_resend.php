<?php
/*
UserSpice 4
An Open Source PHP User Management System
by the UserSpice Team at http://UserSpice.com

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/
 ?>
<div class="row">
<div class="col-xs-12">
<div class="jumbotron">
	<h2>Verificar tu email</h2>
	<ol>
		<li>Ingrese su dirección de email y presione reenviar</li>
		<li>Revise su email y presione el link</li>
		<li>Listo</li>
	</ol>
	<form class="" action="verify_resend.php" method="post">
	<span class="bg-danger"><?=display_errors($errors);?></span>
	<div class="form-group">
	<label for="email">Ingrese su email</label>
	<input class="form-control" type="text" id="email" name="email" placeholder="Email">
	</div>
	<input type="hidden" name="csrf" value="<?=Token::generate();?>">
	<input type="submit" value="Resend" class="btn btn-primary">
	</form>
</div>
</div>
</div>