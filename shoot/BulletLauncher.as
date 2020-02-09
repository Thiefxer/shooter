package {
	import flash.display.MovieClip;
	import flash.events.Event;

	public class BulletLauncher extends MovieClip {
		public var mX: int;
		public var mY: int;

		public function BulletLauncher(xPosition: int) {
			// constructor code for the launcher
			this.mX = xPosition;
			this.mY = 450; //sets locked height

		}

	}

}