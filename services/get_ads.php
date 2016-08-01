<pre>
    <?php
// Paramètres de connexion
    require_once('config.php');

// Requête
    $sql = "SELECT * FROM ads";

//Debut connexion

    $lcn = null;
    try {

//Instanciation d'un objet connexion
        $lcn = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);

// Gestion des erreurs en mode Exception
        $lcn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $lcn->exec("SET NAMES 'UTF8'");

//preparation de la requete / créaion objet statement
        $sth = $lcn->prepare($sql);
//éxécution de la requete

        $sth->execute();
// Recupération de toutes les lignes du tableau d'objets
        $result = $sth->fetchAll(PDO::FETCH_ASSOC);

        $sth->closeCursor();
//deconnexion
        $lcn = null;
        $lsResultas = json_encode($result);
        var_dump($result);
        var_dump($lsResultas);
        
    }
//En cas d'echec on lève une exeception
    catch (PDOException $e) {
        echo '{"error":{"text":' . $e->getMessage() . '}}';
    }
    ?>
</pre>