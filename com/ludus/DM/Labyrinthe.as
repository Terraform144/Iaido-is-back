package com.ludus.DM
{
	import com.Utx;
	import com.ludus.creatures.Creature;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * Point d'entrée de l'application - 
	 */
	public class Labyrinthe extends MovieClip
	{
		public function Labyrinthe()
		{
			super();
			
			// init
			this.init();
		}
		
		public var position:Object = {l:1,c:1};
		public var orientation:String = "left";
		private var cs;

		//
		public var dl:DisplayLabyrinthe;
		public var ev:Evenements;
		
		public function initCursor() {
			// get cursor
			this.cs = Global.map.getChildByName("cursor");
			
			switch( this.orientation) {
				case 'top':
					this.cs.rotation = 90;break;
				case 'left':
					this.cs.rotation = 0;break;
				case 'right':
					this.cs.rotation = 180;break;
				case 'bottom':
					this.cs.rotation = 270;break;
			}
			
			this.placeGrid();
		}
		
		private function init() {
			
			// set GLOBAL utils
			Global.ROOT = root as DisplayObjectContainer;
			Global.Lab = this;
			
			// get map
			Global.map = Global.Lab.getChildByName("_map");
			this.initCursor();
			
			// init affects
			this.ev = new Evenements();
			this.dl = new DisplayLabyrinthe(this, this.ev);

			// avance d'une case listener - position
			var lc = Global.Lab.getChildByName("left_cursor");
				lc.addEventListener( MouseEvent.CLICK, this.setPosition );
			var rc = Global.Lab.getChildByName("right_cursor");
				rc.addEventListener( MouseEvent.CLICK, this.setPosition ); //
			var fc = Global.Lab.getChildByName("forward_cursor");
				fc.addEventListener( MouseEvent.CLICK, this.setPosition ); //	

			// tourne sur lui même listener - orientation
			var ctl = Global.Lab.getChildByName("cursor_to_left");
				ctl.addEventListener( MouseEvent.CLICK, this.setOrientation ); //	
			var ctr = Global.Lab.getChildByName("cursor_to_right");
				ctr.addEventListener( MouseEvent.CLICK, this.setOrientation ); //	
				
			// prepare labyrinthe
			this.placeGrid(); dl.showWalls(this.orientation,this.position);
			
		}
		
		// hide nav keys
		public function hideCursors() {
			this.getChildByName("cursor_to_left").visible = false;
			this.getChildByName("cursor_to_right").visible = false;
			this.getChildByName("right_cursor").visible = false;
			this.getChildByName("left_cursor").visible = false;
			this.getChildByName("forward_cursor").visible = false;

		}
		
		// show nav keys
		public function showCursors() {
			this.getChildByName("cursor_to_left").visible = true;
			this.getChildByName("cursor_to_right").visible = true;
			this.getChildByName("right_cursor").visible = true;
			this.getChildByName("left_cursor").visible = true;
			this.getChildByName("forward_cursor").visible = true;
		}
		
		public function placeGrid()
		// place curseur sur la case de la grille en fonction de sa position
		{
			try{
				
				var lab = Global.map
					.getChildByName("_" + this.position.l.toString() + "$" + this.position.c.toString());
			
				this.cs.x = lab.x; this.cs.y = lab.y;
			} catch (error) {
				//
			}
		}
		
		public function caseExist(_l,_c) {
			try{
				var caseName = "_" + _l.toString() +"$"+ _c.toString();
				
				var lab = Global.map
					.getChildByName(caseName);
				if(lab.name != null) 
					return true; 
				else 
					return false;
			} catch (error) {}
		}
		
		public function setOrientation ( event:MouseEvent ) {
			
			Global.GAMELOOP.reset_counter();
			var direction = event.currentTarget.name;
			
			switch (direction) 
			{
				case "cursor_to_left":
				
				if (this.orientation == "top") { this.orientation = "left"; } 
				else if (this.orientation == "left") { this.orientation = "bottom"; } 
				else if (this.orientation == "right") { this.orientation = "top"; } 
				else if (this.orientation == "bottom") { this.orientation = "right"; } 
				break;
				
				case "cursor_to_right":
				
				if (this.orientation == "top") { this.orientation = "right"; } 
				else if (this.orientation == "left") { this.orientation = "top"; }
				else if (this.orientation == "right") { this.orientation = "bottom"; } 
				else if (this.orientation == "bottom") { this.orientation = "left"; }
				break;
			}
			
			this.initCursor();
			
			try{
				this.dl.showWalls(this.orientation,this.position);
				this.change_shadow();
			}catch(error) {
				trace("labyrinthe.dl.showWalls : " + error);
			}
			
		}
		
		/**
		 * this change the obscurity product of the lab
		 */
		public function change_shadow() {
			var mc_shadow = Global.Lab.getChildByName("mc_shadow");
			mc_shadow.gotoAndStop(Utx.rnd(0,5));
		}
		
		private function setPosition ( event:MouseEvent ) {
			
			Global.GAMELOOP.reset_counter();
			var direction = event.currentTarget.name; 
			var showBool = true;
			switch (direction) {
				
				case "left_cursor":
					
					if (this.orientation == "top")
					{
						if(caseExist(this.position.l-1,this.position.c) 
							&& !dl.entiteSurCase({l:(this.position.l-1),c:(this.position.c)},null)
							&& !dl.massiveObjectSurCase({l:(this.position.l-1),c:(this.position.c)},null)
						)	this.position.l -= 1;
						else
							showBool = false;
					}
						
					else if (this.orientation == "left") 
					{
						if(caseExist(this.position.l,this.position.c-1)
							&& !dl.entiteSurCase({l:(this.position.l),c:(this.position.c-1)},null)
							&& !dl.massiveObjectSurCase({l:(this.position.l),c:(this.position.c-1)},null)
						) this.position.c -= 1;
						else
							showBool = false;
					}
						
					else if (this.orientation == "bottom") 
					{
						if(caseExist(this.position.l+1,this.position.c) 
							&& !dl.entiteSurCase({l:(this.position.l+1),c:(this.position.c)},null)
							&& !dl.massiveObjectSurCase({l:(this.position.l+1),c:(this.position.c)},null)
						) this.position.l += 1;
						else
							showBool = false;
					}
						
					else if (this.orientation == "right") 
					{
						if(caseExist(this.position.l,this.position.c+1)
						 	&& !dl.entiteSurCase({l:(this.position.l),c:(this.position.c+1)},null)
							&& !dl.massiveObjectSurCase({l:(this.position.l),c:(this.position.c+1)},null)
						) this.position.c += 1;
						else
							showBool = false;
					}
					break;
				
				case "right_cursor":
					
					if (this.orientation == "top")
					{
						if(caseExist(this.position.l+1,this.position.c)
							&& !dl.entiteSurCase({l:(this.position.l+1),c:(this.position.c)},null)
							&& !dl.massiveObjectSurCase({l:(this.position.l+1),c:(this.position.c)},null)
						) this.position.l += 1;
						else
							showBool = false;
					}
						
					else if (this.orientation == "left") 
					{
						if(caseExist(this.position.l,this.position.c+1)
							&& !dl.entiteSurCase({l:(this.position.l),c:(this.position.c+1)},null)
							&& !dl.massiveObjectSurCase({l:(this.position.l),c:(this.position.c+1)},null)
						) this.position.c += 1;
						else
							showBool = false;
					}
						
					else if (this.orientation == "bottom") 
					{
						if(caseExist(this.position.l-1,this.position.c)
							&& !dl.entiteSurCase({l:(this.position.l-1),c:(this.position.c)},null)
							&& !dl.massiveObjectSurCase({l:(this.position.l-1),c:(this.position.c)},null)
						) this.position.l -= 1;
						else
							showBool = false;
					}
						
					else if (this.orientation == "right") 
					{
						if(caseExist(this.position.l,this.position.c-1)
							&& !dl.entiteSurCase({l:(this.position.l),c:(this.position.c-1)},null)
							&& !dl.massiveObjectSurCase({l:(this.position.l),c:(this.position.c-1)},null)
						) this.position.c -= 1;
						else
							showBool = false;
					}
					
					break;
				
				case "forward_cursor":
					
					if (this.orientation == "top") 
					{
						if(caseExist(this.position.l,this.position.c+1)
							&& !dl.entiteSurCase({l:(this.position.l),c:(this.position.c+1)},null)
							&& !dl.massiveObjectSurCase({l:(this.position.l),c:(this.position.c+1)},null)
						) this.position.c += 1;
						else
							showBool = false;
					}
					
					else if (this.orientation == "left") 
					{
						if(caseExist(this.position.l-1,this.position.c)
							&& !dl.entiteSurCase({l:(this.position.l-1),c:(this.position.c)},null)
							&& !dl.massiveObjectSurCase({l:(this.position.l-1),c:(this.position.c)},null)
						) this.position.l-=1;
						else
							showBool = false;
					}
						
					else if (this.orientation == "bottom") 
					{
						if(caseExist(this.position.l,this.position.c-1)
							&& !dl.entiteSurCase({l:(this.position.l),c:(this.position.c-1)},null)
							&& !dl.massiveObjectSurCase({l:(this.position.l),c:(this.position.c-1)},null)
						) this.position.c-=1;
						else
							showBool = false;
					}
					
					else if (this.orientation == "right") 
					{
						if(caseExist(this.position.l+1,this.position.c)
							&& !dl.entiteSurCase({l:(this.position.l+1),c:(this.position.c)},null)
							&& !dl.massiveObjectSurCase({l:(this.position.l+1),c:(this.position.c)},null)) this.position.l+=1;
						else
							showBool = false;
					}
					
					break;
			}

			if(showBool)
			{
				this.placeGrid(); dl.showWalls(this.orientation,this.position);dl.textureGrid();
				this.change_shadow();
			}
		}
	}
}