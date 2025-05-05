package  com {
	
	import com.ludus.stuffs.Hands;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import com.ludus.stuffs.Baton;
	import flash.utils.getQualifiedClassName;
	
	public class iBaton extends MovieClip {
		
		public function iBaton() {
			// constructor code
			
			this.addEventListener(MouseEvent.CLICK, onclick);
		}
		
		public function onclick(evt) {
			
			if (this.alpha < 1) {
				var l_hand = Global.ROOT_CLIP.getChildByName("l_hand");
				var lastweapon:Hands = new Hands(); Global.HandWeapon = lastweapon;
trace("Global.HandWeapon: " + Global.HandWeapon);
				if(getQualifiedClassName(Global.HandWeapon) != "com.ludus.stuffs::Objet_baton") {
					Global.PLAYER.relacher(Global.HandWeapon);
trace("Global.HandWeapon: " + Global.HandWeapon);
				}
				Global.PLAYER.prendre(lastweapon);l_hand.gotoAndStop("free");
				this.alpha = 1;
			} else {
trace("Global.HandWeapon: " + Global.HandWeapon);
				if(getQualifiedClassName(Global.HandWeapon) != "com.ludus.stuffs::Objet_baton") {
					Global.PLAYER.relacher(Global.HandWeapon);
trace("Global.HandWeapon: " + Global.HandWeapon);
				}
				Global.PLAYER.prendre(new Baton('baton'),true);

				this.alpha = 0.5;
			}
			
			try {
				
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
				
			} catch(e:Error) {
				
			}
			
		}
		
	}
	
}
