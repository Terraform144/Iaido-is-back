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
				if(Global.SELECTED_ITEM.name.indexOf("case_i_") != -1) {
					// pass the item to the "Sac de Iaido"
					Global.ROOT_CLIP.getChildByName("pan_inventaire").visible = true;
					Global.PLAYER.setItem(Global.SELECTED_ITEM);
				}
				
			} catch (error:Error) {
				trace("Error handling inventory click: " + error.message);
			}
		}
	}
}