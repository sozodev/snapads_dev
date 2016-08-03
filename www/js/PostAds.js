function init() {
    $("#envoyer").click(function () {
        if (validation()) {
            sendForm();
        } else
        {
            return false;
        }
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


function sendForm() {

//alert('senForm');

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
    var ad_photo_name = $("#ad_photo_name").val();
    var ad_photo_folder = $("#ad_photo_folder").val();
    var ad_state = $("#ad_state").val();
    var ad_activation = $("#ad_activation").val();
    var lsDataString = ad_category + location + user + adTitle + beginDate + adEndDate + pos_long + pos_lat + adNewPrice + adOldPrice + ad_description + ad_photo_name + ad_photo_folder + ad_state + ad_activation;
    var msg_all = "Merci de remplir tous les champs";
    var msg = "Merci de remplir ce champs";



var jqXHR = $.post(
    "http://localhost/snapads_dev-master/snapads_dev-master/www/services/AdsInsert.php",
    { ad_title: adTitle, ad_begin_date: beginDate, ad_end_date: adEndDate, ad_actual_price: adNewPrice ,ad_old_price: adOldPrice, ad_pos_longitude: pos_long, ad_pos_latitude: pos_lat, ad_description: ad_description, ad_photo_name: ad_photo_name, ad_photo_folder: ad_photo_folder, ad_state: ad_state, ad_activate: ad_activation, id_category: ad_category, id_location: location, id_user: user}, 
    "text"
);

jqXHR.done(function(data) {
    // Pour transformer les RC en <br>
    var regex = /\n/g;
    //data = data.replace(regex, "<br>");
    $("#Resultat").html("Done<br>" + data);
});

jqXHR.fail(function(xhr, statut, erreur) {
    $("#Resultat").html("Erreur : " + xhr.status + "-" + xhr.statusText);
});



  //  alert(lsDataString);


}

$(document).ready(init);

