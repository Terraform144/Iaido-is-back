package com.ludus.cinematiques {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class murAttaque extends MovieClip {
		
		
		public function murAttaque() {
			
			addEventListener(Event.ENTER_FRAME, _stepDown_handle);
			
		}
		
		/**
         * Called on dispatch of Event.ENTER_FRAME
         */
        private function _stepDown_handle(e:Event):void
        {
			try{
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
