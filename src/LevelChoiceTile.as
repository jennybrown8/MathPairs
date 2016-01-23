package  {
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	
	// Number tiles used for choosing a level to play.
	public class LevelChoiceTile extends NumberTile {
		internal var gridBlock:uint;
		internal var border:Sprite;
		
		var UNSELECTED_BORDER = 0xB3A393;
		var LINE_THICKNESS = 5;
		
		public function LevelChoiceTile(digit:uint, scale:Number) {
			super(digit, scale);
			border = new Sprite();
			addChild(border);
			addEventListener(MouseEvent.CLICK, onClick);
			drawBorder();
		}

		public function setGridBlock(i:uint) {
			this.gridBlock = i;
		}

		public function calculatePlayingAreaPosition(levelChoiceBox:LevelChoiceBox) {
			this.x = levelChoiceBox.getColumnXPos(levelChoiceBox.calculateColumn(gridBlock));
			this.y = levelChoiceBox.getRowYPos(levelChoiceBox.calculateRow(gridBlock));
			drawBorder();
		}
		
		public function onClick(event:MouseEvent) {
			dispatchEvent(new LevelEvent(LevelEvent.CHOSEN, true, true, digit));
		}
		public function drawBorder() {
			border.x = 0;
			border.y = 0;
			border.graphics.lineStyle(LINE_THICKNESS, UNSELECTED_BORDER, 1, true);
			border.graphics.moveTo(0,0);
			border.graphics.lineTo(100, 0);
			border.graphics.lineTo(100, 100);
			border.graphics.lineTo(0, 100);
			border.graphics.lineTo(0, 0);
		}
	}
	
}
