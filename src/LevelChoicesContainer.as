package 
{

	import flash.events.MouseEvent;
	import flash.display.Sprite;
	class LevelChoicesContainer extends Sprite
	{
		var levelChoiceBox:LevelChoiceBox;

		function LevelChoicesContainer()
		{
			levelChoiceBox = new LevelChoiceBox();

			var tempTile:LevelChoiceTile;
			for (var i:uint = 0; i <= levelChoiceBox.MAX_LEVEL; i++)
			{
				tempTile = new LevelChoiceTile(i,levelChoiceBox.calculateBestScale(5));
				tempTile.setGridBlock(i);
				tempTile.calculatePlayingAreaPosition(levelChoiceBox);
				tempTile.showDigit();
				addChild(tempTile);
			}
			visible = false;
		}
		public function show()
		{
			this.visible = true;
		}
		public function hide()
		{
			this.visible = false;
		}
	}
}