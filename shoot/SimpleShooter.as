package {
	import flash.display.*;
	import flash.events.*;
	import flash.ui.Mouse;

	public class SimpleShooter extends MovieClip {
		private var launcher: BulletLauncher;
		private var bulletList: Array;
		private var planeList: Array;
		private var nPlanes: int = 20;

		public function SimpleShooter() {
			// constructor code, creates both arrays and the launcher
			bulletList = new Array();
			launcher = new BulletLauncher(450);
			planeList = new Array();
			var staggerPosition: int = 75;


			//launcher code
			launcher.x = launcher.mX;
			launcher.y = launcher.mY;


			//plane loop
			for (var i: int = 0; i < nPlanes; i++) {
				var plane: Plane = new Plane(staggerPosition);
				staggerPosition += (Math.floor(Math.random() * 31) + 1);
				plane.x = plane.mX;
				plane.y = plane.mY;
				addChild(plane);
				planeList.push(plane);
			}

			addEventListener(Event.ENTER_FRAME, update);
			addChild(launcher);

			stage.addEventListener(MouseEvent.CLICK, shootBullet);
		}
		public function update(event: Event) {
			//adding planes and movement code
			for (var i: int = 0; i < nPlanes; i++) {
				planeList[i].moveIt();
				planeList[i].x = planeList[i].mX;
				
				//hit detection code
				for (var j: int = 0; j < bulletList.length; j++) {
					if (bulletList[j].hitTestObject(planeList[i])) {
						removeChild(planeList[i]); // removes planes when hit
						
						//reseting bullet code
						removeChild(bulletList[j]);
						bulletList[j] = null;
						bulletList.splice(j, 1);
					}
				}
			}
			//allows the launcher to follow the mouse
			launcher.x = mouseX;

		}

		public function shootBullet(event: MouseEvent) {
			//check for a mouse click to shoot
			var bullet: Bullet = new Bullet(launcher.x, launcher.y, 15);
			addChild(bullet);
			bulletList.push(bullet);
			stage.addEventListener(Event.ENTER_FRAME, bulletMove);

		}
		public function bulletMove(event: Event) {
			if (bulletList.length != 0) {
				for (var i: int = 0; i < bulletList.length; i++) {
					bulletList[i].y -= 15;

					if (bulletList[i].y < 0) {
						removeChild(bulletList[i]);
						bulletList[i] = null;
						bulletList.splice(i, 1);
					}

				}
			}
		}

	}

}