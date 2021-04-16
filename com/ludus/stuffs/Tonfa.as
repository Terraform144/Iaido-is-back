package com.ludus.stuffs  {
	
	import flash.display.MovieClip;
	
	public class Tonfa extends Arme {
		
		public var prop_attack:Object;
		public var prop_object:Object;
		
		public function Tonfa(_id) {
			// constructor code
			
			super(_id);
			
			this.prop_attack = {quit:5, prick:15, swing:25, parry:5};
			this.prop_object = {longueur:0.30, poids:1, solidite:25};
		}
		
		public function getProps(){
			return this.prop_attack;
		}
	}
	
}
