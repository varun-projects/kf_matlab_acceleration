/*
*   Marker handling stuff goes here...
*/


// marker array for hiding/showing
var rri5_markers = [];


var icons = {
  pothole: {
    icon: 'pot_holes.png'
  },
  crack: {
    icon: 'cracks.png'
  },
  dirt: {
    icon: 'gravel_roads.png'
  },
  rri1: {
    icon: 'images/rri1.png'
  },
  rri2: {
    icon: 'images/rri2.png'
  },
  rri3: {
    icon: 'images/rri3.png'
  },
  rri4: {
    icon: 'images/rri4.png'
  },
  rri5: {
    icon: 'images/rri5.png'
  }
};


//   RRI-Level 1 Markers
function addRRI1Marker() {

console.log("created function addRRI1Marker started");

    var i;
    for (i = 0; i < keys.length; i++){
var id = keys[i];
//if (list[id].type =='rri1'){
var mark_lat =list[id].latitude
var mark_long = list[id].longitude
console.log("latitude"+mark_lat);
console.log("longitude" +mark_long);

console.log("scan id" + list[id].scan_id_label);

var latlong = new google.maps.LatLng(mark_lat,mark_long);
var test_lat= mark_lat; var test_long=mark_long;
var marker = new google.maps.Marker({
          position: new google.maps.LatLng(test_lat,test_long),
          icon: icons["rri1"].icon,
          map: map
        });


var content = "speed " + list[id].speed +  '   ' + "accuracy" + list[id].accuracy+ '   '  +"bearing angle" +list[id].bearing
var infowindow = new google.maps.InfoWindow()
google.maps.event.addListener(marker,'click', (function(marker,content,infowindow){ 
        return function() {
           infowindow.setContent(content);
           infowindow.open(map,marker);
        };
    })(marker,content,infowindow));
//}
}
// markers.push(marker);
}



//   RRI-Level 2 Markers
function addRRI2Marker() {

console.log("created function started");
var i;
for( i=0 ; i< keys.length; i++){
var id = keys[i];
//if (list[id].type =='rri2'){
var mark_lat =list[id].kf_latitude
var mark_long = list[id].kf_longitude

console.log("latitude"+mark_lat);
console.log("longitude" +mark_long);

var latlong = new google.maps.LatLng(mark_lat,mark_long);
var test_lat= mark_lat; var test_long=mark_long;
var marker = new google.maps.Marker({
          position: new google.maps.LatLng(test_lat,test_long),
          icon: icons["rri2"].icon,
          map: map
        });

var content = "Kalaman predicted speed " + list[id].kf_speed_total + '  '+ " Kalaman position covariance " + list[id].kf_covariance_lat + '  '+ " Kalaman estimate lat " + list[id].kf_latitude + '  '+ " Kalaman estimate long " + list[id].kf_longitude
var infowindow = new google.maps.InfoWindow()
google.maps.event.addListener(marker,'click', (function(marker,content,infowindow){ 
        return function() {
           infowindow.setContent(content);
           infowindow.open(map,marker);
        };
    })(marker,content,infowindow));
//}
}
//markers.push(marker);
}






//   RRI-Level 3 Markers
function addRRI3Marker() {

console.log("created function started");
var i;
for( i=0 ; i< keys.length; i++){
var id = keys[i];
//if (list[id].type ==1111){
var mark_lat =list[id].kf_latitude_constant_v
var mark_long = list[id].kf_longitude_constant_v
console.log("latitude"+mark_lat);
console.log("longitude" +mark_long);

var latlong = new google.maps.LatLng(mark_lat,mark_long);
var test_lat= mark_lat; var test_long=mark_long;
var marker = new google.maps.Marker({
          position: new google.maps.LatLng(test_lat,test_long),
          icon: icons["rri3"].icon,
          map: map
        });
//}
      var content = "speed_total " + list[id].kf_speed_total + " delta t" + list[id].delta_t +"time" + list[id].time_second + "covariance " + list[id].kf_covariance_lat 
      var infowindow = new google.maps.InfoWindow()

      google.maps.event.addListener(marker,'click', (function(marker,content,infowindow){ 
        return function() {
           infowindow.setContent(content);
           infowindow.open(map,marker);
        };
    })(marker,content,infowindow));


}
//markers.push(marker);
}






//   RRI-Level 4 Markers
function addRRI4Marker() {

console.log("created function started");
var i;
for( i=0 ; i< keys.length; i++){
var id = keys[i];
if (list[id].type =='rri4'){
var mark_lat =list[id].latitude
var mark_long = list[id].longitude
console.log("latitude"+mark_lat);
console.log("longitude" +mark_long);

var latlong = new google.maps.LatLng(mark_lat,mark_long);
var test_lat= mark_lat; var test_long=mark_long;
var marker = new google.maps.Marker({
          position: new google.maps.LatLng(test_lat,test_long),
          icon: icons["rri4"].icon,
          map: map
        });
}
}
//markers.push(marker);
}





//   RRI-Level 5 Markers
function addRRI5Marker() {

console.log("created function started");

  var i;

  for( i=0 ; i< keys.length; i++){

    var id = keys[i];

    if (list[id].type ==1122){
      var mark_lat =list[id].kf_latitude
      var mark_long = list[id].kf_longitude
      //      console.log("latitude"+mark_lat);
      //      console.log("longitude" +mark_long);

      var latlong = new google.maps.LatLng(mark_lat,mark_long);
      var test_lat= mark_lat;
      var test_long=mark_long;

      var marker = new google.maps.Marker({
          position: new google.maps.LatLng(test_lat,test_long),
          icon: icons["rri5"].icon,
          map: map
          });

      var content = "speed_total " + list[id].kf_speed_total + " delta t" + list[id].delta_t +"time" + list[id].time_second + "covariance " + list[id].kf_covariance_lat 
      var infowindow = new google.maps.InfoWindow()

      google.maps.event.addListener(marker,'click', (function(marker,content,infowindow){ 
        return function() {
           infowindow.setContent(content);
           infowindow.open(map,marker);
        };
    })(marker,content,infowindow));


      }
//      rri5_markers.push(marker);
    }
}



function addAllMarker() {
  addRRI1Marker();
  addRRI2Marker();
  addRRI3Marker();
  addRRI4Marker();
  addRRI5Marker();
}
