package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	
	import flash.media.Sound; 
	import flash.media.SoundChannel; 
	import flash.net.URLRequest; 	

	// Runs a particular level with a know sum goal.
	public class LevelClip extends MovieClip {
		
		// at least one of gridx or gridy must be an even number, as their multiplication is 
		// then even, ie tiles have pairs.
		var GRIDX = 7;
		var GRIDY = 6;
		
		var sumDigit:uint;
		var sumController:SumController;
		var pairs:Array;
		var playingAreaBox:PlayingAreaBox;
		var tileCount:uint = (GRIDX * GRIDY);
		var tilesEliminated = 0;
		var tiles:Array;
		var tilesContainer:Sprite;
		
		var firstSelectedTile:PlayingAreaTile;
		var secondSelectedTile:PlayingAreaTile;
		var click:ClickSound = new ClickSound();
		var successSound:SuccessPianoSound = new SuccessPianoSound();
		

		public function LevelClip() {
			this.playingAreaBox = new PlayingAreaBox();
			this.sumController = new SumController();
			this.tilesContainer = new Sprite();
			beginLevel(MathPairs.game.getCurrentLevel());
		}
		private function reset() {
			this.tilesEliminated = 0;
			this.pairs = new Array();
			this.tiles = new Array();
			this.firstSelectedTile = null;
			this.secondSelectedTile = null;
			this.tilesContainer.removeChildren();
		}

		public function beginLevel(sumDigit:uint) {
			reset();
			
			this.sumDigit = sumDigit;
			
			sumController.setDigit(sumDigit);
			sumController.addChildren(tilesContainer);

			//trace("Generating Level for sum = " + sumDigit);
			
			pairs = generatePairs();

			var tempTile:PlayingAreaTile;
			for (var i:uint = 0; i < tileCount; i++) {
				tempTile = new PlayingAreaTile(pairs[i], 0.94);
				tempTile.setGridBlock(i);
				tempTile.calculatePlayingAreaPosition(playingAreaBox, GRIDX, GRIDY);
				tempTile.showDigit();
				tiles[i] = tempTile;
				tilesContainer.addChild(tempTile);
			}
			stage.addChild(tilesContainer);
			stage.addEventListener(PlayingAreaTileEvent.SELECTED, onTileSelected);
			tilesContainer.visible = true;
		}

		private function generatePairs():Array {
			var scrambledPairs = new Array();
			var orderedPairs = new Array();

			// build each pair of addends that makes up sum.
			// build an appropriate number of tiles to fit our grid.
			var randomIndex:uint;
			var index:uint = 0;
			for (var i:uint = 0; i < (tileCount / 2); i++) {
				// range of more than the target sum, then -1, so we can get targetSum+zero in the set.
				randomIndex = Math.ceil(Math.abs(Math.random() * (sumDigit+0.5))) -1;
				orderedPairs[index++] = randomIndex; // add the desired number
				orderedPairs[index++] = (sumDigit - randomIndex); // and its matching pair
			}
			//trace("Pairs ordered are: " + orderedPairs);
			
			// but those are all in order, so now we need to scramble them.
			index = 0;
			for (i = 0; i < tileCount; i++) {
				randomIndex = Math.abs(Math.random() * orderedPairs.length);
				scrambledPairs[index++] = orderedPairs[randomIndex];
				orderedPairs.splice(randomIndex, 1);
			}
			//trace("Pairs scrambled are: " + scrambledPairs);
			return scrambledPairs;
		}
		
		private function updateSelectedTiles(clickedTile:PlayingAreaTile) {
			if (clickedTile == null) { 
				return;
			}
			
			if (firstSelectedTile == null) {
				firstSelectedTile = clickedTile;
				clickedTile.select();
				return;
			}
			if (clickedTile == firstSelectedTile) {
				firstSelectedTile.deselect();
				firstSelectedTile = null;
				return;
			}
			if (secondSelectedTile == null) {
				secondSelectedTile = clickedTile;
				return;
			}
		}
		private function validateSelectedTiles() {
			// Now validate the model result. If the user picked two tiles, check if their digits add up to the sum.
			if ((firstSelectedTile != null) && (secondSelectedTile != null)) {
				if (sumDigit == firstSelectedTile.getDigit() + secondSelectedTile.getDigit()) {
					firstSelectedTile.visible = false;
					secondSelectedTile.visible = false;
					firstSelectedTile = null;
					secondSelectedTile = null;
					tilesEliminated+=2;
					// and play successful-match sound.
					var channel:SoundChannel = click.play();			
				} else {
					secondSelectedTile.deselect();
					secondSelectedTile = null;
				}
			}
			
		}

		public function onTileSelected(event:PlayingAreaTileEvent) {
			updateSelectedTiles(event.getTile());
			validateSelectedTiles();
			if (tilesEliminated == tileCount) {
				onLevelWon();
			}
		}
		
		public function onSuccessPlaybackComplete(event:Event) 
		{ 
			this.tilesContainer.visible = false;
			reset();
			dispatchEvent(new LevelEvent(LevelEvent.ENDED, true, true, sumDigit));
		}			
		
		public function onLevelWon() {
			var channel:SoundChannel = successSound.play();
			channel.addEventListener(Event.SOUND_COMPLETE, onSuccessPlaybackComplete); 
		}

	}
	
}
