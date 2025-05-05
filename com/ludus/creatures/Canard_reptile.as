package com.ludus.creatures {
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Canard_reptile extends Creature {

		public var stg = root as DisplayObject;
		public function Canard_reptile(_id: String) {
			// constructor code
			super(_id);
			this.life = 100;
		
		}
		
	}
	
}
