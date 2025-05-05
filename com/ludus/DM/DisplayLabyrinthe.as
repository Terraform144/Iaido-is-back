package com.ludus.DM
{
	import com.Utx;
	import com.ludus.creatures.Creature;
	import com.ludus.stuffs.Arme;
	import com.ludus.stuffs.Stuff;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	
	public class DisplayLabyrinthe {
		
		private var that:Labyrinthe;
		private var evenement:Evenements;
		
		public var m_cases:Array = new Array();
		public var m_cases_objects:Array = new Array();
		public var m_faces:Array = new Array();
		public var m_fases_objects:Array = new Array();
		public var m_oblics:Array = new Array();
		public var m_oblics_objects:Array = new Array();
		
		public function DisplayLabyrinthe( _lab:Labyrinthe, _evenements:Evenements )
		{ 
			this.that = _lab;
			
			this.evenement = _evenements;
			this.evenement.getLabyrinthe(_lab);
			
			//
			this.fill_lab();
		}

		/**
		 * This prepare and fill in arrays all the lab components and dedicates objects
		 */
		private function fill_lab() 
		{
			
			// cases au sol
			this.m_cases=[{name:"g_l_0",topFictive:{l:1,c:0},leftFictive:{l:0,c:1},bottomFictive:{l:-1,c:0},rightFictive:{l:0,c:-1}},
				{name:"g_m_0",topFictive:{l:0,c:0},leftFictive:{l:0,c:0},bottomFictive:{l:0,c:0},rightFictive:{l:0,c:0}},
				{name:"g_r_0",topFictive:{l:-1,c:0},leftFictive:{l:0,c:-1},bottomFictive:{l:1,c:0},rightFictive:{l:0,c:1}},
				{name:"g_l_1",topFictive:{l:1,c:-1},leftFictive:{l:1,c:1},bottomFictive:{l:-1,c:1},rightFictive:{l:-1,c:-1}},

				{name:"g_m_1",topFictive:{l:0,c:-1},leftFictive:{l:1,c:0},bottomFictive:{l:0,c:1},rightFictive:{l:-1,c:0}},
				{name:"g_r_1",topFictive:{l:-1,c:-1},leftFictive:{l:1,c:-1},bottomFictive:{l:1,c:1},rightFictive:{l:-1,c:1}},
				{name:"g_l_2",topFictive:{l:1,c:-2},leftFictive:{l:2,c:1},bottomFictive:{l:-1,c:2},rightFictive:{l:-2,c:-1}},
				{name:"g_m_2",topFictive:{l:0,c:-2},leftFictive:{l:2,c:0},bottomFictive:{l:0,c:2},rightFictive:{l:-2,c:0}},
				{name:"g_r_2",topFictive:{l:-1,c:-2},leftFictive:{l:2,c:-1},bottomFictive:{l:1,c:2},rightFictive:{l:-2,c:1}}];
			for each(var mc in m_cases)
			{
				m_cases_objects.push(new TheCase( mc.name, that.getChildByName( mc.name ), 
					mc.topFictive, mc.leftFictive, mc.bottomFictive, mc.rightFictive));
			}
			
			// murs de face
			this.m_faces=[{name:"m_m_0"},{name:"m_l_1",topFictive:{l:1,c:-1},leftFictive:{l:1,c:1},bottomFictive:{l:-1,c:1},rightFictive:{l:-1,c:-1}},
				{name:"m_m_1",topFictive:{l:0,c:-1},leftFictive:{l:1,c:0},bottomFictive:{l:0,c:1},rightFictive:{l:-1,c:0}},
				{name:"m_r_1",topFictive:{l:-1,c:-1},leftFictive:{l:1,c:-1},bottomFictive:{l:1,c:1},rightFictive:{l:-1,c:1}},
				{name:"m_l_2",topFictive:{l:1,c:-2},leftFictive:{l:2,c:1},bottomFictive:{l:-1,c:2},rightFictive:{l:-2,c:-1}},
				{name:"m_m_2",topFictive:{l:0,c:-2},leftFictive:{l:2,c:0},bottomFictive:{l:0,c:2},rightFictive:{l:-2,c:0}},
				{name:"m_r_2",topFictive:{l:-1,c:-2},leftFictive:{l:2,c:-1},bottomFictive:{l:1,c:2},rightFictive:{l:-2,c:1}},
				{name:"m_l_3",topFictive:{l:1,c:-3},leftFictive:{l:3,c:1},bottomFictive:{l:-1,c:3},rightFictive:{l:-3,c:-1}},
				{name:"m_m_3",topFictive:{l:0,c:-3},leftFictive:{l:3,c:0},bottomFictive:{l:0,c:3},rightFictive:{l:-3,c:0}},
				{name:"m_r_3",topFictive:{l:-1,c:-3},leftFictive:{l:3,c:-1},bottomFictive:{l:1,c:3},rightFictive:{l:-3,c:1}}];
			for each(var mf in m_faces)
			{
				m_fases_objects.push(new MurFace( mf.name, that.getChildByName( mf.name ), 
					mf.topFictive, mf.leftFictive, mf.bottomFictive, mf.rightFictive));
			}
			
			// murs oblique
			this.m_oblics=[{name:"o_l_0",topFictive:{l:1,c:0},leftFictive:{l:0,c:1},bottomFictive:{l:-1,c:0},rightFictive:{l:0,c:-1}},
				{name:"o_r_0",topFictive:{l:-1,c:0},leftFictive:{l:0,c:-1},bottomFictive:{l:1,c:0},rightFictive:{l:0,c:1}},
				{name:"o_l_1",topFictive:{l:1,c:-1},leftFictive:{l:1,c:1},bottomFictive:{l:-1,c:1},rightFictive:{l:-1,c:-1}},
				{name:"o_r_1",topFictive:{l:-1,c:-1},leftFictive:{l:1,c:-1},bottomFictive:{l:1,c:1},rightFictive:{l:-1,c:1}},
				{name:"o_l_11",topFictive:{l:1,c:-2},leftFictive:{l:2,c:1},bottomFictive:{l:-1,c:2},rightFictive:{l:-2,c:-1}},
				{name:"o_l_22",topFictive:{l:2,c:-2},leftFictive:{l:3,c:2},bottomFictive:{l:-1,c:3},rightFictive:{l:-2,c:-2}},
				{name:"o_r_11",topFictive:{l:-1,c:-2},leftFictive:{l:2,c:-1},bottomFictive:{l:1,c:2},rightFictive:{l:-2,c:1}},
				{name:"o_r_22",topFictive:{l:-2,c:-2},leftFictive:{l:3,c:-2},bottomFictive:{l:-1,c:3},rightFictive:{l:-2,c:2}}];
			for each(var mo in m_oblics)
			{
				m_oblics_objects.push(new MurOblique( mo.name, that.getChildByName( mo.name ), 
					mo.topFictive, mo.leftFictive, mo.bottomFictive, mo.rightFictive));
			}
			
		}
		
		private function immediateCases(laCase):Vector.<Object>
		{
			// todo implement this
			
			return null;
		}
		
		/**
		 * retourne si case existe ou n'existe pas
		 */
		private function caseExist(laCase)
		{
			try{
				var lab = Global.map
					.getChildByName("_" + (that.position.l-laCase.l).toString() 
						+"$"+ (that.position.c-laCase.c).toString());
				if(lab.name != null) 
					return true;
				else 
					return false;
			} catch (error) {}
			
		}
		
		/**
		 * retourne si case existe ou n'existe pas
		 */
		public function caseVide(laCase)
		{
//trace('newPos:_'+laCase.l + '$' + laCase.c);
			try{
				var lab = Global.map
					.getChildByName("_" + (laCase.l).toString() 
						+"$"+ (laCase.c).toString());
				if(lab.name != null) 
					return true;
				else 
					return false;
			} catch (error) {}
			
		}
		
		public function cursorSurCase(laCase) 
		{
			
			try {
				
				var caseDamier = Global.map.getChildByName("_" + laCase.l.toString() +"$"+ laCase.c.toString());
				
				var cursor = Global.map.getChildByName('cursor');
				// regarde si un objet est sur la case du damier
				if(caseDamier.name != null) 
				{
					if(cursor.hitTestObject(caseDamier)) {
						return true;
					}
				} else  {
					return false;
				}
				
			} catch (error) {}
			
		}
		
		public function displayArtefacts() {
			// todo
		}
		
		public function caseExploitable( newPosition, lEntite ) {
			
			try {
				if (this.caseVide(newPosition) && !this.entiteSurCase(newPosition, lEntite)) {
					return true;
				}
			} catch (e) {
				//
			}
			return false;
		}
		
		/**
		 * cette méthode regarde si une entité existe sur la case <-- !!! redo
		 */
		public function entiteSurCase(laCase, lEntite) 
		{
			for each(var entity:Creature in this.evenement.monTableauDeCreatures)
			{
				var isEntity = entity != lEntite;
				try{
					if(isEntity && entity.life >0) { // IF ENTITY IS ALIVE
						var caseDamier = Global.map.getChildByName("_" + laCase.l.toString() +"$"+ laCase.c.toString());
						
						var creature = Global.map.getChildByName(entity.id);
						// regarde si un objet est sur la case du damier
						if(caseDamier.name != null && creature != null) 
						{
							if(creature.hitTestObject(caseDamier)) {
								return true;
							}
						} else  {
							return false;
						}
					}
					
				} catch (error) {
					trace("entiteSurCase : " + error);
				}
			}
			return false;
		}
		
		/**
		 * cette méthode regarde si un object massif existe sur la case <-- !!! redo
		 */
		public function massiveObjectSurCase(laCase, lEntite) 
		{
			
			// todo : reste check si user est sur la case
			for each(var entity:Stuff in this.evenement.monTableauDeStuffs)
			{
				var isEntity = entity != lEntite;
				//trace(isEntity+" //"+entity+"--"+lEntite);
				try{
					if(isEntity) {
						var caseDamier = Global.map.getChildByName("_" + laCase.l.toString() +"$"+ laCase.c.toString());
						
						var _entity = Global.map.getChildByName(entity.id);
						// regarde si un objet est sur la case du damier
						if(caseDamier.name != null) 
						{
							if( _entity.hitTestObject(caseDamier) 
								&& Utx.isMassive(entity.id)
							) {
								return true;
							}
						} else  {
							return false;
						}
					}
					
				} catch (error) {}
			}
		}
		
		/**
		 * cette méthode regarde si des entités existe sur la case <-- !!! redo
		 */
		public function creatureSurCase(laCase)
		{
			var creaTab:Array = new Array();
			try{
				
				for each(var entity:Creature in this.evenement.monTableauDeCreatures)
				{
					
						var _l1:int = (that.position.l-laCase.l); var _c1:int = (that.position.c-laCase.c);
						var caseDamier = Global.map.getChildByName("_" + _l1.toString() +"$"+ _c1.toString());
						
						var creature = Global.map.getChildByName(entity.id);
						// regarde si un objet est sur la case du damier
						if(caseDamier.name != null && creature != null) 
						{
							if(creature.hitTestObject(caseDamier)) {
								entity.setCoordinates(_l1,_c1);
								creaTab.push(entity);
							}
							
						} else  {
							return false;
						}
				}
				
				return creaTab;
				
			} catch (error) {trace("creatureSurCase" + error); }
		}
		
		/**
		 * cette méthode regarde si un objet existe sur la case <-- !!! redo
		 */
		public function objetsSurCase(laCase) 
		{
			
			var objects:Array = new Array();
			
			// creature
			for each(var objet:Stuff in this.evenement.monTableauDeStuffs)
			{
				try {
					
					var _l1:int = (that.position.l-laCase.l); var _c1:int = (that.position.c-laCase.c);
					var caseDamier = Global.map.getChildByName("_" + _l1.toString() +"$"+ _c1.toString());
					
					var stuff = Global.map.getChildByName(objet.id);
					// regarde si un objet est sur la case du damier
					if(caseDamier.name != null) 
					{
						if(stuff.hitTestObject(caseDamier)) {
							objet.setCoordinates(_l1,_c1);
							objects.push(objet);
						}
					} else  {
						return false;
					}
				} catch(e) {}
			}
			if(objects) {
				return objects;
			}
		}
		
		/**
		 * hide all thing selected by cases
		 */
		public function hideThing(thg:String)
		{
			switch(thg){
				
				case "s":
					for each( var stuff:Stuff in this.evenement.monTableauDeStuffs)
					{
						if(stuff.parent)
							stuff.parent.removeChild(stuff);
					}
					break;
				
				case "c":
					for each( var crea:Creature in this.evenement.monTableauDeCreatures)
					{
						if(crea.parent)
							crea.parent.removeChild(crea);
					}
					break;
			}
		}
		
		/**
		 * showWalls affiche les murs et les cases
		 * 
		 * TODO : ?? list of stuff and creatures (last) to be appearing --> see "top" first behind
		 */
		public function showWalls(orientation:String, position:Object) 
		{
			
			this.hideWalls(); this.hideThing("c"); this.hideThing("s");
			
			try{
				
				var mf:MurFace, mo:MurOblique, c:TheCase;
				var thing; var obj:Array; var o:Stuff; var cr;
				
				// orientation
				switch(that.orientation) {
					
					case "top": 
						
						// cases au sol
						for each(c in this.m_cases_objects) {
							if(this.caseExist(c.topFictive)){c.labElement.visible = true;
								
								obj = this.objetsSurCase(c.topFictive); // faire en sorte que plusieurs objets puissent être sur une case
								if(obj) {
									for each(o in obj) this.evenement.displayStuff(o, c.id, that);
								}	
								
								thing = this.creatureSurCase(c.topFictive);
								if(thing) {
									
									for each(cr in thing) {this.evenement.displayCreature(cr, c.id, that);}
								
								}
							}
						}
						
						// murs de face
						for each(mf in this.m_fases_objects) {
							if(mf.id != "m_m_0")
								if(!this.caseExist(mf.topFictive)) {mf.labElement.visible = true; };
						}
						
						// murs obliques
						for each(mo in this.m_oblics_objects) {
							if(!this.caseExist(mo.topFictive)) {mo.labElement.visible = true; };
						}
						
						break;
					
					case "left": 
					
						// cases au sol
						for each(c in this.m_cases_objects) {
							if(this.caseExist(c.leftFictive)){c.labElement.visible = true;
								
								obj = this.objetsSurCase(c.leftFictive);
								if(obj) {
									for each(o in obj)	this.evenement.displayStuff(o, c.id, that);
								}
								
								thing = this.creatureSurCase(c.leftFictive);
								if(thing) {
									for each(cr in thing) {this.evenement.displayCreature(cr, c.id, that);}
								}
							}
						}
						
						// murs de face
						for each(mf in this.m_fases_objects) {
							if(mf.id != "m_m_0")
								if(!this.caseExist(mf.leftFictive)) {mf.labElement.visible = true; };
						}
						
						// murs obliques
						for each(mo in this.m_oblics_objects) {
							if(!this.caseExist(mo.leftFictive)) {mo.labElement.visible = true; };
						}
						break;
					
					case "bottom": 
					
						// cases au sol
						for each(c in this.m_cases_objects) {
							if(this.caseExist(c.bottomFictive)){c.labElement.visible = true;
								
								obj = this.objetsSurCase(c.bottomFictive);
								if(obj) {
									for each(o in obj) this.evenement.displayStuff(o, c.id, that);
								}
								thing = this.creatureSurCase(c.bottomFictive);
								if(thing) {
									for each(cr in thing) {this.evenement.displayCreature(cr, c.id, that);}
								}
							}
						}
						
						// murs de face
						for each(mf in this.m_fases_objects) {
							if(mf.id != "m_m_0")
								if(!this.caseExist(mf.bottomFictive)) {mf.labElement.visible = true; };
						}
						
						// murs obliques
						for each(mo in this.m_oblics_objects) {
							if(!this.caseExist(mo.bottomFictive)) {mo.labElement.visible = true; };
						}
						break;
					
					case "right": 
					
						// cases au sol
						for each(c in this.m_cases_objects) {
							if(this.caseExist(c.rightFictive)){c.labElement.visible = true;
								
								obj = this.objetsSurCase(c.rightFictive);
								if(obj) {
									for each(o in obj)	this.evenement.displayStuff(o, c.id, that);
								}
								thing = this.creatureSurCase(c.rightFictive);
								if(thing) {
									for each(cr in thing) {this.evenement.displayCreature(cr, c.id, that);}
								}
							}
						}
						
						// murs de face
						for each(mf in this.m_fases_objects) {
							if(mf.id != "m_m_0")
								if(!this.caseExist(mf.rightFictive)) {mf.labElement.visible = true; };
						}
						
						// murs obliques
						for each(mo in this.m_oblics_objects) {
							if(!this.caseExist(mo.rightFictive)) {mo.labElement.visible = true; };
						}
						break;
				}
				
			}catch(e:Error) {
				trace("showWalls: " + e);
			}
		}
		
		public function textureGrid() 
		{
			var rnd:int, oldRnd:int;
			for each(var c in this.m_cases_objects) {
				oldRnd=rnd;
				while(oldRnd==rnd) 
					rnd = Utx.rnd(0,4);
				c.labElement.gotoAndStop(rnd);	
			}
		}
		
		/**
		 * hideWalls efface les murs
		 */
		public function hideWalls() 
		{
			this.m_cases.forEach(hideObject); 
			this.m_faces.forEach(hideObject);
			this.m_oblics.forEach(hideObject);
		}
		
		public function hideObject(element:*, index:Number, arr:Array):void 
		{
			that.getChildByName( element.name ).visible = false;
		}
		
	} // eoc
}