<?php

//Données pour la connexion à la base de données
include('config.php');

$sql = "SELECT * FROM users";


try {
	$dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);
	// set the PDO error mode to exception
	$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$stmt = $dbh->prepare($sql);

print_r($stmt);

	$stmt->bindParam("id", $_GET[id]);
	$stmt->execute();

	//retourne un objet anonyme avec les noms de propriétés qui correspondent aux noms des colonnes retournés dans le jeu de résultats
	$ads = $stmt->fetchAll(PDO::FETCH_OBJ);

	$dbh = null;
	echo '{"items":'. json_encode($ads) .'}';
} catch(PDOException $e) {
	echo '{"error":{"text":'. $e->getMessage() .'}}';
}

//récupération des valeurs des champs:
$category = $_POST['ad_category'];
$photo = $_POST['id_photo'];
$location = $_POST['location'];
$user = $_POST['user'];
$title = $_POST['adTitle'];
$begin_date = $_POST['beginDate'];
$end_date = $_POST['adEndDate'];
$new_price= $_POST['adNewPrice'];
$old_price= $_POST['adOldPrice'];
$ad_long = $_POST['pos_long'];
$ad_lat = $_POST['pos_lat'];
$desc = $_POST['ad_description'];
$state = $_POST['ad_state'];
$activate = $_POST['ad_activation'];


if ($title!=""){


}
else
{

}


// Redirection du visiteur vers la page du minichat
//header('Location: minichat.php');
?>
