package  {
	
	public class PositioningRectangle {
		public var x1:uint;
		public var x2:uint;
		public var y1:uint;
		public var y2:uint;

		public function PositioningRectangle() {
		}

		public function getXCenter():uint {
			return  x1 + ((x2 - x1)/2);
		}
		public function getYCenter():uint {
			return  y1 + ((y2 - y1)/2);
		}
		public function getLeft():uint {
			return x1;
		}
		public function getRight():uint {
			return x2;
		}
		public function getTop():uint {
			return y1;
		}
		public function getBottom():uint {
			return y2;
		}
		public function getLeftMargin(width:uint):uint {
			return ((x2 - x1) - width)/2 + x1;
		}
		public function getTopMargin(height:uint):uint {
			return ((y2 - y1) - height)/2 + y1;
		}

	}
	
}
