package com.ludus.creatures {
	
	import flash.display.MovieClip;
	
	
	public class Lord_Khaos  extends Creature {
		
		public function Lord_Khaos(_id:String) {
			// constructor code
			super(_id);
			this.firstName = "Lord Khaos";
			this.life = 200;
			this.bite = {miss:0,soft:25,medium:50,hard:120};
		}
	}
	
}
