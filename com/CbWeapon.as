package com {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	public class CbWeapon extends MovieClip {
		
		public function CbWeapon() {
			// constructor code
//trace("cbWeapon");
			
			this.addEventListener(MouseEvent.CLICK, this.showCombat_panel);
		}
		
		public function showCombat_panel(e:Event) {
//trace("showCombat_panel");
		}
	}
}
