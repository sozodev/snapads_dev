function init() {
    $("#valider").on("click", validation);

    
}


$(function validation() {

    /*
     var lsDataString = ad_category + location + user + adTitle + beginDate + adEndDate + pos_long + pos_lat + adNewPrice + adOldPrice + ad_description + ad_description + ad_photo_folder + ad_state + ad_activation;
     var msg_all = "Merci de remplir tous les champs";
     var msg = "Merci de remplir ce champs";
     
     */


    $("#envoyer").click(function () {

        valid = true;
        
        //si tous les champs ne sont pas vides alors faire la requete

        if ($("#ad_category").val() == "") {
            $("#ad_category").prev(".error-message").fadeIn().text("ad_category");
            valid = false;
        } else {//masque le texte en fondu
            $("#ad_category").prev(".error-message").fadeOut();                        
        }


        if ($("#location").val() == "") {
            $("#location").prev(".error-message").fadeIn().text("location");
            valid = false;
        } else {//masque le texte en fondu
            $("#location").prev(".error-message").fadeOut();
            //$("#user").css("border-color","00FF00");
        }


        if ($("#user").val() == "") {
            $("#user").prev(".error-message").fadeIn().text("user");
            valid = false;
        } else {//masque le texte en fondu
            $("#user").prev(".error-message").fadeOut();
            //$("#user").css("border-color","00FF00");
        }

        if ($("#adTitle").val() == "") {
            $("#adTitle").prev(".error-message").fadeIn().text("adTitle");
            valid = false;
        } else {

            $("#adTitle").prev(".error-message").fadeOut();
        }

        if ($("#beginDate").val() == "") {

            $("#beginDate").prev(".error-message").fadeIn(2000).text("beginDate");
            valid = false;
        } else {

            $("#beginDate").prev(".error-message").fadeOut();
        }

        if ($("#adEndDate").val() == "") {

            $("#adEndDate").prev(".error-message").fadeIn(2000).text("adEndDate ");
            valid = false;
        } else {

            $("#adEndDate").prev(".error-message").fadeOut();
        }


        if ($("#pos_long").val() == "") {

            $("#pos_long").prev(".error-message").fadeIn(2000).text("pos_long ");
            valid = false;
        } else {

            $("#pos_long").prev(".error-message").fadeOut();
        }

        if ($("#pos_lat").val() == "") {

            $("#pos_lat").prev(".error-message").fadeIn(2000).text("pos_lat ");
            valid = false;
        } else {

            $("#pos_lat").prev(".error-message").fadeOut();
        }


        if ($("#adNewPrice").val() == "") {

            $("#adNewPrice").prev(".error-message").fadeIn(2000).text("adNewPrice ");
            valid = false;
        } else {

            $("#adNewPrice").prev(".error-message").fadeOut();
        }

        if ($("#adOldPrice").val() == "") {
            $("#adOldPrice").prev(".error-message").fadeIn(2000).text("adOldPrice ");
            valid = false;
        } else {

            $("#adOldPrice").prev(".error-message").fadeOut();
        }

        if ($("#ad_description").val() == "") {
            $("#ad_description").prev(".error-message").fadeIn(2000).text("ad_description ");
            valid = false;
        } else {

            $("#ad_description").prev(".error-message").fadeOut();
        }

        if ($("#ad_photo_name").val() == "") {

            $("#ad_photo_name").prev(".error-message").fadeIn(2000).text("ad_description ");
            valid = false;
        } else {

            $("#ad_description").prev(".error-message").fadeOut();
        }


        if ($("#ad_photo_folder").val() == "") {

            $("#ad_photo_folder").prev(".error-message").fadeIn(2000).text("ad_photo_folder ");
            valid = false;
        } else {

            $("#ad_photo_folder").prev(".error-message").fadeOut();
        }

        if ($("#ad_photo_folder").val() == "") {

            $("#ad_photo_folder").prev(".error-message").fadeIn(2000).text("ad_photo_folder ");
            valid = false;
        } else {

            $("#ad_photo_folder").prev(".error-message").fadeOut();
        }

        if ($("#ad_state").val() == "") {

            $("#ad_state").prev(".error-message").fadeIn(2000).text("ad_state ");
            valid = false;
        } else {

            $("#ad_state").prev(".error-message").fadeOut();
        }
        if ($("#ad_activation").val() == "") {

            $("#ad_activation").prev(".error-message").fadeIn(2000).text("ad_state ");
            valid = false;
        } else {

            $("#ad_activation").prev(".error-message").fadeOut();
        }

        return valid;

    });
});






/*
 console.log("valeur ad_category :", ad_category);
 console.log("valeur location :", id_location);
 console.log("valeur id_user :", id_user);
 console.log("valeur adTitle :", adTitle);
 console.log("valeur beginDate :", beginDate);
 console.log("valeur adEndDate :", adEndDate);
 console.log("valeur pos_long :", pos_long);
 console.log("valeur pos_lat :", pos_lat);
 console.log("valeur adNewPrice :", adNewPrice);
 console.log("valeur adOldPrice :", adOldPrice);
 console.log("valeur ad_description :", ad_description);
 console.log("valeur ad_photo_name :", ad_photo_name);
 console.log("valeur ad_photo_folder :", ad_photo_folder);
 console.log("valeur ad_state :", ad_state);
 console.log("valeur ad_activation :", ad_activation);
 console.log("la valeur de lsDataString :", lsDataString);
 */






















function insert() {
    var ad_category = $("#ad_category").val();
    var location = $("#location").val();
    var user = $("#user").val();
    var adTitle = $("#adTitle").val();
    var beginDate = $("#beginDate").val();
    var adEndDate = $("#adEndDate").val();
    var pos_long = $("#pos_long").val();
    var pos_lat = $("#pos_lat").val();
    var adNewPrice = $("#adNewPrice").val();
    var adOldPrice = $("#adOldPrice").val();
    var ad_description = $("#ad_description").val();
    var ad_description = $("#ad_photo_name").val();
    var ad_photo_folder = $("#ad_photo_folder").val();
    var ad_state = $("#ad_state").val();
    var ad_activation = $("#ad_activation").val();

    var jqXHR = $.post(
            "../services/AdsInsert.php",
            {cp: ad_category, nom_ville: lsNomVille, id_pays: lsIdPays},
            "text"
            );
    jqXHR.done(function (data) {
        $("#lblMessage").html(data);
    });
    jqXHR.fail(function (xhr, statut, erreur) {
        var sTexte = xhr.status + ":" + xhr.statusText;
        $("#lblMessage").html(sTexte);
    });

}

$(document).ready(init);

