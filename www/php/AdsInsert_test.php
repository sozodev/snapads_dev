<?php
 

$Proprietes = parse_ini_file("snap_ads.properties");

$dbhost = $Proprietes ['serveur'];
$dbport = $Proprietes['port'];
$dbuser = $Proprietes['user'];
$dbuserPass = $Proprietes['mdp'];
$dbname = $Proprietes['bd'];
$dbpass = '';


$Category = filter_input(INPUT_POST, 'AdCategory');
$Location = filter_input(INPUT_POST, 'Location');
$User = filter_input(INPUT_POST, 'User');
$AdTitle = filter_input(INPUT_POST, 'AdTitle');
$AdBeginDate = filter_input(INPUT_POST, 'AdBeginDate');
$AdEndDate = filter_input(INPUT_POST, 'AdEndDate');
$NewPrice = filter_input(INPUT_POST, 'NewPrice');
$OldPrice = filter_input(INPUT_POST, 'OldPrice');
$Adlong = filter_input(INPUT_POST, 'AdLong');
$AdLat = filter_input(INPUT_POST, 'AdLat');
$AdDesc = filter_input(INPUT_POST, 'AdDesc');
$AdPhotoName = filter_input(INPUT_POST, 'AdPhotoName');
$AdPhotoFolder = filter_input(INPUT_POST, 'AdPhotoFolder');
$AdActivation = filter_input(INPUT_POST, 'AdActivation');
$AdState = filter_input(INPUT_POST, 'AdState');

$FormInputs = array($AdTitle+$AdBeginDate+$AdEndDate+$NewPrice+$OldPrice+$Adlong+$AdLat+$AdDesc+$AdPhotoName+$AdPhotoFolder+$AdState+$Category+$Location+$User);

$sql ="INSERT INTO ads (ad_title, ad_begin_date, ad_end_date,ad_actual_price,ad_old_price,ad_pos_longitude,ad_pos_latitude, ad_description,ad_photo_name, ad_photo_folder, ad_state, ad_activate, id_category, id_location, id_user)
VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)" ;

//var_dump($sql);
//echo '<br>';
//var_dump($FormInputs);

print_r($FormInputs);
try {
    //Instanciation d'un objet connexion
    $dbh = new PDO("mysql:host=$dbhost;port=$dbport;dbname=$dbname", $dbuser, $dbuserPass);
    // Gestion des erreurs en mode Exception
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $dbh->exec("SET NAMES 'UTF8'");
    $stmt = $dbh->prepare($sql);
    $stmt->execute($FormInputs);
    $messsage = $stmt->rowCount()." annonce ajoutée";

} catch (PDOException $ex) {
    $messsage = $ex->getMessage();
}

print_r($messsage);

?>


