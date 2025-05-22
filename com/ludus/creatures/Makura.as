package com.ludus.creatures {
	
	import flash.display.MovieClip;
	import com.msg_player;
	
	public class Makura extends Creature {
		
		public function Makura(_id:String) {
			
			super(_id);
			
			this.firstName = 'Makura';
			this.life = 9999;
			this.bite = {miss:0, soft:5, medium:10, hard:15};
			
			// stats
			this.stats.intelligence *= 10;  // intelligence of makura
			this.stats.determination *= 5;	// determination
			
		}
		
	}
	
}
