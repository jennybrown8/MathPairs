package 
{
	import flash.display.*;
	
	// Game logic to handle matching pairs and displaying the goal (sum) 
	// on the upper right.
	public class SumController
	{
		var SCALE:Number = 1.8;
		var sumTile:SumTile;
		var sumAreaBox:SumAreaBox;
		var digit;

		public function SumController()
		{
			digit = 1;
			sumTile = new SumTile(digit, SCALE);
			sumAreaBox = new SumAreaBox();

			sumTile.calculateSumAreaPosition(sumAreaBox);
		}
		public function addChildren(displayContainer:Sprite)
		{
			displayContainer.addChild(sumTile);
			sumTile.showDigit();
		}
		public function setDigit(digit:uint)
		{
			this.digit = digit;
			sumTile.setDigit(digit);
			sumTile.showDigit();
		}

	}

}