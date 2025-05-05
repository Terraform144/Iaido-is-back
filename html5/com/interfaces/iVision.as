package com.interfaces
{
	import com.ludus.creatures.Creature;
	
	public interface iVision
	{
		/**
		 * this examine and gets all the objects of the environment
		 */
		public function See(eye:Player=null):void;
		private function setFirstOpponent4Combat():Creature;
		private function getAllOpponents(coordinates:Object=null):Vector.<Creature>;
	}
	
}