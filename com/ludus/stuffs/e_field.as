package com.ludus.stuffs {
	
	import flash.display.MovieClip;
	import com.Utx;
	import flash.display.BlendMode;
	
	public class e_field extends Stuff {
		
		
		public function e_field(_id:String) {
			super(_id);
			 
			(this as MovieClip).blendMode = "darken";
			
			Utx.disableTouch(this);
		}
	}
	
}
