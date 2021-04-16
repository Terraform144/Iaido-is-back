package com.ludus.stuffs
{
	
	import com.Utx;
	import com.ludus.cinematiques.open_door;
	import com.ludus.cinematiques.step_down;
	import fl.motion.Motion;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.getQualifiedSuperclassName;
	import flash.utils.getQualifiedClassName;
	
	public class Stuff extends MovieClip
	{
		
		public var me:MovieClip;
		public var id:String;
		public var tailleRatio;
		
		private var coordinate:Object={l:0,c:0};
		
		public function Stuff(_id)
		{
			super();
			this.id = _id;
			this.tailleRatio = 1.0;
			
			this.addEventListener(MouseEvent.CLICK, takeMe);
		}		
		
		private function isTakable(_obj)
		{
			var bool:Boolean = true;
			switch (getQualifiedSuperclassName(_obj)) {
				case 'com.ludus.stuffs::Stairs':
					bool = false;
					if(Utx.isInFront(_obj)) showStepDown();
					break;
				case 'com.ludus.stuffs::Door':
					bool = false;
					if(Utx.isInFront(_obj)) showOpenDoor();
					break;
				case '':
					break;
			}
			
		return bool;
		}
		
		public function setCoordinates(_l:int, _c:int) // do setter
		{
			this.coordinate.l = _l; this.coordinate.c = _c;
//trace("setCoordinate: "+ _l+"/"+_c);
		}
		
		private function showOpenDoor() {
			Global.CINEMATIQUE = Global.ROOT_CLIP.getChildByName("dmy_anim");
			
			try{
				//
				var opn_door = new open_door();
				
				switch(Global.Lab.orientation) {
					case 'top':
						Global.Lab.position.c+=2;
						break;
					case 'right':
						Global.Lab.position.l+=2;
						break;
					case 'bottom':
						Global.Lab.position.c-=2;
						break;
					case 'left':
						Global.Lab.position.l-=2;
						break;
				}
				
//Global.CINEMATIQUE.addChild(opn_door);
				Global.SOUNDMANAGER.playSound('porte');
			}catch (e:Error) {
				
				trace("showOpenDoor: " + e);
				
			} finally {
				
				Global.Lab.initCursor();
				
				// refresh walls of lab
				Global.Lab.dl.showWalls(Global.Lab.orientation,Global.Lab.position);
				
			}
			
		}
		
		private function showStepDown() { // todo better
			Global.CINEMATIQUE = Global.ROOT_CLIP.getChildByName("dmy_anim");
			
			try{
				//
				var step_dwn = new step_down();
				switch(Global.numLevel) {
					case 1:
						Global.numLevel=2; Global.map.gotoAndStop('level_2'); 
						Global.CINEMATIQUE.addChild(step_dwn);
						Global.Lab.orientation = 'left'; 
						break;
					case 2:
						if (getQualifiedClassName(this) == 'com.ludus.stuffs::stairs_up') {
							Global.numLevel=1; Global.map.gotoAndStop('level_1'); 
							Global.Lab.orientation = 'left';
							
						} else {
							Global.numLevel = 3; Global.map.gotoAndStop('level_3'); 
							Global.CINEMATIQUE.addChild(step_dwn);
							
							Global.Lab.orientation = 'top';
						}
						break;
					case 3:
						if (getQualifiedClassName(this) == 'com.ludus.stuffs::stairs_up') {
							Global.numLevel=2; Global.map.gotoAndStop('level_2'); 
							Global.Lab.orientation = 'top';
						} else {
							Global.numLevel=4; Global.map.gotoAndStop('level_4');
							Global.CINEMATIQUE.addChild(step_dwn);
							 Global.Lab.orientation = 'top';
							
						}
						break;
					case 4:
						if (getQualifiedClassName(this) == 'com.ludus.stuffs::stairs_up') {
							Global.numLevel=3; Global.map.gotoAndStop('level_3'); 
							Global.Lab.orientation = 'top';
							
						}
						break;
				}
			} catch (e:Error) {
				
				trace("showStepDown: " + e);
				
			} finally {
				
				Global.Lab.dl.showWalls(Global.Lab.orientation,Global.Lab.position);
				
				Global.EVENEMENTS.loadCreatures(Global.numLevel); // place the creatures in the lab
				Global.EVENEMENTS.loadStuffs(Global.numLevel);
				
				Global.Lab.initCursor();
				
				// refresh walls of lab
				
			}
			
		}
		
		private function takeMe(evt:Event)
		{
//Utx.analyze(this); // to cache

			if (isTakable(this)){				
				Global.PLAYER.prendre(this);
			}
			else {
				//
			}
		}
	}
}