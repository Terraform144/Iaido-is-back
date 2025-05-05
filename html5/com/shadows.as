package com
{
	import flash.display.MovieClip;
	
	public class shadows extends MovieClip
	{
		public function shadows()
		{
			super();
			
			this.init();
		}
		
		private function init() 
		{
			this.mouseEnabled = false; this.enabled = false; this.tabEnabled = false;
		}
	}
}