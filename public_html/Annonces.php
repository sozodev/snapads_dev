<?php
$Proprietes = parse_ini_file("snap_ads.properties");

$dbhost = $Proprietes ['serveur'];
$dbport = $Proprietes['port'];
$dbuser = $Proprietes['user'];
$dbuserPass = $Proprietes['mdp'];
$dbname = $Proprietes['bd'];
$dbpass = '';


$req = "SELECT * FROM ads";
$dbh = new PDO("mysql:host=$dbhost;port=$dbport;dbname=$dbname", $dbuser, $dbuserPass);
$ps = $dbh->prepare($req);
$ps->execute();
?>

<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
        
        <style>
            .spacer {margin-top: 60px;}
            
        </style>

    </head>
    <body>
        
        <?php require_once 'header.php'; ?>'';
    
            <div class ="col-md-6 col-xs-12s spacer col-md-offset-3 "> 

                <div class="panel panel-info">

                    <div class="panel-headin">Liste des annonces</div>
                    <div class="panel-body">


                        <table class="table table-stripped">
                            <thead>
                                <tr>

                                    <th>TITRE</th>  <th>DATE DE PARUTION </th>  <th>DATE DE FIN  </th>  <th> PRIX</th>  <th> ANCIEN PRIX</th>



                                </tr>
                            </thead>
                            <tbody>
                                <?php while ($ad = $ps->fetch()) { ?>

                                    <tr>
                                        <td><?php echo ($ad['ad_title']) ?></td>
                                        <td><?php echo ($ad['ad_begin_date']) ?></td>
                                        <td><?php echo ($ad['ad_end_date']) ?></td>
                                        <td><?php echo ($ad['ad_actual_price']) ?></td>
                                        <td><?php echo ($ad['ad_old_price']) ?></td>

                                    </tr>


                                <?php } ?>



                            </tbody>

                        </table>


                    </div>


                </div>


            </div>
    

    </body>
</html>      