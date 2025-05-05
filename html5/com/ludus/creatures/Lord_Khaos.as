package com.ludus.creatures {
	
	import flash.display.MovieClip;
	
	
	public class Lord_Khaos  extends Creature {
		
		public function Lord_Khaos(_id:String) {
			// constructor code
			super(_id);
			
			this.life = 200;
			this.bite = {miss:0,soft:45,medium:100,hard:250};
		}
	}
	
}
