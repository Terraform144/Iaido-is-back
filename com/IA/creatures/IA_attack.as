package com.IA.creatures
{
	import com.ludus.creatures.Creature;
	import flash.display.MovieClip;
	
	public class IA_attack extends MovieClip
	{
		public function IA_attack()
		{
			//TODO: implement function
			super();
		}
		
		/**
		 * in iVision <- must displace the related methods
		 * if creature see player, charge and attack agressively
		 * 
		 * --> charge, then when in proximity : strike the player
		 * 
		 */
		
		public function attack(who:Creature=null) {
			// toremake attack -> passer par la vision
			
			try {
				for each (var creature:Creature in Global.EVENEMENTS.monTableauDeCreatures) 
				{
					// creature attack 
					if(creature.life > 0) creature.attack();
				}
			} catch (e:Error) {
				trace ("attack: "+e);
			} finally {
				//
			}
		}
	}
}