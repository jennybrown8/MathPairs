package  {
	import flash.display.Sprite;

	/* Defines the area where numbers indicate levels. */
	public class LevelChoiceBox extends PositioningRectangle {
		internal const GRIDX:uint = 10;
		internal const GRIDY:uint = 4;
		internal const MAX_LEVEL:uint = 30;
		internal const UNSCALED_TILE_SIZE = 100;
		
		internal const LEFT = 25;
		internal const TOP = 140;
		internal const WIDTH = 980;
		internal const HEIGHT = 540;

		public function LevelChoiceBox() {
			x1 = LEFT;
			x2 = LEFT + WIDTH;
			y1 = TOP;
			y2 = TOP + HEIGHT;
		}
		
		public function calculateBestScale(spacing:uint):Number {
			var xColumnSize = WIDTH / GRIDX;
			var yRowSize = HEIGHT / GRIDY;
			var targetSize = Math.min(xColumnSize, yRowSize);
			var spacedSize = targetSize - spacing;
			var scale:Number = spacedSize / UNSCALED_TILE_SIZE;
			return scale;
		}
		public function calculateColumn(gridBlock:uint):uint {
			return (gridBlock % GRIDX);
		}
		public function calculateRow(gridBlock:uint):uint {
			return Math.floor(gridBlock / GRIDX);
		}
		
		public function getColumnXPos(column:uint):uint {
			var perColumnPixels = WIDTH / GRIDX;
			return (perColumnPixels * column) + LEFT;
		}
		public function getRowYPos(row:uint):uint {
			var perRowPixels = HEIGHT / GRIDY;
			return (perRowPixels * row) + TOP;
		}

	}
	
}
