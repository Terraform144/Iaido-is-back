package com.ludus.creatures {
	
	import flash.display.MovieClip;
	
	
	public class Bouclio extends Creature {
		
		
		public function Bouclio(_id:String) {
			// constructor code
			super(_id);
			
			this.life = 65;
			this.bite = {miss:0,soft:25,medium:50,hard:75};
		}
	}
	
}
