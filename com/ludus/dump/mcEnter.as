package com.ludus.dump {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.GameLoop;
	import flash.media.SoundMixer;
	
	
	public class mcEnter extends MovieClip {
		
		
		public function mcEnter() {
			// constructor code
			this.getChildByName("bEnter").addEventListener(MouseEvent.CLICK,goDungeon);
		}
		
		function goDungeon(e:Event):void {
			
			SoundMixer.stopAll();
			Global.ROOT_CLIP.gotoAndStop('startTheAdventure');
			Global.SOUNDMANAGER.playSound('pshift');
			
			Global.GAME.initGame();
			
			Global.PLAYER.resetPlayer();
			Global.GAMELOOP = new com.GameLoop(1000);
			
		}
	}
	
}
