function init() {
  
 
  SelectAllAds();
  
}


function SelectAllAds() {

var url ="../www/php/SelectAllAds.php";
console.log(url);

    var jqXHR = $.post(
            url,
            {
    
            }
    );

    jqXHR.done(function(data) {
        
        
        alert(data);
        $("#Resultat").html("Done<br>" + data);
        alert("Done");
    });

    jqXHR.fail(function(xhr, statut, erreur) {
        console.log("Erreur : " + xhr.status + "-" + xhr.statusText);
        $("#Resultat").html("Erreur : " + xhr.status + "-" + xhr.statusText);
         alert("Failed");
    });

alert("FIN DE SCRIPT");

}

$( document ).ready(init);