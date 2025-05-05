package com.ludus.stuffs {
	
	import flash.display.MovieClip;
	import com.Utx;
	import flash.display.BlendMode;
	
	public class ray_plafond extends Stuff {
		
		public function ray_plafond(_id:String) {
			// constructor code
			super(_id);
			 
			(this as MovieClip).blendMode = "hardlight";
			
			Utx.disableTouch(this);
		}
		
	}
	
}
	