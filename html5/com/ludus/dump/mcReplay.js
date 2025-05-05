package com.ludus.dump {
	
	import com.GameLoop;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class mcReplay extends MovieClip {
		
		public function mcReplay() {
			// constructor code
			super();
			this.getChildByName("bReplay").addEventListener(MouseEvent.CLICK,goDungeon);
		}
		
		function goDungeon(e:Event):void {
			
			Global.ROOT_CLIP.gotoAndStop('startTheAdventure');
			Global.SOUNDMANAGER.playSound('pshift');
			
			Global.GAME.initGame();
			Global.GAME.reset();
			
			Global.PLAYER.resetPlayer();
			Global.GAMELOOP = new GameLoop(1000);
			
		}
	}
	
}

