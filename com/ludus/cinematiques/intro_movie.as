package com.ludus.cinematiques {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class intro_movie extends MovieClip {
		
		public function intro_movie() {
			
			addEventListener(Event.ENTER_FRAME, _intro_movie_handle);
			
		}
		
		/**
         * Called on dispatch of Event.ENTER_FRAME
         */
        private function _intro_movie_handle(e:Event):void
        {
			try {
				if(currentFrame == totalFrames)
				{
					this.parent.removeChild(this);
				}
			} catch (e:Error) {
//trace(_stepDown_handle+" : " + e);
			}
        }
	}

}