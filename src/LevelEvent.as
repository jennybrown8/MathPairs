package  {
	import flash.events.Event;
	
	public class LevelEvent extends Event {
		var level:uint;
		public static const CHOSEN = "LevelChosen";
		public static const ENDED = "LevelEnded";

		public function LevelEvent(type:String, bubbles:Boolean, cancelable:Boolean, level:uint) {
			super(type, bubbles, cancelable);
			this.level = level;
		}
		public function getLevel():uint {
			return level;
		}
		
		public override function clone():Event {
			return new LevelEvent(this.type, this.bubbles, this.cancelable, this.level);
		}

	}
	
}
