De triggerfile wordt gebruikt voor het op afstand starten en stoppen van een animatie op de toon. Hiervoor wordt de triggerfile elke 5 minuten uitgelezen vanaf de toon.

De triggerfile is opgebouwd uit een eenvoudige json :

voorbeeld:
{"animationtype":"Balloon","animationmode":"Start"}

waarbij animationtype is een van de animaties uit de file toonanimations/nameindex.json  en animationmode kan zijn "Start", "Stop" of iets anders.  Let op alles is 
hoofdlettergevoelig.

Huidige animaties : Balloon, Roach, Leaf, F1car, Icecream, Firework, Firework2, Santa, Heart, Confetti, Wine, Snow, Butterfly, Roach2, Rabbit, Eggs

Zodra als dat een "Start" wordt ontvangen wordt de bijbehoorende animatie geladen met de bijbehorende parameters als gedefineerd in animatienaam.json uit 
/toonanimations

De animatie zal voortduren zolang de gebruiker niet op stop animatie drukt op de toon of dat een stop is verzonden in de triggerfile. Het is raadzaam om het start 
commando te geven gedurende een tijd van 6-10 minuten en daarna de start trigger te vervangen door een niet geldig commando. Daarmee wordt voorkomen dat de animatie 
opnieuw wordt gestart nadat de gebruiker de animatie handmatig heeft gestopt.

Een stop uit de triggerfile kan worden gegeven als {"animationtype":"Balloon","animationmode":"Stop"}. Het maakt dan niet uit welke animatie op dat moment loopt, alle 
animaties zullen stoppen met het stop commando.

Voorbeeld:
vuurwerk weergeven op de Toon

1.  Edit de triggerfile naar {"animationtype":"Firework","animationmode":"Start"}  en sla deze op
2.  Na de verversing van github (Raw) en het pollen van de toon zal voorwerk worden weergegeven op het schwerm van de gebruiker.
3.  Na 6-10 minuten zal de triggerfile worden aangepast in {"animationtype":"Firework","animationmode":"blabla"} . De gebruiker kan de animatie stoppen via de app door op stop te klikken.
4.  Nadat TSC besluit de animatie op afstand te stoppen kan het commando {"animationtype":"Balloon","animationmode":"Stop"} worden gegeven. Alle animaties op de toon stoppen (ook de Firework).









