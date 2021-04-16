package com.ludus.stuffs {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import com.msg_player;
	
	
	public class mFiole extends MovieClip {
		
		public function mFiole() {
			// constructor code
			
			this.addEventListener(MouseEvent.CLICK, onclick);
		}
		
		public function onclick(evt) {
			Global.PLAYER.life += 50;
			
			this.visible = false;
			
			msg_player.setMessage(" life taken +50");
		}
	}
	
}
