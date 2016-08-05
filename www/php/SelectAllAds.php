<?php

//echo 'PHP OK !!';
/*
 * Sélection de annonces disponible dans la base de données au format Json
 * 
 */


$Proprietes = parse_ini_file("snap_ads.properties");

$dbhost = $Proprietes ['serveur'];
$dbport = $Proprietes['port'];
$dbuser = $Proprietes['user'];
$dbuserPass = $Proprietes['mdp'];
$dbname = $Proprietes['bd'];
$dbpass = '';

//echo 'On est ICI';


$sql = "SELECT * FROM ads";

try {
    //Instanciation d'un objet connexion
    $pdo = new PDO("mysql:host=$dbhost;port=$dbport;dbname=$dbname", $dbuser, $dbuserPass);
    // Gestion des erreurs en mode Exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->exec("SET NAMES 'UTF8'");

    $stmt = $pdo->prepare($sql);
    $stmt->execute();

    $datas = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $lcn = null;
    $lsResultas = json_encode($datas);
   
   // print_r($lsResultas);

    // echo $data;
} catch (PDOException $ex) {
    echo'Il y a un problème';
    $messsage = $ex->getMessage();
}

print_r ("Le resultat de SelectAll:".$lsResultas);



