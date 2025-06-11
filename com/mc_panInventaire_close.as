package com
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class mc_panInventaire_close extends MovieClip
	{
		public function mc_panInventaire_close()
		{
			super();
			this.addEventListener(MouseEvent.CLICK,closeInventaire);
		}
		
		public function closeInventaire(e:Event):void 
		{
			try{
				
				Utx.hideInventaire();
				
			} catch(e:Error) {
				trace("Error closing inventory panel: " + e.message);
			}
		}
	}
}