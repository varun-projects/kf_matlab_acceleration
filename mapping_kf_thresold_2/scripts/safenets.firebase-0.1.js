/*
*   firebase stuff goes here...
*/

var list = [];
var keys;


 var config = {
    apiKey: "AIzaSyADhS1yy_K-uU5bDojlapH-NdKWQ23SXX8",
    authDomain: "fusion2018-1be6d.firebaseapp.com",
    databaseURL: "https://fusion2018-1be6d.firebaseio.com",
    projectId: "fusion2018-1be6d",
    storageBucket: "fusion2018-1be6d.appspot.com",
    messagingSenderId: "986913864915"
  };
  firebase.initializeApp(config);



  var database = firebase.database();
  var ref = firebase.database().ref("loc_kf_south_campus_ride2_accelerometer_constant_v_comparision/");

  ref.on("value", function(snapshot) {

    list = snapshot.val();
    ref.set(list);
    keys = Object.keys(list);
    //////////////reference snapshot firebase ends here

    }, function (error) {
        console.log("Error: " + error.code);
    });
