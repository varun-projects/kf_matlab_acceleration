/*
*   google maps stuff goes here...
*/


var map;

function func_map(){
///Defining the map

//  Map Center = Downtown Lowell
  var uluru = {lat:42.56264079, lng:-71.01759125};

//   Map Center = UML
//    var uluru = {lat:42.65411107,lng:-71.32652889};
  map = new google.maps.Map(document.getElementById('map'), {
          center: uluru,
          zoom: 14,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        });
}
