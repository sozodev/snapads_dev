<?php
//Données pour la connexion à la base de données
include('db_config.php');
include('constant.php');

mysql_connect("$nom_du_serveur","$nom_utilisateur","$passe");
mysql_select_db("$nom_de_la_base") OR die( "ERREUR de connexion : " . mysql_error () );

$sql_annonces = "SELECT * FROM users";
$requete= mysql_query($sql_annonces);
$result = mysql_fetch_object( $requete );

//récupération des valeurs des champs:


//$user_location = filter_input(INPUT_POST,"user_location");

$user_location = $_POST['user_location'];
$user_company=$_POST['user_company'];
$user_firstName=$_POST['userFirstName'];
$user_lastName=$_POST['userLastName'];
$user_nickname=$_POST['userNickname'];
$user_type=$_POST['userType'];
$user_company_name=$_POST['company_name'];
$user_company_siret=$_POST['siret_number'];
$user_login=$_POST['userLogin'];
$user_mail=$_POST['userMail'];
$user_password=$_POST['userPass'];
$user_password_confirm=$_POST['password_confirm'];
$user_telephone=$_POST['tel_user'];
$user_adress=$_POST['address_name'];
$user_zipCode=$_POST['zipCode'];
$user_city=$_POST['city'];
$user_last_pass = $_POST['user_last_pass_gen'];
$user_active = $_POST['user_active'];
$user_deleted=$_POST['user_deleted'];



if(!$user_firstName=""){

  $sql_users_insert = "INSERT INTO users (id_location, id_company, user_firstname,user_lastname,user_nickname,user_login,user_password,user_email,user_telephone,user_last_pass_gen,user_active,user_deleted,user_type)
  		VALUES ( '$user_location', '$user_company', '$user_firstName','$user_lastName','$user_nickname','$user_login','$user_password','$user_mail','$user_telephone',$user_last_pass,'$user_active','$user_deleted','$user_type') ";

$dbc = mysql_connect("$nom_du_serveur","$nom_utilisateur","$passe");
$requete= mysql_query($sql_users_insert,$dbc);

//print_r($sql_users_insert);
if($requete) {
		echo("L'insertion a été correctement effectuée") ;
}
else
{
  echo("L'insertion à échouée") ;
  		//$sql_article = "SELECT * FROM ARTICLES ORDER BY name";
  		//$requete= mysql_query($sql_article,$dbc);
}

}
else {
	echo 'L\'utilisateur n\'as pu être ajoutée !'. '<br>';
}










//récupération des valeurs des champs:


?>
