function init() {
    $("#envoyer").click(function() {
        if (validation()) {
        alert("Valider ici");
            sendForm();
        } else
        {
            return false;
        }
    alert("C'est COOL");
    });
}




function validation() {

    valid = true;

    //si tous les champs ne sont pas vides alors faire la requete

    if ($("#ad_category").val() === "")
    {
        $("#ad_category").prev(".error-message").fadeIn().text("ad_category");
        valid = false;
    } else
    {//masque le texte en fondu
        $("#ad_category").prev(".error-message").fadeOut();
    }


    if ($("#location").val() === "")
    {
        $("#location").prev(".error-message").fadeIn().text("location");
        valid = false;
    } else {//masque le texte en fondu
        $("#location").prev(".error-message").fadeOut();
        //$("#user").css("border-color","00FF00");
    }

    if ($("#user").val() === "") {
        $("#user").prev(".error-message").fadeIn().text("user");
        valid = false;
    } else {//masque le texte en fondu
        $("#user").prev(".error-message").fadeOut();
        //$("#user").css("border-color","00FF00");
    }

    if ($("#adTitle").val() === "") {
        $("#adTitle").prev(".error-message").fadeIn().text("adTitle");
        valid = false;
    } else {

        $("#adTitle").prev(".error-message").fadeOut();
    }

    if ($("#beginDate").val() === "") {

        $("#beginDate").prev(".error-message").fadeIn(2000).text("beginDate");
        valid = false;
    } else {

        $("#beginDate").prev(".error-message").fadeOut();
    }

    if ($("#adEndDate").val() === "") {

        $("#adEndDate").prev(".error-message").fadeIn(2000).text("adEndDate ");
        valid = false;
    } else {

        $("#adEndDate").prev(".error-message").fadeOut();
    }


    if ($("#pos_long").val() === "") {

        $("#pos_long").prev(".error-message").fadeIn(2000).text("pos_long ");
        valid = false;
    } else {

        $("#pos_long").prev(".error-message").fadeOut();
    }

    if ($("#pos_lat").val() === "") {

        $("#pos_lat").prev(".error-message").fadeIn(2000).text("pos_lat ");
        valid = false;
    } else {

        $("#pos_lat").prev(".error-message").fadeOut();
    }


    if ($("#adNewPrice").val() === "") {

        $("#adNewPrice").prev(".error-message").fadeIn(2000).text("adNewPrice ");
        valid = false;
    } else {

        $("#adNewPrice").prev(".error-message").fadeOut();
    }

    if ($("#adOldPrice").val() === "") {
        $("#adOldPrice").prev(".error-message").fadeIn(2000).text("adOldPrice ");
        valid = false;
    } else {

        $("#adOldPrice").prev(".error-message").fadeOut();
    }

    if ($("#ad_description").val() === "") {
        $("#ad_description").prev(".error-message").fadeIn(2000).text("ad_description ");
        valid = false;
    } else {

        $("#ad_description").prev(".error-message").fadeOut();
    }

    if ($("#ad_photo_name").val() === "") {

        $("#ad_photo_name").prev(".error-message").fadeIn(2000).text("ad_description ");
        valid = false;
    } else {

        $("#ad_description").prev(".error-message").fadeOut();
    }


    if ($("#ad_photo_folder").val() === "") {

        $("#ad_photo_folder").prev(".error-message").fadeIn(2000).text("ad_photo_folder ");
        valid = false;
    } else {

        $("#ad_photo_folder").prev(".error-message").fadeOut();
    }

    if ($("#ad_photo_folder").val() === "") {

        $("#ad_photo_folder").prev(".error-message").fadeIn(2000).text("ad_photo_folder ");
        valid = false;
    } else {

        $("#ad_photo_folder").prev(".error-message").fadeOut();
    }

    if ($("#ad_state").val() === "") {

        $("#ad_state").prev(".error-message").fadeIn(2000).text("ad_state ");
        valid = false;
    } else {

        $("#ad_state").prev(".error-message").fadeOut();
    }
    if ($("#ad_activation").val() === "") {

        $("#ad_activation").prev(".error-message").fadeIn(2000).text("ad_state ");
        valid = false;
    } else {

        $("#ad_activation").prev(".error-message").fadeOut();
    }
    return valid;

}

function SelectAllAds() {

var url ="../www/php/SelectAll.php";
console.log(url);
//
//    var AdCategory = $("#ad_category").val();
//    var Location = $("#location").val();
//    var User = $("#user").val();
//    var AdTitle = $("#adTitle").val();
//    var BeginDate = $("#beginDate").val();
//    var AdEndDate = $("#adEndDate").val();
//    var PosLong = $("#pos_long").val();
//    var PosLat = $("#pos_lat").val();
//    var AdNewPrice = $("#adNewPrice").val();
//    var AdOldPrice = $("#adOldPrice").val();
//    var AdDescription = $("#ad_description").val();
//    var AdPhotoName = $("#ad_photo_name").val();
//    var AdPhotoFolder = $("#ad_photo_folder").val();
//    var AdState = $("#ad_state").val();
//    var AdActivation = $("#ad_activation").val();
    

    var jqXHR = $.post(
            url,
            {
    
            }
    );

    jqXHR.done(function(data) {
        
        
        alert(data);
//        console.log(data);
//        // Pour transformer les RC en <br>
//        var regex = /\n/g;
//        //data = data.replace(regex, "<br>");
        $("#Resultat").html("Done<br>" + data);
        alert("Done");
    });

    jqXHR.fail(function(xhr, statut, erreur) {
        console.log("Erreur : " + xhr.status + "-" + xhr.statusText);
        $("#Resultat").html("Erreur : " + xhr.status + "-" + xhr.statusText);
         alert("Failed");
    });



    alert(DataString);
alert("SendForm");
alert(url);

}

$( document ).ready(init);