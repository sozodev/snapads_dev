<?php
// Paramètres de connexion
require_once('config.php');

// requête
$sql = "SELECT * FROM ads";

//connexion
$lcn = null;
try {

//Instanciation d'un objet de connexion
$lcn = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);

// Gestion des erreurs en mode Exception
	$lcn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 $lcn->exec("SET NAMES 'UTF8'");

//preparation de la requete / créaion objet statement
	$sth=$lcn->prepare($sql);
//éxécution de la requete
	$sth->execute();

//print($sth);

//print("Récupération de toutes les lignes d'un jeu de résultats :\n");

// Recupération de toutes les lignes du tableau d'objets
$result=$sth->fetchAll();
//Affichage du tableau
//print_r($result);

/*	$stmt = $lcn->query($sql);
// Fonction qui retourne tableau contenant toutes les lignes de jeu d'enregistrement
	$ads = $stmt->fetchAll(PDO::FETCH_OBJ);
//parcours des résultats
print_r($ads);
*/
	$sth->closeCursor();
//deconnexion
	$lcn = null;
	echo '{"items":'. json_encode($result) .'}';

}
//En cas d'echec on lève une exeception
catch(PDOException $e) {
	echo '{"error":{"text":'. $e->getMessage() .'}}';
}


?>
