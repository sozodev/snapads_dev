<?php

require_once('config.php');

$category=filter_input(INPUT_POST,"cp",FILTER_SANITIZE_STRING);

$category = $_POST['ad_category'];
$photo = $_POST['id_photo'];
$location = $_POST['location'];
$user = $_POST['user'];
$title = $_POST['adTitle'];
$begin_date = $_POST['beginDate'];
$end_date = $_POST['adEndDate'];
$new_price = $_POST['adNewPrice'];
$old_price = $_POST['adOldPrice'];
$ad_long = $_POST['pos_long'];
$ad_lat = $_POST['pos_lat'];
$desc = $_POST['ad_description'];
$state = $_POST['ad_state'];
$activate = $_POST['ad_activation'];

$sql = "INSERT INTO ads (id_category, id_photo, id_location,id_user,ad_title,ad_begin_date,ad_end_date,ad_actual_price,ad_old_price,ad_pos_longitude,ad_pos_latitude,ad_description,ad_state,ad_activate)
		VALUES ( '$category', '$photo', '$location','$user','$title','$begin_date','$new_price','$new_price','$old_price','$ad_long','$ad_lat','$desc','$state','$activate' ) ";

/*
$lcn = null;
try {
$lcn = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);
$lcn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$sth = $lcn->prepare($sql);
$sth->execute();
$result = $sth->fetchAll();
$lcn = null;
} catch (PDOException $e ){
   echo '{"error":{"text":'. $e->getMessage() .'}}'
}*/

 ?>