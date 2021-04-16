package com.ludus.stuffs  {
	
	import flash.display.MovieClip;
	
	public class Falchion extends Arme {
		
		/** var prop attack
			
		*/
		public var prop_attack:Object;
		public var prop_object:Object;
		
		public function Falchion(_id) {
			// constructor code
			
			super(_id);
			
			this.prop_attack = {quit:10, melee:15, swing:25, parry:15};
			this.prop_object = {longueur:0.60, poids:2.5, solidite:50};
			
		}
		
		public function getProps(){
			return this.prop_attack;
		}
	}
	
}
