package com
{

	import com.ludus.Player;
	import com.ludus.stuffs.Hands;
	import com.managers.CombatManager;
	import com.managers.SoundManager;
	import flash.display.MovieClip;
	import flash.utils.getQualifiedClassName;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Game extends Sprite
	{
		public function Game() {
			
			Global.GAME = this; this.initGame();
			
			// [Ø] TODEL
			Global.TESTING = new Testing();
			// [Ø] END OF TODEL
			
			// debug msg intro
			Global.debug_this("This is version 0.4 of IIB");
			Global.SOUNDMANAGER.playSound('melodie_IIB_flute',3);
			
		}
		
		public function reset()
		{
			Global.ROOT.getChildByName('pan_inventaire').visible = false;
		}
		
		public function initGame() {
			
			Global.numLevel = 1; // to check
			Global.PLAYER = new Player();
			Global.COMBATMANAGER = new CombatManager();
			Global.SOUNDMANAGER = new SoundManager();
			
			// init correct values
			Global.HandWeapon = new Hands("left");
			if (Global.EVENEMENTS != null) {
				Global.score = 0;
				Global.EVENEMENTS.loadCreatures(Global.numLevel);
				Global.EVENEMENTS.loadStuffs(Global.numLevel);
			}
		}
		
	}
}