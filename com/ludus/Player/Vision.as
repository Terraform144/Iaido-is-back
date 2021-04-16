package com.ludus.Player
{
	import com.msg_player;
	import com.ludus.creatures.Creature;

	/**
	 *  Cette gère la vue du joueur
	 * 
	 * idée 1: checker si dans la colonne des cases le player se voit directement sans obstructions et ensuite faire une vision ok ou false (ou
	 * peut-être plus subtile, un tableau/vecteur de cases que la creature peut directement arpenter... 
	 */
	public class Vision implements com.interfaces.iVision
	{
		private var firstCreature4Combat:Creature;
		
		public function Vision() 
		{
			// what do we see in here
		}
		
		public function See(eye:Player=null):void
		{
			
			var pl_coord = {l:1,c:1}; // todo change dynamically coordinates
			var all_opp = this.getAllOpponents(pl_coord);
			
		}
		
		private function setFirstOpponent4Combat(creatures:Vector.<Creature>)
		{
			this.firstCreature4Combat = creatures.pop();
			msg_player.setMessage((this.firstCreature4Combat.name+" fights you !");
		}
		
		private function getAllOpponents(coordinates:Object=null):Vector.<Creature>
		{
			// todo
		}
	}
}