package  {
	
	import flash.display.MovieClip;
	
	// This class is solely responsible for managing access to the frames of the movie clip,
	// specifically the clip with each digit as a tile.  Subclasses add game related behaviors.
	public class NumberTile extends MovieClip {
		internal var scale:Number = 1.0;
		internal var digit:uint = 1;

		public function NumberTile(digit:uint, scale:Number) {
			setDigit(digit);
			setScale(scale);
		}

		public function showDigit() {
			gotoAndStop(locateFrame(digit));
		}
		public function showBlank() {
			gotoAndStop(locateBlankFrame());
		}
		
		public function locateFrame(digit:uint):uint {
			if (digit > 30) {
				trace("Invalid digit!! " + digit);
			}
			return digit + 1;
		}
		public function locateBlankFrame():uint {
			return 32;
		}
		public function setScale(scale:Number) {
			this.scale = scale;
			scaleX=scale;
			scaleY=scale;
		}
		public function setDigit(digit:uint) {
			this.digit = digit;
		}
		public function getDigit():uint {
			return digit;
		}
		
	}
	
}
