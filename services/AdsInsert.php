<?php
/*
 * insertion d'une annonce 
 * script qui récupère tous les attributs de la requête HTTP, puis tente une insertion dans la table
 */


$Proprietes = parse_ini_file("snap_ads.properties");

$dbhost = $Proprietes ['serveur']; 
$dbport = $Proprietes['port'];
$dbuser = $Proprietes['user'];
$dbuserPass = $Proprietes['mdp'];
$dbname = $Proprietes['bd'];
$dbpass = '';

$category = filter_input(INPUT_POST, 'ad_category');
$photo = filter_input(INPUT_POST, 'id_photo');
$location = filter_input(INPUT_POST, 'location');
$user = filter_input(INPUT_POST, 'user');
$title = filter_input(INPUT_POST, 'adTitle');
$begin_date = filter_input(INPUT_POST, 'beginDate');
$end_date = filter_input(INPUT_POST, 'adEndDate');
$new_price = filter_input(INPUT_POST, 'adNewPrice');
$old_price = filter_input(INPUT_POST, 'adOldPrice');
$ad_long = filter_input(INPUT_POST, 'pos_long');
$ad_lat = filter_input(INPUT_POST, 'pos_lat');
$desc = filter_input(INPUT_POST, 'ad_description');
$photo_name = filter_input(INPUT_POST, 'ad_photo_name');
$photo_folder = filter_input(INPUT_POST, 'ad_photo_folder');
$state = filter_input(INPUT_POST, 'ad_state');
$activate = filter_input(INPUT_POST, 'ad_activation');

$array_posts = array('$title','$begin_date','$end_date','$new_price','$old_price','$ad_long','$ad_lat','$desc','$photo_name','$photo_folder','$state','$activate','$category','$location','$user');

$messsage="";

//var_dump($array_posts);

// Requête
$sql = "INSERT INTO ads (ad_title, ad_begin_date, ad_end_date,ad_actual_price,ad_old_price,ad_pos_longitude,ad_pos_latitude,ad_description,ad_photo_name,ad_photo_folder,ad_state,ad_activate,id_category,id_location,id_user)
VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";

try {
    //Instanciation d'un objet connexion
    $dbh = new PDO("mysql:host=$dbhost;port=$dbport;dbname=$dbname",$dbuser,$dbuserPass);
    // Gestion des erreurs en mode Exception
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $dbh->exec("SET NAMES 'UTF8'");
    $stmt = $dbh->prepare($sql);
    $stmt->execute($array_posts);
  
} catch (PDOException $ex) {
    $messsage = $ex->getMessage();
 }
echo $messsage;
?>






