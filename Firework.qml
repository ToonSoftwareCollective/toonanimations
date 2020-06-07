import QtQuick 2.1
import qb.components 1.0
import BasicUIControls 1.0;

import QtQuick.Particles 2.1


Item {
	id: fireworks

	Rectangle {
		id: root
		width: root.width
		height: root.height
		color: "transparent"

		ParticleSystem {
			id: particlesSystem
		}

		ImageParticle {
			source: "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/master/particle.png"
			system: particlesSystem
			color: "red"
			groups: ["A"]
		}

		ImageParticle {
			source: "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/master/smoke_particle.png"
			system: particlesSystem
			groups: ["B"]
			color: "white"
		}

		ImageParticle {
			source: "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/master/smoke_particle.png"
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
			maximumEmitted: 6
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
				height: 75
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
				lifeSpan: 1000
				emitRatePerParticle: 350
				size: 10
				velocity: AngleDirection {angleVariation: 360; magnitude: 100}
				acceleration: PointDirection {y:  20}
			}
		}
	}//rectangle
}//screen
