# toonanimations
Shows animations on Toon.<br>

# Usage:
create the animation in qml and give the name starting with a Capital letter<br>
add the name of the file to nameindex.json<br>

create the animations json file including all parameters to run from the app<br>


<b>To start from an app:</b>
<br>
animationscreen.animationRunning= "run the animation true or false"  <br>
animationscreen.qmlAnimationURL =  "url to the component e.g. https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/master/Balloon.qml"<br>
animationscreen.animationInterval= "time between sprites"<br>
animationscreen.isVisibleinDimState= "show in dimmed state true or false"<br>


To stop from an app:<br>
animationscreen.animationRunning= false     this command will stop ALL running animations
