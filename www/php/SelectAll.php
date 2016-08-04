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


$sql = "SELECT * FROM locations";

try {
    //Instanciation d'un objet connexion
    $dbh = new PDO("mysql:host=$dbhost;port=$dbport;dbname=$dbname", $dbuser, $dbuserPass);
    // Gestion des erreurs en mode Exception
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $dbh->exec("SET NAMES 'UTF8'");
    //print_r($sql);
    $stmt = $dbh->prepare($sql);
    $stmt->execute();

    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $lcn = null;
    $lsResultas = json_encode($data);
   
   // print_r($lsResultas);

    // echo $data;
} catch (PDOException $ex) {
    echo'Il y a un problème';
    $messsage = $ex->getMessage();
}

print_r ("Le resultat de SelectAll:".$lsResultas);



