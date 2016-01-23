package  {
	import flash.events.Event;
	
	public class PlayingAreaTileEvent extends Event {
		public static const SELECTED:String = "TileSelected";
		
		internal var tile:PlayingAreaTile;

		public function PlayingAreaTileEvent(type:String, bubbles:Boolean, cancelable:Boolean, tile:PlayingAreaTile) {
			super(type, bubbles, cancelable);
			this.tile = tile;
		}
		public function getTile():PlayingAreaTile {
			return tile;
		}
		
		public override function clone():Event {
			return new PlayingAreaTileEvent(this.type, this.bubbles, this.cancelable, this.tile);
		}

	}
	
}
