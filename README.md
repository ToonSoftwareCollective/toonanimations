# toonanimations
Shows animations on Toon.

# Requirements:
- TSC beta enabled on Toon

# Usage:
create the animation in qml and give the name starting with a Capital
add the name of the file to nameindex.json
create the animations json file including all parameters to run from the app


To start from an app:
animationscreen.animationRunning= "run the animation true or false"
animationscreen.qmlAnimationURL =  "url to the component e.g. https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/master/Balloon.qml"

animationscreen.animationInterval= "time between sprites"
animationscreen.isVisibleinDimState= "show in dimmed state true or false"


To stop from an ap:
animationscreen.animationRunning= false
