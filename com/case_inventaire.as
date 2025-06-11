package com
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import fl.motion.Color;

	public class case_inventaire extends MovieClip
	{
		public function case_inventaire()
		{
			super();
			try {
				this.addEventListener(MouseEvent.CLICK, onClick);
			} catch (error:Error) {
				//
			}

		}
	
		public function onClick(e:Event):void 
		{
			try {
				Utx.flushInventory();
				if(this.alpha == 0.5) {
					this.alpha = 1;
				} else {
					this.alpha = 0.5;
				}
				
				Global.SELECTED_ITEM = this;				
//Global.PLAYER.setItem(this);
			
			} catch (error:Error) {
				trace("Error handling item click: " + error.message);
			}
		}
	}
}