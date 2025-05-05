package com
{
	import flash.display.MovieClip;
	
	/**
	 * This class is the bottom messenger of the game that displays the interactions and actions of the user and evenements
	 * 
	 * todo: message must keep the color of the message and then pass to setMessage_2 to keep la continuité
	 */
	public class msg_player extends MovieClip
	{
		public function msg_player()
		{
			super();
			
			// disable the focus on scene
			this.mouseEnabled = false; this.enabled = false; this.tabEnabled = false;
			this.plr_msg_1.mouseEnabled = false;this.plr_msg_2.mouseEnabled = false;
		}
		
		public static function setMessage(_msg:String, _color=null)
		{
			if (_color) msg.plr_msg_1.backgroundColor = _color;
			var msg = Global.ROOT_CLIP.getChildByName("plr_msg");
			var message1 = msg.plr_msg_1.text;
			
			if(message1 == "")
				msg_player.setMessage_1(_msg);
			else
				msg_player.setMessage_2(_msg);
		}
		
		public static function setMessage_1(_msg:String) 
		{
			var msg = Global.ROOT_CLIP.getChildByName("plr_msg");
			msg.plr_msg_1.text = _msg;
		}
		
		public static function setMessage_2(_msg:String) 
		{
			var msg = Global.ROOT_CLIP.getChildByName("plr_msg");
			var msg_1 = msg.plr_msg_1.text;
			msg_player.setMessage_1(_msg);
			msg.plr_msg_2.text = msg_1;
		}
	}
}