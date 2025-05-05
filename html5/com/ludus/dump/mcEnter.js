class mcEnter extends MovieClip {
		
		mcEnter() {
			// constructor code
			this.getChildByName("bEnter").addEventListener(MouseEvent.CLICK,goDungeon);
		}
		
		goDungeon(e) {
			
			SoundMixer.stopAll();
			Global.ROOT_CLIP.gotoAndStop('startTheAdventure');
			Global.SOUNDMANAGER.playSound('pshift');
			
			Global.GAME.initGame();
			
			Global.PLAYER.resetPlayer();
			Global.GAMELOOP = new com.GameLoop(1000);	
		}
}
	