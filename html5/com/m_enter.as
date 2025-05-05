package com
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class m_enter extends MovieClip
	{
		public var combat=false;
		public var stg = root as DisplayObject;
		public function m_enter()
		{
			super();
			
			this.getChildByName("b_enter").addEventListener(MouseEvent.CLICK,goDungeon);
		}
		
		function goDungeon(e:Event):void {
			
			if(stg.started!=true) {
				
				//Global.setNavVisible(false);
				stg.started = true;

				stg.gotoAndStop('startTheAdventure');
				
			}
		}
	}
}