package com
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class mc_menu extends MovieClip
	{
		public function mc_menu()
		{
			super();
			this.addEventListener(MouseEvent.CLICK,goMenu);
		}
		
		private function goMenu(e:Event):void {
			var p_menu = Global.ROOT.getChildByName("pan_menu");
			var p_inv = Global.ROOT.getChildByName("pan_inventaire");
			var b_hero = Global.ROOT.getChildByName("bar_level_hero");
			
			// inventory item visibility toggle
			if(Global.isMenu) {
				Global.isMenu=false;Global.setNavVisible(true);
				p_menu.visible = false; b_hero.visible = false;
			} else {
				Global.isMenu=true;Global.setNavVisible(false);
				p_menu.visible = true; b_hero.visible = true; p_inv.visible = false;
			}
		}
	}
}