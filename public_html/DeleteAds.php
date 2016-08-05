<?php

$Proprietes = parse_ini_file("snap_ads.properties");

$dbhost = $Proprietes ['serveur'];
$dbport = $Proprietes['port'];
$dbuser = $Proprietes['user'];
$dbuserPass = $Proprietes['mdp'];
$dbname = $Proprietes['bd'];
$dbpass = '';


$code=$_GET['code'];

//$req = "SELECT * FROM ads";
$req = "DELETE FROM ads WHERE id_ad=?";
$pdo = new PDO("mysql:host=$dbhost;port=$dbport;dbname=$dbname", $dbuser, $dbuserPass);
$params = array($code);
$ps = $pdo->prepare($req);
$ps->execute($params);
$ad=$ps->fetch();

header("location:annonces.php");


?>