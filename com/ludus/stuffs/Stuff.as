package com.ludus.stuffs
{
	
	import com.Utx;
	import com.ludus.cinematiques.open_door;
	import com.ludus.cinematiques.step_down;
	import com.ludus.stuffs.Inventaire;
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

		public function isTakable(_obj)
		{
			var bool:Boolean = false;
			var qCN = getQualifiedClassName(_obj);trace("qCN: "+qCN);
			switch (getQualifiedSuperclassName(_obj)) {
				case 'com.ludus.stuffs::Stairs':
					bool = false;
					if(Utx.isInFront(_obj)) showStepDown();
					break;
				case 'com.ludus.stuffs::Door':
					bool = false;
					if(qCN != 'com.ludus.stuffs::caveau') { if(Utx.isInFront(_obj)) showOpenDoor(); }
					break;
				case '':
					break;
			}
			if(Utx.isInFront(_obj)) bool = true;

		return bool;
		}

		// check if user or creature is adjacent to another
		public function is_adjacent() : Boolean
		{
			switch(Global.Lab.orientation)
			{
				case 'top':
//Global.debug_this(Global.Lab.orientation+" //" +Math.abs(this.coordinate.c - Global.Lab.position.c));
					if(Math.abs(this.coordinate.c - Global.Lab.position.c) == 1
						&& (this.coordinate.l - Global.Lab.position.l == 0)) {

						return true; 
					}
					break;
				case 'bottom':
//Global.debug_this(Global.Lab.orientation+" //" +Math.abs(this.coordinate.c - Global.Lab.position.c));
					if(Math.abs(this.coordinate.c - Global.Lab.position.c) == 1
						&& (this.coordinate.l - Global.Lab.position.l == 0)) {
						
						return true; 
					}
					break;
				case 'left':
//Global.debug_this(Global.Lab.orientation+" //" +Math.abs(this.coordinate.l - Global.Lab.position.l));
					if(Math.abs(this.coordinate.l - Global.Lab.position.l) == 1
						&& (this.coordinate.c - Global.Lab.position.c == 0)) {
						
						return true; 
					}
					break;
				case 'right':
//Global.debug_this(Global.Lab.orientation+" //" +Math.abs(this.coordinate.l - Global.Lab.position.l));
					if(Math.abs(this.coordinate.l - Global.Lab.position.l) == 1
						&& (this.coordinate.c - Global.Lab.position.c == 0)) {
						
						return true; 
					}
					break;
			}
			return false;
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
						Global.SOUNDMANAGER.playSound('stairs');
						Global.Lab.orientation = 'left'; 
						break;
					case 2:
						if (getQualifiedClassName(this) != 'com.ludus.stuffs::stairs_up') {
							
							Global.numLevel = 3; Global.map.gotoAndStop('level_3'); 
							Global.CINEMATIQUE.addChild(step_dwn);
							Global.SOUNDMANAGER.playSound('stairs');
							Global.Lab.orientation = 'top';
						}
						break;
					case 3:
						if (getQualifiedClassName(this) != 'com.ludus.stuffs::stairs_up') {
							Global.SOUNDMANAGER.playSound('stairs');
							Global.numLevel=4; Global.map.gotoAndStop('level_4');
							Global.CINEMATIQUE.addChild(step_dwn);
							 Global.Lab.orientation = 'top';
						}
						break;
					case 4:
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

		public function updatePositionOnMap() {
			
			// creature symbol
			var stuff_smb = Global.map.getChildByName(this.id);
//stuff_smb.name = this.id;
			
			// square symbol
			var square_smb = Global.map.getChildByName("_"+this.coordinate.l+"$"+this.coordinate.c);
			
			// place creature symbol on square symbol
			stuff_smb.x =  square_smb.x; stuff_smb.y =  square_smb.y;
		}

		private function takeMe(evt:Event)
		{
			var inv = new Inventaire();
//Utx.analyze(this); // to cache
			if (isTakable(this) && inv.isCompatible(this)) {
				Global.PLAYER.prendre(this);

				inv = null;
			}
			else {
				//
			}
		}
	}
}