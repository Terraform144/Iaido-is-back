package com.ludus.cinematiques {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class open_door extends MovieClip {
		
		public function open_door() {
			
			addEventListener(Event.ENTER_FRAME, _opnDoor_handle);
			
		}
		
		/**
         * Called on dispatch of Event.ENTER_FRAME
         */
        private function _opnDoor_handle(e:Event):void
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
