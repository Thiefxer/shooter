package {
	import flash.display.MovieClip;
	import flash.events.Event;

	public class Bullet extends MovieClip {
		// data attributes
		public var mX: int;
		public var mY: int;
		public var velocity: Number;

		public function Bullet(xPosition: Number, yPosition: Number, velocity) {
			this.mX = xPosition;
			this.mY = yPosition;

			this.x = this.mX;
			this.y = this.mY;

			this.velocity = velocity;
		}

		public function restartBullet() {
			this.mY -= this.velocity;

		}
	}

}