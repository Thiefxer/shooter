package {
	import flash.display.MovieClip;
	import flash.events.Event;

	public class Plane extends MovieClip {
		// data attributes
		public var mX: int;
		public var mY: int;
		public var endZone: Number;
		public var startZone: Number;
		public var velocity: Number;
		public var directionFactor: Number;

		//standard plane direction randomizer
		public function Plane(yPosition: int) {
			this.mY = yPosition;

			//computes direction of plane
			this.directionFactor = (Math.floor(Math.random() * 2) == 0) ? -1 : 1;

			//sets start position, end reset position
			this.scaleX = this.directionFactor * -1;
			if (this.directionFactor == -1) {
				this.startZone = (Math.floor(Math.random() * 1500 + 900));
				this.endZone = -1 * (Math.floor(Math.random() * 900 + 300));
			} else {
				this.endZone = (Math.floor(Math.random() * 1500 + 900));
				this.startZone = -1 * (Math.floor(Math.random() * 900 + 300));
			}
			this.mX = startZone;

			//assigns a random velocity
			this.velocity = Math.floor(Math.random() * 15 + 2) * this.directionFactor;
		}

		//Moves the plane
		public function moveIt(): void {
			//updates x position based on velocity
			this.mX += this.velocity;

			//checks if the plane is off screen
			if ((this.directionFactor == -1 && this.mX < this.endZone) || (this.directionFactor == 1 && this.mX > this.endZone)) {
				this.mX = this.startZone;
			}


		}

	}

}