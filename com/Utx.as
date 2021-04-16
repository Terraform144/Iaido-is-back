﻿package com
{
	import com.ludus.creatures.Creature;
	import com.ludus.stuffs.Stuff;
	import flash.display.MovieClip;
	
	import flash.display.ColorCorrection;
	
	import avmplus.*;
	import fl.motion.Color;
	
	public class Utx
	{
		
		public function Utx()
		{}
		
		public static function rnd(minLimit:uint, maxLimit:uint):uint 
		{
			var range:uint = maxLimit - minLimit;
			
			return Math.ceil(Math.random()*range) + minLimit;
		}
		
		public static function isStr(touch, str):Boolean
		{
			for each(var tch:String in touch) 
			{
				if(str.indexOf(tch) >= 0){
					return true;
				}
			}
			return false;
		}
			
		public static function isMassive(str):Boolean
		{
			return Utx.isStr(["stair","_d"], str);
		}
		
		public static function setTintMc(mc, c:Color)
		{
			mc.transform.colorTransform = c;
		}
		
		public static function setFrame(_number:int, mc)
		{
			var r = Utx.rnd(0, _number);
			mc.gotoAndStop(r);
		}
		
		public static function getClassName(name:String):String 
		{
			var substr = name.split("::"); substr = substr[0].split(".");
			return substr[2];
		}
		
		public static function isLabel(mc, value) 
		{
			return mc.currentFrameLabel == value;
		}
		
		public static function freezeCombatPanel(status:Boolean)
		{
			var wp = Global.ROOT_CLIP.getChildByName("weapon_panel");
			wp.mouseEnabled = !status; wp.mouseChildren = !status;
			var c:Color = new Color();
			if (!status)
			{
				c.setTint(0x00CCFF, 1);
			} else {
				c.setTint(0x666666, 1);
			}
			Utx.setTintMc(wp, c);
		}
		
		public static function getLittleClassName(_name:String)
		{
			var name =  _name.split("::");
			return name[1];
		}
		
		public static function disableTouch(mc) {
			
			try{
				
				mc.mouseEnabled = false; 
				mc.enabled = false; 
				mc.tabEnabled = false;
				mc.mouseChildren = false;
				
			}catch (e:Error) {
				//
			}
			
		}	
		
		public static function analyze(_obj):void {
			var item:Object;
			switch (typeof(_obj)){
				case "object":
					Utx.write("<object>");
					Utx.write(_obj.toString() + "//" + getQualifiedSuperclassName(_obj));
					for each (item in _obj){
						Utx.analyze(item);
					};
					Utx.write("</object>");
				break;
				case "xml":
					Utx.write("<xml>");
					Utx.write(_obj);
					Utx.write("</xml>");
				break;
				default:
					Utx.write(_obj + " (" + typeof(_obj) + ")");
				break;
			};
		}
		
		public static function write(_obj):void{
			trace(_obj);
		}
		
		public static function isAmbiance(_obj) {
			
			var val:Boolean = false;
			switch (getQualifiedClassName(_obj)) {
				
				case 'com.ludus.stuffs::ray_plafond':
					val = true;
					break;
					
			}
			
			return val;
		}
		
		public static function isDmy(_obj) {
			
			var val:Boolean = false;
			switch (getQualifiedSuperclassName(_obj)) {
				
				case 'com.ludus.stuffs::Door':
					val = true;
					break;
				case 'com.ludus.stuffs::Stairs':
					val = true;
					break;
			}
			
			return val;
		}
		
		public static function isInFront(_obj) {
			
			return (_obj.parent.name == 'dmy_g_m_1') ? true : false;
			
		}
		
		public static function repositionCreature(coord:Object, _creature:Creature) {
			
			_creature.setCoordinates(coord.l, coord.c); _creature.updatePositionOnMap();
			
		}
		
		public static function repositionAfterPush(_crea:Creature) {
			
			// todo
			var _actualCoordinates:Object = _crea.getCoordinates();
			
			var _newCoordinates:Object;
			
			switch(Global.Lab.orientation) {
				case 'top': 
					_newCoordinates = {"l":_actualCoordinates.l, "c":( _actualCoordinates.c+1)};
					break;
				case 'left':
					_newCoordinates = {"l": (_actualCoordinates.l-1) , "c":_actualCoordinates.c};
					break;
				case 'right': 
					_newCoordinates = {"l": (_actualCoordinates.l+1) , "c":_actualCoordinates.c};
					break;
				case 'bottom':
					_newCoordinates = {"l":_actualCoordinates.l, "c":( _actualCoordinates.c-1)};
					break;
			}
			
			if (Global.Lab.dl.caseExploitable(_newCoordinates, _crea)) {
				
				repositionCreature(_newCoordinates, _crea);
				
			}
		}
	}
}