import QtQuick 2.1
import qb.components 1.0
import QtQuick.Particles 2.1


Item {
	id: fireworks
	
	if (animationscreen.animationRunning === false){close();}
	
	
	Rectangle {
		id: root
		width: 1024
		height: 600
		color: "transparent"

		ParticleSystem {
			id: particlesSystem
		}

		ImageParticle {
			source: "particle.png"
			system: particlesSystem
			color: "red"
			groups: ["A"]
		}

		ImageParticle {
			source: "smoke_particle.png"
			system: particlesSystem
			groups: ["B"]
			color: "white"
		}

		ImageParticle {
			source: "smoke_particle.png"
			system: particlesSystem
			groups: ["C"]
			color: "red"
			colorVariation: 1.2
		}


		Emitter {
			id: fireWorkEmitter
			system: particlesSystem
			enabled: true
			lifeSpan: 1600
			maximumEmitted: 5
			group: "A"
			anchors{
				left: parent.left
				right: parent.right
				bottom: parent.bottom
			}

			velocity:  AngleDirection {
				angle: 270
				angleVariation: 10
				magnitude: 200
			}

			GroupGoal {
				groups: ["A"]
				goalState: "exploding"
				system: particlesSystem
				y: - root.height / 2
				width: parent.width
				height: 20
				jump: true
			}
		}

		TrailEmitter {
			system: particlesSystem
			group: "B"
			follow: "A"
			size: 12
			emitRatePerParticle: 80
			velocity: PointDirection {yVariation: 10; xVariation: 10}
			acceleration: PointDirection {y:  10}
		}

		ParticleGroup {
			name: "exploding"
			duration: 500
			system: particlesSystem

			TrailEmitter {
				group: "C"
				enabled: true
				anchors.fill: parent
				lifeSpan: 1700
				emitRatePerParticle: 350
				size: 12
				velocity: AngleDirection {angleVariation: 360; magnitude: 100}
				acceleration: PointDirection {y:  20}
			}
		}
	}//rectangle
}//screen
