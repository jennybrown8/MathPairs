package  {
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	
	// Number tiles that are in the playing area have their game behaviors managed here.
	public class PlayingAreaTile extends NumberTile {
		internal var gridBlock:uint;
		internal var selected:Boolean = false;
		internal var border:Sprite;
		
		var UNSELECTED_BORDER = 0xB3A393;
		var SELECTED_BORDER =  0xFFFF33;
		var LINE_THICKNESS = 5;
		
		
		public function PlayingAreaTile(digit:uint, scale:Number) {
			super(digit, scale);
			border = new Sprite();
			addChild(border);
			drawBorder();
			addEventListener(MouseEvent.CLICK, onClick);
		}

		public function setGridBlock(i:uint) {
			this.gridBlock = i;
		}
		public function isSelected():Boolean {
			return selected;
		}
		public function deselect() {
			selected = false;
			drawBorder();
		}
		public function select() {
			selected = true;
			drawBorder();
		}

		public function calculatePlayingAreaPosition(playingAreaBox:PlayingAreaBox, xGridBlocks:uint, yGridBlocks:uint) {
			this.x = playingAreaBox.getLeftMargin( (xGridBlocks * 100) ) + ((gridBlock % xGridBlocks) * 100);
			this.y = playingAreaBox.getTopMargin( (yGridBlocks * 100) ) + (Math.floor(gridBlock / xGridBlocks) * 100);
		}
		
		public function onClick(event:MouseEvent) {
			selected = ! selected;
			drawBorder();
			// Since we have a border, and clicks might occur on it, convert any low-level click event
			// into a high level tile event, as early as possible. Higher level controllers will only
			// watch for the tile event.
			dispatchEvent(new PlayingAreaTileEvent(PlayingAreaTileEvent.SELECTED, true, true, this));
			//trace("Position " + gridBlock + " digit " + digit + " is now " + (selected ? "selected" : "off"));
		}
		public function drawBorder() {
			border.x = 0;
			border.y = 0;
			border.graphics.lineStyle(LINE_THICKNESS, selected ? SELECTED_BORDER : UNSELECTED_BORDER, 1, true);
			border.graphics.moveTo(0,0);
			border.graphics.lineTo(100, 0);
			border.graphics.lineTo(100, 100);
			border.graphics.lineTo(0, 100);
			border.graphics.lineTo(0, 0);
		}
	}
	
}
