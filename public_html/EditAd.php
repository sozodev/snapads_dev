<?php


//var_dump($_POST);

$code=$_GET['code'];

$Proprietes = parse_ini_file("snap_ads.properties");

$dbhost = $Proprietes ['serveur'];
$dbport = $Proprietes['port'];
$dbuser = $Proprietes['user'];
$dbuserPass = $Proprietes['mdp'];
$dbname = $Proprietes['bd'];
$dbpass = '';

$req="SELECT * FROM ads WHERE CODE=?";

try {
    
    $pdo = new PDO("mysql:host=$dbhost;port=$dbport;dbname=$dbname", $dbuser, $dbuserPass);
$ps=$pdo->prepare ($req);
$params=array($code);
$ps->execute($params);
$ad=$ps->fetch();
    
    $messsage = $ps->rowCount() . " annonce ajoutée";
} catch (PDOException $e) {
    $messsage = $e->getMessage();
}

print_r($messsage);



?>


<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Snapads : créer une annonce</title>
            <script src="js/jquery.js"></script> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
        <link href='https://fonts.googleapis.com/css?family=Titillium+Web:200,200italic,300,300italic,400,400italic,600,600italic,700,700italic,900&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
    
        <script type="text/javascript" src="js/AdsInsert.js"></script> 

        <style>

            .error-message{
                color: red;
                font-size: 2em;
                display: none;
            };

            .msg_error {
                border: solid red 1px;  
            };

            p#Resultat {
                background-color: red;
                color: white;
                font-size: 1.3em;
                margin: 31px auto auto;
                padding: 20px;
                text-align: center;
                width: 300px;
            }
            
                   body {
                       font-family: 'Titillium Web', sans-serif;
  background-color: #232323;
}  
            
            .mainContainer {
                background-color: white;
            }

        </style>




    </head>
    <body>
        
        
        
        
        
        
        
        
        
        
        
        
        
        

        <form action="EditAd.php" id="contact" method="GET" name="#" enctype="multipart/form-data" target="_self">





                <div class="row form-group">
                    <div class="col-md-2">
                        <label for="adcategory" class="control-label">Categorie du produit</label>
                    </div>
                    <div class="col-md-10">
                        <select id="adcategory" name="adcategory" class="form-control" size="1">
                            <option value="2">loisir</option>
                            <option value="1">automobile</option>
                        </select>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-md-2">
                        <label for="location" class="control-label">ID adresse</label>
                    </div>
                    <div class="col-md-10">
                        <div class="error-message">erreur</div>
                        <input type="text" name="location" class="form-control" id="location" value="1">
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-md-2">
                        <label for="user" class="control-label">ID utilisateur</label>
                    </div>
                    <div class="col-md-10">
                        <div class="error-message">erreur</div>
                        <input type="text" name="user" class="form-control" id="user" value="1">

                    </div>
                </div>


                <div class="row form-group">
                    <div class="col-md-2">
                        <label for="adtitle" class="control-label">Titre de l'annonce</label>
                    </div>
                    <div class="col-md-10">
                        <div class="error-message">erreur</div>
                        <input type="text" name="adtitle" class="form-control" id="adtitle" value="Annonce desss denière minute">

                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-md-2">
                        <label for="adbegindate" class="control-label">Date de debut</label>
                    </div>
                    <div class="col-md-10">
                        <div class="error-message">erreur</div>
                        <input type="date" name="adbegindate" class="form-control" id="adbegindate" value="2017-07-14">
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-md-2">
                        <label for="adenddate" class="control-label ">Date de fin</label>
                    </div>
                    <div class="col-md-10">
                        <div class="error-message">erreur</div>
                        <input type="date"  max="2017-07-15" min="2017-07-15" name="adenddate" class="form-control" id="AdEndDate"  value="2017-07-15">
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-md-2">
                        <label for="adlong" class="control-label">longitude</label>
                    </div>
                    <div class="col-md-10">
                        <div class="error-message">erreur</div>
                        <input type="text" name="adlong" class="form-control" id="AdLong" value="25555">
                    </div>
                </div>


                <div class="row form-group">
                    <div class="col-md-2">
                        <label for="adlat" class="control-label">latitude</label>
                    </div>
                    <div class="col-md-10">
                        <div class="error-message">erreur</div>
                        <input type="text" name="adlat" class="form-control" id="adlat" value="000">
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-2">
                        <label for="newprice" class="control-label">Nouveau prix (€)</label>
                    </div>
                    <div class="col-md-10">
                        <div class="error-message">erreur</div>
                        <input type="text" name="newprice" class="form-control" id="newprice" value="12">
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-md-2">
                        <label for="oldprice" class="control-label">Ancien prix (€)</label>
                    </div>
                    <div class="col-md-10">
                        <div class="error-message">erreur</div>
                        <input type="text" name="oldprice" class="form-control" id="oldprice" value="15">
                    </div>
                </div>



                <div class="row form-group">
                    <div class="col-md-2">
                        <label for="AdDesc" class="control-label">Description de l'offre</label>
                    </div>
                    <div class="col-md-10">
                        <div class="error-message">erreur</div>
                        <textarea id="AdDesc" class="form-control" name="addesc" >lorem ipsum sit dolor amet</textarea>
                    </div>
                </div>


                <div class="row form-group">
                    <div class="col-md-2">
                        <label for="adphotoname" class="control-label">nom de la photo</label>
                    </div>
                    <div class="col-md-10">
                        <div class="error-message">erreur</div>
                        <input type="text" name="adphotoname" class="form-control" id="adphotoname" value="exemple">
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-md-2">
                        <label for="adphotofolder" class="control-label">repertoire de la photo</label>
                    </div>
                    <div class="col-md-10">
                        <div class="error-message">erreur</div>
                        <input type="text" name="adphotofolder" class="form-control" id="adphotofolder" value="/photos">
                    </div>
                </div>



                <div class="row form-group">
                    <div class="col-md-2">
                        <label for="adstate" class="control-label">Etat</label>
                    </div>
                    <div class="col-md-10">
                        <div class="error-message">erreur</div>
                        <select id="AdState" name="adstate" class="form-control" size="1">
                            <option value="1">validé</option>
                            <option value="2">En cours de validation</option>
                            <option value="3">non validé</option>
                        </select>
                    </div>
                </div>
                
                
                
                      <div class="row form-group">
                    <div class="col-md-2">
                        <label for="photofile" class="control-label">Etat</label>
                    </div>
                    <div class="col-md-10">
                        <div class="error-message">erreur</div>
                        <input type="file" name ="photofile" >
                    </div>
                </div>
                
                
                
                

                <div class="row form-group">
                    <div class="col-md-2">
                        <label for="adactivation" class="control-label">activation</label>
                    </div>
                    <div class="col-md-10">
                        <div class="error-message">erreur</div>
                        <select id="AdActivation" name="adactivation" class="form-control" size="1">
                            <option value="1">activé</option>
                            <option value="0">désactivé</option>
                        </select>
                    </div>
                </div>

                <hr>

                <div class="form-group form-group">
                    <div class="col-md-offset-2 col-md-10">
                        <input type="submit" class="btn btn-success" id="envoyer" value="Envoyer">
                        <input type="button" class="btn btn-danger" value="Annuler">


                    </div>
                </div>




            </form>
        
        
        
        
        
        
        
        
        
        
        
    </body>
</html>