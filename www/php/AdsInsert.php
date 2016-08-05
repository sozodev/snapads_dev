<?php

//var_dump($_POST);

$Proprietes = parse_ini_file("snap_ads.properties");

$dbhost = $Proprietes ['serveur'];
$dbport = $Proprietes['port'];
$dbuser = $Proprietes['user'];
$dbuserPass = $Proprietes['mdp'];
$dbname = $Proprietes['bd'];
$dbpass = '';


$category = filter_input(INPUT_POST, "adcategory");
$location = filter_input(INPUT_POST, 'location');
$user = filter_input(INPUT_POST, 'user');
$adtitle = filter_input(INPUT_POST, 'adtitle');
$adbegindate = filter_input(INPUT_POST, 'adbegindate');
$adenddate = filter_input(INPUT_POST, 'adenddate');
$newprice = filter_input(INPUT_POST, 'newprice');
$oldprice = filter_input(INPUT_POST, 'oldprice');
$adlong = filter_input(INPUT_POST, 'adlong');
$adlat = filter_input(INPUT_POST, 'adlat');
$addesc = filter_input(INPUT_POST, 'addesc');
$adphotoname = filter_input(INPUT_POST, 'adphotoname');
$adphotofolder = filter_input(INPUT_POST, 'adphotofolder');
$adactivation = filter_input(INPUT_POST, 'adactivation');
$adstate = filter_input(INPUT_POST, 'adstate');

$nomphoto=$_FILES ['photofile'];

print_r($nomphoto);

//$inputs = array($adtitle+ $adbegindate + $adenddate + $newprice + $oldprice + $adlong + $adlat + $addesc + $adphotoname + $adphotofolder + $adstate + $adactivation + $category + $location + $user);


//echo $adtitle . '<br>';
//echo $adbegindate . '<br>';
//echo $adenddate . '<br>';
//echo $newprice . '<br>';
//echo $oldprice . '<br>';
//echo $adlong . '<br>';
//echo $adlat . '<br>';
//echo $addesc . '<br>';
//echo $adphotoname . '<br>';
//echo $adphotofolder . '<br>';
//echo $adstate . '<br>';
//echo $adactivation . '<br>';
//echo $category . '<br>';
//echo $location . '<br>';
//echo $user . '<br>';

$sql= "INSERT INTO ads (ad_title, ad_begin_date, ad_end_date, ad_actual_price, ad_old_price, ad_pos_longitude, ad_pos_latitude, ad_description, ad_photo_name, ad_photo_folder, ad_state, ad_activate, id_category, id_location, id_user)
VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";


try {
    
    
    //Instanciation d'un objet connexion
    $dbh = new PDO("mysql:host=$dbhost;port=$dbport;dbname=$dbname", $dbuser, $dbuserPass);
    

    // Gestion des erreurs en mode Exception
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    //$dbh->exec("SET NAMES 'UTF8'");
    $stmt = $dbh->prepare($sql);   
    $stmt->execute(array($adtitle, $adbegindate, $adenddate, $newprice, $oldprice, $adlong, $adlat, $addesc,$adphotoname, $adphotofolder, $adstate,$adactivation, $category, $location,$user   ));

    $messsage = $stmt->rowCount() . " annonce ajoutée";
} catch (PDOException $ex) {
    $messsage = $ex->getMessage();
}

print_r($messsage);
?>


