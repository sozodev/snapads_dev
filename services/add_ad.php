<?php

require_once('config.php');
//récupération des valeurs des champs:
$category = $_POST['ad_category'];
$photo = $_POST['id_photo'];
$location = $_POST['location'];
$user = $_POST['user'];
$title = $_POST['adTitle'];
$begin_date = $_POST['beginDate'];
$end_date = $_POST['adEndDate'];
$new_price = $_POST['adNewPrice'];
$old_price = $_POST['adOldPrice'];
$ad_long = $_POST['pos_long'];
$ad_lat = $_POST['pos_lat'];
$desc = $_POST['ad_description'];
$state = $_POST['ad_state'];
$activate = $_POST['ad_activation'];

$sql = "INSERT INTO ads (id_category, id_photo, id_location,id_user,ad_title,ad_begin_date,ad_end_date,ad_actual_price,ad_old_price,ad_pos_longitude,ad_pos_latitude,ad_description,ad_state,ad_activate)
		VALUES ( '$category', '$photo', '$location','$user','$title','$begin_date','$new_price','$new_price','$old_price','$ad_long','$ad_lat','$desc','$state','$activate' ) ";
//deconnexion
$lcn = null;
try {
//Connexion
$lcn = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);
//Modification des attributs de la connexion.
$lcn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$sth = $lcn->prepare($sql);


/* TO DO
  //Lier les paramètres avec la méthode BindParam
  exemple :

  $sth->bindParam(1, $_POST["tbCP"], PDO::PARAM_STR);
 */


$sth->execute();
$result = $sth->fetchAll();

//si les champs sont correctemnt remplis
if ($title!=""){

//insertion dans la base de données
if($sql){

echo("L'insertion a été correctement effectuée");
}

//echec d'insertion dans la base de donnés
else{
echo("L'insertion à échouée");

}

}
else
//mauvais remplissage des champs
{
echo 'L\'annonce n\'as pu être ajoutée !'. '<br>';
}


//redirection
//header('location: read_ads.php');
?>