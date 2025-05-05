package com.ludus.stuffs 
{
	/**
	 * ...
	 * @author zulad
	 */
	public class Hands extends Arme
	{
		
		public var prop_attack:Object;
		public var prop_object:Object;
		
		public function Hands (_id="left") {
			
			super(_id);
			this.prop_attack = {push:0, kick:3, hit:5, kiaï:2};
			this.prop_object = {longueur:0.1, poids:0, solidite:3};
			this.tailleRatio = 1;
			
		}
		
		public function getProps() {
			
			return this.prop_attack;
			
		}
		
	}

}