package com.ludus.dump {
	
	import com.GameLoop;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.ludus.cinematiques.intro_movie;

	public class mcReplay extends MovieClip {
		

		public function mcReplay() {
			
			// constructor code
			super();
			this.getChildByName("bReplay").addEventListener(MouseEvent.CLICK,goDungeon);
		}
		
		public function goDungeon(e:Event):void {
//Global.CINEMATIQUE = Global.ROOT_CLIP.getChildByName("dmy_anim");
			
			Global.ROOT_CLIP.gotoAndStop('startTheAdventure');
			Global.SOUNDMANAGER.playSound('pshift');

			// start a random flashback animation
//var intro_cinema = new intro_movie();
//Global.CINEMATIQUE.addChild(intro_cinema);

			Global.GAME.initGame();
			Global.GAME.reset();
			
			Global.PLAYER.resetPlayer();
			Global.GAMELOOP = new GameLoop(1000);

		}
	}
	
}

