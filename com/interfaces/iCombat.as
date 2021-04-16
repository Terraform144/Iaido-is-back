package com.interfaces
{
	public interface iCombat
	{
		/*
			NOTA : 
		
				the creature can attack/defend the player or maybe other creatures
				--del in an attack, the creature strives till the end if determined
				--del the creature can be undetermined and escape the combat
				--del it is necessery to engage before combat anyway it is a throwing of object
		
				--todo this interface take all the combat properties to creature and player
				
		*/

		public function attack(entity):void; // 
		public function defend():Boolean; //
		public function impactCreature():void; //
		
	}
}