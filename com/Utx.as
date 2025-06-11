package com
{
	import com.ludus.creatures.Creature;
	import com.ludus.stuffs.Stuff;

	import com.ludus.stuffs.mFiole;
	import com.ludus.stuffs.Baton;
	import com.ludus.stuffs.Falchion;
	import com.ludus.stuffs.Longsword;
	import com.ludus.stuffs.Tonfa;
	import com.ludus.stuffs.wMap;

	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import flash.display.ColorCorrection;
	
	import flash.display.DisplayObjectContainer;
	import avmplus.*;
	import fl.motion.Color;
	// pixelate a MovieClip
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.geom.Matrix;

	public class Utx
	{
		
		public function Utx()
		{}
		
		/** THIS IS THE LIST OF THE MASSIVE OBJECTS ENCOUNTERED IN THE LABYRINTH */
		private static var massiveObjectList:Array = ["_d","stair", "statue"];

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
		
		public static function flushInventory():void {

            var p_inv_alter = Global.ROOT_CLIP.getChildByName("pan_inventaire_alter");

            try {
                for(var i= 0; i < 10; i++) {

                    p_inv_alter.getChildByName("case_i_"+i).alpha = 1;
					p_inv_alter.getChildByName("case_i_"+i).visible = true;
                }
            } catch (e:Error) {
                trace("Error displaying inventory panel: " + e.message);
            }
        }

		public static function removeAllChildren(parent:DisplayObjectContainer):void {

			var childrenToRemove:Array = [];
			parent.alpha = 1;
			for (var i:int = 0; i < parent.numChildren; i++) {
				childrenToRemove.push(parent.getChildAt(i));
			}
			
			for each (var child:DisplayObject in childrenToRemove) {
				if (child is MovieClip) {
					parent.removeChild(child);
				}
			}
		}

		public static function cleanArray(arr:Array):Array
		{ /* CLEAN AN ARRAY FROM NULL VALUES */
			var newArr:Array = [];
			for each (var item:* in arr) {
				if ((item != null) && (item != undefined) && (item != "")) {
					newArr.push(item);
				}
			}
			return newArr;
		}

		public static function hideInventaire():void
		{
			try {
				var p_inv_alter = Global.ROOT_CLIP.getChildByName("pan_inventaire_alter");
				p_inv_alter.visible = false;
			} catch (e:Error) {
				trace("Error hiding inventory panel: " + e.message);
			}
		}

		public static function isMassive(str):Boolean
		{
			return Utx.isStr(massiveObjectList, str);
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
			
			try{
				var bool:Boolean =  ((_obj.parent.name == 'dmy_g_m_1') || (_obj.parent.name == 'g_m_0') ) ? true : false;
			}catch (e:Error) {
				bool = false;
			}
			
			return bool;
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

		public static function get_objectByName(str:String)
		{
			var obj:Stuff;
			switch (str){
				
				case "mFiole":
					trace(str)
					obj = new mFiole("fiole");obj.scaleX=0.4;obj.scaleY=0.4;obj.name = "mFiole";
					break;
				case "baton":
					obj = new Baton("baton");obj.scaleX=0.5;obj.scaleY=0.5;obj.name = "baton";
					break;
				case "falchion":
					obj = new Falchion("falchion");obj.scaleX=0.4;obj.scaleY=0.4;obj.name = "falchion";
					break;
				case "longsword":
					obj = new Longsword("longsword");obj.scaleX=0.4;obj.scaleY=0.4;obj.name = "longsword";
					break;
				case "tonfa":
					obj = new Tonfa("tonfa");obj.scaleX=0.4;obj.scaleY=0.4;obj.name = "tonfa";
					break;	
				case "wMap":
					obj = new wMap("carte_1");obj.scaleX=0.5;obj.scaleY=0.5;obj.name = "wMap";
					break;
				//
				default:break;
			}
			// disabling touching
			Utx.disableTouch(obj);

			return obj;
		}
	}
}