package com.ludus.creatures {
	
	import flash.display.MovieClip;
	
	
	public class Annie  extends Creature {
		
		public function Annie(_id:String) {
			// constructor code
			super(_id);
			
			this.life = 60;
			this.bite = {miss:0,soft:25,medium:50,hard:75};
		}
	}
	
}
