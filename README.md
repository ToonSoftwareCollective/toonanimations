# toonanimations
Shows animations on Toon.

# Requirements:
- TSC beta enabled on Toon

# Usage:
create the animation in qml and give the name starting with a Capital

modify the triggerfile in folder trigger:
to start:

{"balloonmode": "", "animationtime": "", "animationtype": "" : "" , animationDuration: ""}

where:
balloonmode = start or stop of the animation
animationtime = time between each sprite. the shorter the time the more sprites in the screen but more processor capacity is needed
animationtype = link to the qml file (in raw format!)
visibleindimstate = show sprites in damstate, yes or no
animationDuration = maximum time to play the animation, defaults to 8 hours

for example:

{"balloonmode": "Start", "animationtime": "1200", "animationtype": "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/master/Balloon.qml","visibleindimstate" : "yes" , animationDuration: "3440000"}


to stop:

set balloonmode to "Stop"

for example:

{"balloonmode": "Stop", "animationtime": "1200", "animationtype": "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/master/Balloon.qml","visibleindimstate" : "yes" , animationDuration: "3440000"}

or 

{"balloonmode": "Stop"}
