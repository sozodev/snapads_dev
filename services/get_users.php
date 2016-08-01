<?php
// Paramètres de connexion
require_once('config.php');

$sql = "SELECT * FROM users";
$lcn = null;
try {

	$lcn = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);
	$lcn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$sth=$lcn->prepare($sql);
	$sth->execute();
$result=$sth->fetchAll();
//print_r($result);
	echo '{"items":'. json_encode($result) .'}';

}
//En cas d'echec on lève une exeception
catch(PDOException $e) {
	echo '{"error":{"text":'. $e->getMessage() .'}}';
}


?>
