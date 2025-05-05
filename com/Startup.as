package com
{

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.getQualifiedClassName;
	
	public class Startup extends MovieClip
	{
		public function Startup()
		{
			super();
			Global.ROOT_CLIP = this;
			//
			new Game();
			
//stage.addEventListener(MouseEvent.CLICK, this.onClick);
			
			
		}
	
		private function onClick(event:MouseEvent):void
		{	
//trace("clicktarget: ", event.target.name, flash.utils.getQualifiedClassName(event.target));
		}
	}
}