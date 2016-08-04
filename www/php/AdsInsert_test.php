<?php

//var_dump($_POST);

$Proprietes = parse_ini_file("snap_ads.properties");

$dbhost = $Proprietes ['serveur'];
$dbport = $Proprietes['port'];
$dbuser = $Proprietes['user'];
$dbuserPass = $Proprietes['mdp'];
$dbname = $Proprietes['bd'];
$dbpass = '';




$idad = filter_input(INPUT_POST, "IdAd");
$category = filter_input(INPUT_POST, "AdCategory");
$location = filter_input(INPUT_POST, 'Location');
$user = filter_input(INPUT_POST, 'User');
$adtitle = filter_input(INPUT_POST, 'AdTitle');
$adbegindate = filter_input(INPUT_POST, 'AdBeginDate');
$adenddate = filter_input(INPUT_POST, 'AdEndDate');
$newprice = filter_input(INPUT_POST, 'NewPrice');
$oldprice = filter_input(INPUT_POST, 'OldPrice');
$adlong = filter_input(INPUT_POST, 'AdLong');
$adlat = filter_input(INPUT_POST, 'AdLat');
$addesc = filter_input(INPUT_POST, 'AdDesc');
$adphotoname = filter_input(INPUT_POST, 'AdPhotoName');
$adphotofolder = filter_input(INPUT_POST, 'AdPhotoFolder');
$adactivation = filter_input(INPUT_POST, 'AdActivation');
$adstate = filter_input(INPUT_POST, 'AdState');




$inputform = array('$adtitle' + '$adbegindate' + '$adenddate' + '$newprice' + '$oldprice' + '$adlong' + '$adlat' + '$addesc' + '$adphotoname' + '$adphotofolder' + '$adstate' + '$adactivation' + '$category' + '$location' + '$user');



//var_dump($inputform) ;
//$category = $_POST["AdCategory"];
//$Location = $_POST['Location'];
//$User = $_POST['User'];
//$AdTitle = $_POST['AdTitle'];
//$AdBeginDate = $_POST['AdBeginDate'];
//$AdEndDate = $_POST['AdEndDate'];
//$NewPrice = $_POST['NewPrice'];
//$OldPrice = $_POST['OldPrice'];
//$Adlong = $_POST['AdLong'];
//$AdLat = $_POST['AdLat'];
//$AdDesc = $_POST['AdDesc'];
//$AdPhotoName = $_POST['AdPhotoName'];
//$AdPhotoFolder = $_POST['AdPhotoFolder'];
//$AdActivation = $_POST['AdActivation'];
//$AdState = $_POST['AdState'];
//$FormInputs = array($AdTitle+$AdBeginDate+$AdEndDate+$NewPrice+$OldPrice+$Adlong+$AdLat+$AdDesc+$AdPhotoName+$AdPhotoFolder+$AdState+$AdActivation+$Category+$Location+$User);
//
//
//$sql = "INSERT INTO ads (id_ad, ad_title, ad_begin_date, ad_end_date,ad_actual_price,ad_old_price,ad_pos_longitude,ad_pos_latitude, ad_description,ad_photo_name, ad_photo_folder, ad_state, ad_activate, id_category, id_location, id_user)
//
//
//
//
//
//VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
//try {
//    //Instanciation d'un objet connexion
//    $dbh = new PDO("mysql:host=$dbhost;port=$dbport;dbname=$dbname", $dbuser, $dbuserPass);
//    // Gestion des erreurs en mode Exception
//    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
//    $dbh->exec("SET NAMES 'UTF8'");
//    $stmt = $dbh->prepare($sql);
//    $stmt->execute($FormInputs);
//
//    $messsage = $stmt->rowCount() . " annonce ajoutée";
//} catch (PDOException $ex) {
//    $messsage = $ex->getMessage();
//}

//
//

echo $idad. '<br>';
echo $category . '<br>';
echo $location . '<br>';
echo $user . '<br>';
echo $adtitle . '<br>';
echo $adbegindate . '<br>';
echo $adenddate . '<br>';
echo $newprice . '<br>';
echo $oldprice . '<br>';
echo $adlong . '<br>';
echo $adlat . '<br>';
echo $addesc . '<br>';
echo $adphotofolder . '<br>';
echo $adactivation . '<br>';
echo $adstate . '<br>';



$sql2 = "INSERT INTO `karrington`.`ads` (`ad_title`, `ad_begin_date`, `ad_end_date`, `ad_actual_price`, `ad_old_price`, `ad_pos_longitude`, `ad_pos_latitude`, `ad_description`, `ad_photo_name`, `ad_photo_folder`, `ad_state`, `ad_activate`, `id_category`, `id_location`, `id_user`)
VALUES ('?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?')";

$sql2 = "INSERT INTO ads (ad_title, ad_begin_date, ad_end_date, ad_actual_price, ad_old_price, ad_pos_longitude, ad_pos_latitude, ad_description, ad_photo_name, ad_photo_folder, ad_state, ad_activate, id_category, id_location, id_user)
VALUES (title,title,begindate,enddate,actualprice,oldprice,long,lat,desc,photofolder,status,activation,category,location,user)";


try {
    
    
    //Instanciation d'un objet connexion
    $dbh = new PDO("mysql:host=$dbhost;port=$dbport;dbname=$dbname", $dbuser, $dbuserPass);
    

    // Gestion des erreurs en mode Exception
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    //$dbh->exec("SET NAMES 'UTF8'");
    $stmt = $dbh->prepare($sql2);   
    
    $stmt->execute(array(
        
        title=>$adtitle,
        begindate=>$adbegindate,
        enddate=>$adenddate,
        actualprice=>$newprice,
        oldprice=>$oldprice,
        long=>$adlong,
        lat=>$adlat,
        desc=>$addesc,
        photoname=>$adphotoname,
        photofolder=>$adphotofolder,
        status=>$adstate,
        activation=>$adactivation,
        category=>$category,
        location=>$location,
        user=>$user
        
            ));
    
    $stmt->execute($inputform);

    $messsage = $stmt->rowCount() . " annonce ajoutée";
} catch (PDOException $ex) {
    $messsage = $ex->getMessage();
}

print_r($messsage);
?>


