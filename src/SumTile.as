package  {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	// The number tile in the upper right indicating the Sum is managed here.
	public class SumTile extends NumberTile {
		var LIGHT_BORDER = 0xB3A393;
		var DARK_BORDER = 0x4D3D2D;

		var border:Sprite;

		// Used for sum-total indicator tile.
		public function SumTile(digit:uint, scale:Number) {
			super(digit, scale);
			border = new Sprite();
			addChild(border);
		}
		public function calculateSumAreaPosition(sumAreaBox:SumAreaBox) {
			this.x = sumAreaBox.getLeftMargin(this.width);
			this.y = sumAreaBox.getTopMargin(this.height);
		}
		public function drawBorder() {
			border.x = 1;
			border.y = 1;
			border.graphics.lineStyle(3,DARK_BORDER,1,true);
			border.graphics.moveTo(100, 0);
			border.graphics.lineTo(100, 100);
			border.graphics.lineTo(0, 100);
			border.graphics.lineStyle(3,LIGHT_BORDER,1,true);
			border.graphics.lineTo(0, 0);
			border.graphics.lineTo(100, 0);			
		}
		public override function showDigit() {
			super.showDigit();
			drawBorder();
		}
	}
	
}
