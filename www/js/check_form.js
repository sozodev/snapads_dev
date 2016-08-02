/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(function(){
    
    
    
});



$function(){
            $(#valider).click(function){
            valid = 1;
            //verif du champ catégorie
            if ($(#ad_photo_name).val() == ""){
            $(#message).show().text("Entrez un nom de photo");
            valid = 0;
            }
            else
            {$(#message).hide();
            }