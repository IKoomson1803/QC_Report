// createElementExplicit.js

var myObject = document.createElement('object');

myObject.setAttribute("classid","clsid:D9A2317C-B0E3-4A19-950D-C299252B1126");
myObject.setAttribute("codebase","controls/sonytimecontrol.cab");
myObject.id = "SonyTimeControl1";
myObject.width = "200px";
myObject.width = "100px";


document.getElementById('sonywrapper').appendChild(myObject);


