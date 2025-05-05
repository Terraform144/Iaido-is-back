package com.managers
{
	import com.ludus.creatures.Creature;

	public class CreaturesManager
	{
		public function CreaturesManager()
		{}
		
		public function releaseOnGrid(_creature:Creature)
		{
			// todo 
		}
		
		public static function removeFromGrid(_creature:Creature)
		{
			try{
				var mc = Global.map.getChildByName(Global.CLICK_CREATURE.id);
				Global.map.removeChild(mc);
				Global.CLICK_CREATURE = null;
			}catch (e) {
				trace("removeFromGrid: "+e);
			}
			
		}
		
	}
}