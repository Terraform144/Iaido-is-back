package com.ludus.creatures {
	
	import flash.display.MovieClip;
	
	
	public class Homme_poilu  extends Creature {
		
		public function Homme_poilu(_id:String) {
			// constructor code
			super(_id);
			
			this.life = 65;
			this.bite = {miss:0,soft:25,medium:50,hard:75};
		}
	}
	
}
