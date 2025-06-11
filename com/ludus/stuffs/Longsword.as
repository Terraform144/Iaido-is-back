package com.ludus.stuffs {
	
	import flash.display.MovieClip;
	
	public class Longsword extends Arme {
		
		
		public var prop_attack:Object;
		public var prop_object:Object;
		
		public function Longsword(_id) {

			// constructor code
			
			super(_id);
			
			this.prop_attack = {push:20, hurl:20, smash:150, kiai:15};
			this.prop_object = {longueur:1.5, poids:2, solidite:20};
			this.tailleRatio = 1;
			
		}
		
		public function getProps() {
			
			return this.prop_attack;
			
		}
	}
	
}
