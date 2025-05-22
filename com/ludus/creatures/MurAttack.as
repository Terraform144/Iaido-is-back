package com.ludus.creatures {
	
	import flash.display.MovieClip;
	
	
	public class MurAttack  extends Creature {
		
		public function MurAttack(_id:String) {
			// constructor code
			super(_id);
			this.firstName = "Mur Attack";
			this.life = 400;
			this.bite = {miss:0,soft:20,medium:40,hard:80};
		}
	}
}
