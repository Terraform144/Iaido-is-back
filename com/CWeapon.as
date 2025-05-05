package com {
	
	import com.ludus.stuffs.Baton;
	import com.ludus.stuffs.Hands;
	import flash.utils.getQualifiedClassName;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import fl.motion.Color;	
	
	public class CWeapon extends MovieClip 
	{
		public var wpn;
		public var wp= Global.ROOT_CLIP.getChildByName("weapon_panel");
		
		public function CWeapon()
		{
			if (Global.HandWeapon != null) {
				wpn = Global.HandWeapon;
			} else {
				wpn = new Hands("left");
			}
			
			this.wp.setPropList(this.wpn.prop_attack);
			
			Global.Lab.hideCursors();
			this.addEventListener(MouseEvent.CLICK, this.showCombat_panel);
		}
		
		public function tintWBlue() 
		{
			var c:Color = new Color();
			c.setTint(0x990000,1);
			this.wpn.transform.colorTransform = c;
		}
		
		public function tintWBlack() 
		{
			var c:Color = new Color();
			c.setTint(0x000000,1);
			this.wpn.transform.colorTransform = c;
		}
		
		public function showCombat_panel(e:Event) 
		{
			var l_hand = Global.ROOT_CLIP.getChildByName("l_hand");
			l_hand.getChildByName("burst").visible = false;
			this.wp.setPropList(this.wpn.prop_attack);
		}
			
		public function setWpn(_wpn){
			this.wpn = _wpn;
		}
		
		public function getWpn(){
			return this.wpn;
		}
	}
}
