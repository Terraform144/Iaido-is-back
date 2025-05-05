package com.ludus.stuffs {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import com.msg_player;
	import com.Utx;

	
	public class wMap extends MovieClip {
		
		public function wMap() {
			// constructor code
			
			this.addEventListener(MouseEvent.CLICK, onclick);

		}
		
		public function onclick(evt) {
			
			try {
				
				Global.PLAYER.releaseWeapon(); Global.HandWeapon = null;
				Global.IS_COMBAT = false;
				Utx.repositionAfterPush(Global.CLICK_CREATURE);Global.CLICK_CREATURE = null;
				Global.ROOT_CLIP.gotoAndStop("startTheAdventure");
				
			} catch (error) {
				
				Global.debug_this("wMap clicked");
				Global.debug_this(error.toString());

			} finally {
				
				if(!Global.IS_MAP)
				{
					Global.IS_MAP = true;
					Global.PLAYER.l_hand.gotoAndStop("wMap");
				} else {
					Global.IS_MAP = false;
					Global.PLAYER.l_hand.gotoAndStop("free");
				}
				
			}
			
		}
	}
	
}
