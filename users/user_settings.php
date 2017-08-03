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
<?php require_once 'init.php'; ?>
<?php require_once $abs_us_root.$us_url_root.'users/includes/header.php'; ?>
<?php require_once $abs_us_root.$us_url_root.'users/includes/navigation.php'; ?>

<?php
if (!securePage($_SERVER['PHP_SELF'])){die();}?>

<?php
$emailQ = $db->query("SELECT * FROM email");
$emailR = $emailQ->first();
// dump($emailR);
// dump($emailR->email_act);
//PHP Goes Here!
$errors=[];
$successes=[];
$userId = $user->data()->id;
$grav = get_gravatar(strtolower(trim($user->data()->email)));
$validation = new Validate();
$userdetails=$user->data();
//Temporary Success Message
$holdover = Input::get('success');
if($holdover == 'true'){
    bold("Account Updated");
}
//Forms posted
if(!empty($_POST)) {
    $token = $_POST['csrf'];
    if(!Token::check($token)){
        die('Token doesn\'t match!');
    }else {
        // update telefono
        if ($userdetails->telefono != $_POST['telefono']){
            $telefono = Input::get("telefono");
            $fields=array(
                'telefono'=>$telefono,
                'un_changed' => 1,
            );
            $validation->check($_POST,array(
                'telefono' => array(
                    'display' => 'telefono',
                    'required' => true,
                    'unique_update' => 'users,'.$userId,
                    'min' => 1,
                    'max' => 25
                )
            ));
            if($validation->passed()){
                if(($settings->change_un == 2) && ($user->data()->un_changed == 1)){
                    Redirect::to('user_settings.php?err=Username+has+already+been+changed+once.');
                }
                $db->update('users',$userId,$fields);
                $successes[]="Telefono actualizado.";
            }else{
                //validation did not pass
                foreach ($validation->errors() as $error) {
                    $errors[] = $error;
                }
            }
        }else{
            $telefono=$userdetails->telefono;
        }















        //Update display name
        if ($userdetails->username != $_POST['username']){
            $displayname = Input::get("username");
            $fields=array(
                'username'=>$displayname,
                'un_changed' => 1,
            );
            $validation->check($_POST,array(
                'username' => array(
                    'display' => 'Username',
                    'required' => true,
                    'unique_update' => 'users,'.$userId,
                    'min' => 1,
                    'max' => 25
                )
            ));
            if($validation->passed()){
                if(($settings->change_un == 2) && ($user->data()->un_changed == 1)){
                    Redirect::to('user_settings.php?err=Username+has+already+been+changed+once.');
                }
                $db->update('users',$userId,$fields);
                $successes[]="Username updated.";
            }else{
                //validation did not pass
                foreach ($validation->errors() as $error) {
                    $errors[] = $error;
                }
            }
        }else{
            $displayname=$userdetails->username;
        }
        //Update first name
        if ($userdetails->fname != $_POST['fname']){
            $fname = Input::get("fname");
            $fields=array('fname'=>$fname);
            $validation->check($_POST,array(
                'fname' => array(
                    'display' => 'First Name',
                    'required' => true,
                    'min' => 1,
                    'max' => 25
                )
            ));
            if($validation->passed()){
                $db->update('users',$userId,$fields);
                $successes[]='Nombre modificado.';
            }else{
                //validation did not pass
                foreach ($validation->errors() as $error) {
                    $errors[] = $error;
                }
            }
        }else{
            $fname=$userdetails->fname;
        }
        //Update last name
        if ($userdetails->lname != $_POST['lname']){
            $lname = Input::get("lname");
            $fields=array('lname'=>$lname);
            $validation->check($_POST,array(
                'lname' => array(
                    'display' => 'Last Name',
                    'required' => true,
                    'min' => 1,
                    'max' => 25
                )
            ));
            if($validation->passed()){
                $db->update('users',$userId,$fields);
                $successes[]='Apellido modificado.';
            }else{
                //validation did not pass
                foreach ($validation->errors() as $error) {
                    $errors[] = $error;
                }
            }
        }else{
            $lname=$userdetails->lname;
        }
        //Update email
        if ($userdetails->email != $_POST['email']){
            $email = Input::get("email");
            $fields=array('email'=>$email);
            $validation->check($_POST,array(
                'email' => array(
                    'display' => 'Email',
                    'required' => true,
                    'valid_email' => true,
                    'unique_update' => 'users,'.$userId,
                    'min' => 3,
                    'max' => 75
                )
            ));
            if($validation->passed()){
                $db->update('users',$userId,$fields);
                if($emailR->email_act==1){
                    $db->update('users',$userId,['email_verified'=>0]);
                }
                $successes[]='Email actualizado.';
            }else{
                //validation did not pass
                foreach ($validation->errors() as $error) {
                    $errors[] = $error;
                }
            }
        }else{
            $email=$userdetails->email;
        }
        if(!empty($_POST['password'])) {
            $validation->check($_POST,array(
                'old' => array(
                    'display' => 'La contraseña vieja',
                    'required' => true,
                ),
                'password' => array(
                    'display' => 'La contraseña nueva',
                    'required' => true,
                    'min' => $settings->min_pw,
                'max' => $settings->max_pw,
                ),
                'confirm' => array(
                    'display' => 'la confirmación',
                    'required' => true,
                    'matches' => 'password',
                ),
            ));
            foreach ($validation->errors() as $error) {
                $errors[] = $error;
            }
            if (!password_verify(Input::get('old'),$user->data()->password)) {
                foreach ($validation->errors() as $error) {
                    $errors[] = $error;
                }
                $errors[]='Hay un error con su contraseña.';
            }
            if (empty($errors)) {
                //process
                $new_password_hash = password_hash(Input::get('password'),PASSWORD_BCRYPT,array('cost' => 12));
                $user->update(array('password' => $new_password_hash,),$user->data()->id);
                $successes[]='Contraseña actualizada';
            }
        }
    }
}else{
    $displayname=$userdetails->username;
    $fname=$userdetails->fname;
    $lname=$userdetails->lname;
    $email=$userdetails->email;
    $telefono=$userdetails->telefono;
}
?>

<script type="text/javascript">
		$(document).ready(function () {
				$(".numberinput").forceNumeric();
		});

		// forceNumeric() plug-in implementation
		jQuery.fn.forceNumeric = function () {

				return this.each(function () {
						$(this).keydown(function (e) {
								var key = e.which || e.keyCode;

								if (!e.shiftKey && !e.altKey && !e.ctrlKey &&
								// numbers
										key >= 48 && key <= 57 ||
								// Numeric keypad
										key >= 96 && key <= 105 ||
								// comma, period and minus, . on keypad
									 key == 190 || key == 188 || key == 109 || key == 110 ||
								// Backspace and Tab and Enter
									 key == 8 || key == 9 || key == 13 ||
								// Home and End
									 key == 35 || key == 36 ||
								// left and right arrows
									 key == 37 || key == 39 ||
								// Del and Ins
									 key == 46 || key == 45)
										return true;

								return false;
						});
				});
		}
</script>

<div id="page-wrapper">
    <div class="container">
        <div class="">
            <div class="row">
                <!-- <div class="col-xs-12 col-md-2">
                    <p><img src="<?=$grav; ?>" class="img-thumbnail" alt="Generic placeholder thumbnail"></p>
                </div> -->
                <div class="col-xs-12 col-md-10">
                    <h1>Actualización de datos de usuario</h1>
                    <!-- <strong>Queres cambiar tu foto de perfil? </strong><br> Visite <a href="https://en.gravatar.com/">https://en.gravatar.com/</a> y configure una cuenta con el email <?=$email?>!<br> -->
                    <span class="bg-danger"><?=display_errors($errors);?></span>
                    <span><?=display_successes($successes);?></span>

                    <form name='updateAccount' action='user_settings.php' method='post'>

                        <div class="form-group">
                            <label>Nombre de usuario</label>
                            <?php if (($settings->change_un == 0) || (($settings->change_un == 2) && ($user->data()->un_changed == 1)) ) {
                                echo "<input  class='form-control' type='text' name='username' value='$displayname' readonly/>";
                            }else{
                                echo "<input  class='form-control' type='text' name='username' value='$displayname'>";
                            }
                            ?>
                        </div>

                        <div class="form-group">
                            <label>Nombre</label>
                            <input  class='form-control' type='text' name='fname' value='<?=$fname?>' />
                        </div>

                        <div class="form-group">
                            <label>Apellido</label>
                            <input  class='form-control' type='text' name='lname' value='<?=$lname?>' />
                        </div>

                        <div class="form-group">
                            <label>Email</label>
                            <input class='form-control' type='text' name='email' value='<?=$email?>' />
                        </div>

                        <div class="form-group">
                            <label>Teléfono</label>
                            <input class='numberinput form-control' type='text' name='telefono' value='<?=$telefono?>' />
                        </div>

                        <div class="form-group">
                            <label>Contraseña anterior</label>
                            <input class='form-control' type='password' name='old' />
                        </div>

                        <div class="form-group">
                            <label>Contraseña nueva (<?=$settings->min_pw?> char min, <?=$settings->max_pw?> max.)</label>
                            <input class='form-control' type='password' name='password' />
                        </div>

                        <div class="form-group">
                            <label>Confirmar contraseña</label>
                            <input class='form-control' type='password' name='confirm' />
                        </div>

                        <input type="hidden" name="csrf" value="<?=Token::generate();?>" />

                        <input class='btn btn-primary' type='submit' value='Actualizar' class='submit' />
                        <a class="btn btn-primary" href="account.php">Cancelar</a>

                    </form>
                    <?php
                    if(isset($user->data()->oauth_provider) && $user->data()->oauth_provider != null){
                        echo "<strong>NOTE:</strong> If you originally signed up with your Google/Facebook account, you will need to use the forgot password link to change your password...unless you're really good at guessing.";
                    }
                    ?>
                </div>
            </div>
        </div>


    </div> <!-- /container -->

</div> <!-- /#page-wrapper -->


<!-- footers -->
<?php require_once $abs_us_root.$us_url_root.'users/includes/page_footer.php'; // the final html footer copyright row + the external js calls ?>

<!-- Place any per-page javascript here -->

<?php require_once $abs_us_root.$us_url_root.'users/includes/html_footer.php'; // currently just the closing /body and /html ?>
