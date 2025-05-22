package com.ludus.creatures {
	
	import flash.display.MovieClip;
	
	
	public class Homme_poilu  extends Creature {
		
		public function Homme_poilu(_id:String) {
			// constructor code
			super(_id);
			
			this.life = 65;
			this.bite = {miss:0,soft:10,medium:15,hard:20};
		}
	}
	
}
