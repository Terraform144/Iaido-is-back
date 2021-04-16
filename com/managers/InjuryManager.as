package com.managers
{
	import com.ludus.creatures.Araignee;
	import com.Utx;
	
	public class InjuryManager
	{
		public function InjuryManager()
		{
			/*
				This class takes all the throwing of dice regarding the injuries on combats
				-> for exemple =>
			
					Player fight the creature / Jet de détermination et jet de puissance en fonction de la force
						envoit du coup /(parade %)/ <- %100 x (100-Pourcentage)
						<- déduction des points de vie sur creature
			*/
			
			
		}
		
		/** 
		 * !!!!!! REFAIRE COMBAT MODULE FOR INJURIES FONCTION CREATURES/CHANCE/DETERMINATION
		 * 
		 * @param	power
		 */
		public static function getInjury (power) 
		{
			// en fonction de la détermination de la puissance peur folie, le résultat est différent

			var damage = InjuryManager.strikePower(power);
			switch (Utx.rnd(0, 5)) {
				case 0:
					damage = 0; break;
				case 1:
					damage = 1 + Utx.rnd(0,5); break;
				case 5:
					if( Utx.rnd(1,10) > 9 )
						damage *= 2;
						
					break;
			}

			
			return damage;
		}
		
		public static function strikePower (damage)
		{
			var divider = Utx.rnd(1, 3);
			
			return (damage / divider) + Utx.rnd(0,20);
		}
	}
}