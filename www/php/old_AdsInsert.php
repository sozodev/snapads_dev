<?php 

//$Proprietes = parse_ini_file("snap_ads.properties");
//
//$dbhost = $Proprietes ['serveur'];
//$dbport = $Proprietes['port'];
//$dbuser = $Proprietes['user'];
//$dbuserPass = $Proprietes['mdp'];
//$dbname = $Proprietes['bd'];
//$dbpass = '';
//
//
//$sql = "SELECT * FROM ads";
//
//try {
//    //Instanciation d'un objet connexion
//    $dbh = new PDO("mysql:host=$dbhost;port=$dbport;dbname=$dbname", $dbuser, $dbuserPass);
//    // Gestion des erreurs en mode Exception
//    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
//    $dbh->exec("SET NAMES 'UTF8'");
//    $stmt = $dbh->prepare($sql);
//    $stmt->execute();
//
//    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
//    $lcn = null;
//    $lsResultas = json_encode($data);
//
//    // print_r($lsResultas);
//    // echo $data;
//} catch (PDOException $ex) {
//    $messsage = $ex->getMessage();
//}
//
//print_r($lsResultas);
?>

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


$sql = "SELECT * FROM ads";

try {
    //Instanciation d'un objet connexion
    $pdo = new PDO("mysql:host=$dbhost;port=$dbport;dbname=$dbname", $dbuser, $dbuserPass);
    // Gestion des erreurs en mode Exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->exec("SET NAMES 'UTF8'");
    $stmt = $pdo->prepare($sql);
    $stmt->execute();

    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $lcn = null;
    $lsResultas = json_encode($data);

    // print_r($lsResultas);
    // echo $data;
} catch (PDOException $ex) {
    $messsage = $ex->getMessage();
}

print_r($lsResultas);
?>



    
    
   