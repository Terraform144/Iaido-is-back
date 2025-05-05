package com
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class mc_close extends MovieClip
	{
		public function mc_close()
		{
			super();
			this.addEventListener(MouseEvent.CLICK,goInventaire);
		}
		
		public function goInventaire(e:Event):void 
		{
			try{
				
				var p_inv = Global.ROOT.getChildByName("pan_inventaire");
				var mc_fiole = Global.ROOT.getChildByName("mc_fiole");
				//var mc_book = Global.ROOT.getChildByName("mc_book");
				var mc_inv = Global.ROOT.getChildByName("tab_inventaire");
				var b_hero = Global.ROOT.getChildByName("bar_level_hero");
				
				// inventory item visibility toggle
				if(Global.isInventaire) {
					p_inv.visible=false;Global.isInventaire=false;
					mc_fiole.visible=true;mc_inv.visible = true;b_hero.visible = true;
				} else {
					p_inv.visible=true;Global.isInventaire=true;
					mc_fiole.visible=false;mc_inv.visible = false;b_hero.visible = false;
				}
				
			}catch(e:Error) {
				
			}
			
		}
	}
}