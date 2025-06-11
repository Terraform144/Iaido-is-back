package com
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class pass_inventory extends MovieClip
	{
		public function pass_inventory()
		{
			super();
			this.addEventListener(MouseEvent.CLICK, onClick);

		}
		
		public function onClick(e:Event):void 
		{
			try {

				Global.PLAYER.setItem(Global.ITEM_CLICKED);
				this.removeChild(this.getChildAt(1));

			} catch (error:Error) {
				trace("Error handling inventory click: " + error.message);
			}
		}
	}
}