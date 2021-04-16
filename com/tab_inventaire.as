package com
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	/**
	 * cette classe est le tableau d'inventaire visible depuis le labyrinthe
	 */
	public class tab_inventaire extends MovieClip
	{
		
		public function tab_inventaire()
		{
			super();
			this.addEventListener(MouseEvent.CLICK, goInventaire);
		}
		
		public function goInventaire(e:Event):void 
		{
			try{
				var p_inv = Global.ROOT.getChildByName("pan_inventaire");
				
				var mc_fiole = Global.ROOT.getChildByName("mc_fiole");
				//var mc_book = Global.ROOT.getChildByName("mc_book");
				var mc_close = Global.ROOT.getChildByName("mc_close");
				var tab_inv = Global.ROOT.getChildByName("tab_inventaire");
				var b_hero = Global.ROOT.getChildByName("bar_level_hero");
				// inventory item visibility toggle
				if(Global.isInventaire) {
					p_inv.visible=false;Global.isInventaire=false;
					mc_fiole.visible = true; this.visible = true; tab_inv.visible = true; b_hero.visible = true;
				} else {
					p_inv.visible = true; Global.isInventaire = true; tab_inv.visible = false;
					mc_fiole.visible = false; this.visible = false; b_hero.visible = false;
				}
			}catch (e:Error) {}
			
		}
	}
}