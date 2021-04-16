package com.ludus.stuffs  {
	
	import flash.display.MovieClip;
	
	public class Baton extends Arme
	{
		
		public var prop_attack:Object;
		public var prop_object:Object;
		
		public function Baton(_id) {
			// constructor code
			
			super(_id);
			
			this.prop_attack = {push:5, sting:20, smash:30, block:10};
			this.prop_object = {longueur:0.8, poids:2, solidite:20};
			this.tailleRatio = 1.5;
		}
		
		public function getProps() {
			
			return this.prop_attack;
			
		}
		
	}
	
}
