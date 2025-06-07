package com.ludus.stuffs {
	
	import flash.display.MovieClip;
	import com.Utx;
	import flash.display.BlendMode;
	
	public class MarieStatue extends Stuff {
		
		public function MarieStatue(_id:String, name:String = "MarieStatue") {
			// constructor code
			super(_id);
			
			Utx.disableTouch(this);
		}
		
	}
	
}
	