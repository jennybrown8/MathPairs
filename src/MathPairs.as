package
{
	import flash.events.Event;
	import flash.events.MouseEvent;

	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	
	public class MathPairs extends MovieClip
	{
		static var game:MathPairs;
		
		const SCREEN_LEVEL_CHOOSER:uint = 1;
		const SCREEN_PLAY_LEVEL:uint = 3;
		
		var levelChoicesContainer:LevelChoicesContainer;
		var currentLevel;
		
		public function MathPairs()
		{
			MathPairs.game = this;
			levelChoicesContainer = new LevelChoicesContainer();
			stage.addChild(levelChoicesContainer);
			stage.addEventListener(LevelEvent.CHOSEN, onLevelChosen);
			stage.addEventListener(LevelEvent.ENDED, onLevelEnded);
			chooseLevel();
		}
		
		public function chooseLevel() {
			drawBackdrop(SCREEN_LEVEL_CHOOSER);
			levelChoicesContainer.show();
		}
		public function getCurrentLevel():uint {
			return currentLevel;
		}
		
		public function onLevelChosen(event:Event) {
			if (! event.type == LevelEvent.CHOSEN) {
				return;
			}
			currentLevel = (event as LevelEvent).getLevel();
			levelChoicesContainer.hide();
			drawBackdrop(SCREEN_PLAY_LEVEL);
		}
		public function onLevelEnded(event:Event) {
			if (! event.type == LevelEvent.CHOSEN) {
				return;
			}
			var le:LevelEvent = event as LevelEvent;
			
			chooseLevel();
		}
		
		private function drawBackdrop(screen:uint) {
			gotoAndStop(screen);
		}

	}
}
