package com 
{
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;

	public class bar_level_hero extends MovieClip {
		
		public function bar_level_hero() {
			super();
			this.addEventListener(MouseEvent.CLICK, goCredits);
		}

		public function goCredits(e:Event):void {
			Global.ROOT_CLIP.gotoAndStop("game_credits");
		}
	}

}
