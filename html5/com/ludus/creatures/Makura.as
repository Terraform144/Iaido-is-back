package com.ludus.creatures {
	
	import flash.display.MovieClip;
	import com.msg_player;
	
	public class Makura extends Creature {
		
		public function Makura(_id:String) {
			
			super(_id);
			
			this.firstName = 'Makura';
			this.life = 999;
			this.bite = {miss:0, soft:25, medium:50, hard:75};
			
			// stats
			this.stats.intelligence *= 10;  // intelligence of makura
			this.stats.determination *= 5;	// determination
			
		}
		
	}
	
}
