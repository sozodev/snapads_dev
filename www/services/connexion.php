<?php

session_start();

if( isset($_POST['username']) && isset($_POST['password']) )
{
if($_POST['username'] == $username && $_POST['password'] == $password){
	echo "OK";

}

else{
	echo "KO";
}





    }

    ?>
