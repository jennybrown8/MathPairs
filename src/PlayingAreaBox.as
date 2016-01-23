package  {

	/*
	Defines the biggest part of the playing area, where the tile grid goes.
	*/
	public class PlayingAreaBox extends PositioningRectangle {

		private var bevelLeftMargin:uint = 6;
		private var bevelTopMargin:uint = 4;

		public function PlayingAreaBox() {
			x1 = 25 + bevelLeftMargin;
			x2 = 775 + bevelLeftMargin;
			y1 = 50 + bevelTopMargin;
			y2 = 750 + bevelTopMargin;
		}

	}
	
}
