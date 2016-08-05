<?php
$Proprietes = parse_ini_file("snap_ads.properties");

$dbhost = $Proprietes ['serveur'];
$dbport = $Proprietes['port'];
$dbuser = $Proprietes['user'];
$dbuserPass = $Proprietes['mdp'];
$dbname = $Proprietes['bd'];
$dbpass = '';


$req = "SELECT * FROM ads";
$pdo = new PDO("mysql:host=$dbhost;port=$dbport;dbname=$dbname", $dbuser, $dbuserPass);
$ps = $pdo->prepare($req);
$ps->execute();
?>

<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
        <script src="js/jquery.js"></script> 

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
        <link href='https://fonts.googleapis.com/css?family=Titillium+Web:200,200italic,300,300italic,400,400italic,600,600italic,700,700italic,900&subset=latin,latin-ext' rel='stylesheet' type='text/css'>

        <style>
            .spacer {margin-top: 60px;}
            body {
                font-family: 'Titillium Web', sans-serif;
                background-color: #232323;
            }  

        </style>

    </head>
    <body>

        <?php require_once 'header.php'; ?>'';

        <div class ="col-md-8 col-xs-12s spacer col-md-offset-2 "> 

            <div class="panel">

                <div class="panel-heading"><h1>Liste des annonces</h1></div>
      
                
                
                
                
                <div class="panel-body">


                    <table class="table table-stripped">
                        <thead>
                            <tr>

                                <th>Photo</th>  <th>Nom de l'article </th>  <th>Date de publication</th>  <th>Date de de fin</th>  <th>ancien prix</th><th>nouveau prix</th>



                            </tr>
                        </thead>
                        <tbody>
                            <?php while ($ad = $ps->fetch()) { ?>

                                <tr>

                                    <td><img src="image/<?php echo ($ad['photo_name'])  ?>" width="100" height="100"></td>
                                    <td><?php echo ($ad['ad_title']) ?></td>
                                    <td><?php echo ($ad['ad_begin_date']) ?></td>
                                    <td><?php echo ($ad['ad_end_date']) ?></td>
                                    <td><?php echo ($ad['ad_actual_price']) ?></td>
                                    <td><?php echo ($ad['ad_old_price']) ?></td>
                                    <td><a href="EditAd.php?code=<?php echo ($ad['id_ad']) ?>">Editer</a></td>
                                    <td><a onclick="return confirm ('est vous sur de vouloir supprimer')" href="DeleteAds.php?code= <?php echo ($ad['id_ad']) ?>">supprimer</a></td>

                                </tr>


                            <?php } ?>



                        </tbody>

                    </table>


                </div>


            </div>


        </div>


    </body>
</html>      