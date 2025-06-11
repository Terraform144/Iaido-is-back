package com.ludus.stuffs {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import com.msg_player;
	
	public class mFiole extends Stuff {
		
		public function mFiole(_id) {
			super(_id);
			this.id = _id;
			// constructor code
			this.addEventListener(MouseEvent.CLICK, onclick);
		}
		
		public function onclick(evt) {
			if(Global.PLAYER.life < 800 ) {
				Global.PLAYER.life += 150;
				Global.SOUNDMANAGER.playSound('potion');
				this.parent.removeChild(this);
				msg_player.setMessage(" life taken +150");
			} else {
				msg_player.setMessage("You are already at full life");
			}
		}
	}
	
}
