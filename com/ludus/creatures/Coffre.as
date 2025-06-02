package com.ludus.creatures {
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Coffre extends Creature {

		public var stg = root as DisplayObject;
		public function Coffre(_id: String) {
			// constructor code
			super(_id);
			this.life = 150;
			
		}
		
	}
	
}
