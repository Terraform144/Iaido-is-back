package com.ludus.DM
{
	
	import com.GameLoop;
	import com.MiniLoop;
	import com.ludus.creatures.Araignee;
	import com.ludus.creatures.Annie;
	import com.ludus.creatures.Bouclio;
	import com.ludus.creatures.Canard_reptile;
	import com.ludus.creatures.Creature;
	import com.ludus.creatures.Homme_poilu;
	import com.ludus.creatures.Lord_Khaos;
	import com.ludus.creatures.Makura;
	import com.ludus.creatures.Oeil_volant;
	import com.ludus.stuffs.Door;
	import com.ludus.stuffs.Longsword;
	import com.ludus.stuffs.e_field;
	import com.ludus.stuffs.porte_1;
	import com.ludus.stuffs.porte_2;
	import com.ludus.stuffs.porte_3;
	import com.ludus.stuffs.ray_plafond;
	import com.ludus.stuffs.Arme;
	import com.ludus.stuffs.Baton;
	import com.ludus.stuffs.Falchion;
	import com.ludus.stuffs.Stuff;
	import com.ludus.stuffs.Tonfa;
	import com.ludus.stuffs.stairs_down;
	import com.ludus.stuffs.stairs_up;
	import flash.display.DisplayObject;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.GameInputEvent;
	import flash.utils.getDefinitionByName;
	
	import com.Utx;
	
	import avmplus.getQualifiedClassName;
	import avmplus.getQualifiedSuperclassName;
	
	/**
	 * Cette classe reprend tout ce que l'on peut vivre dans le labyrinthe
	 */
	public class Evenements
	{
		public var that;
		
		public var monTableauDeCreatures:Vector.<Creature>;public var maPopulation:Vector.<Creature>;
		public var monTableauDeStuffs:Vector.<Stuff>; public var maObjettheque:Vector.<Stuff>;
		public var monTableauArtefacts:Vector.<Object>;
		
		private const DISTANCE:int = 3;
		
		public function loadCreatures(numLevel) {
			
			if( !this.monTableauDeCreatures ) this.monTableauDeCreatures = new Vector.<com.ludus.creatures.Creature>;
			{// creatures
				
				try{
						
					switch (Global.numLevel) 
					{
						case 1:
							// level 1
							monTableauDeCreatures[0] = maPopulation[0];
							monTableauDeCreatures[1] = maPopulation[1];
							monTableauDeCreatures[2] = maPopulation[2];
							monTableauDeCreatures[3] = maPopulation[3];
							monTableauDeCreatures[4] = maPopulation[4];
							monTableauDeCreatures[5] = maPopulation[5];
							monTableauDeCreatures[6] = maPopulation[6];
							monTableauDeCreatures[7] = maPopulation[7];
							monTableauDeCreatures[8] = maPopulation[8];
							monTableauDeCreatures[9] = maPopulation[9]; 
							monTableauDeCreatures[10] = maPopulation[10];
							
							break;				
							
						case 2:
							// level 2
							monTableauDeCreatures[0] = maPopulation[11];
							monTableauDeCreatures[1] = maPopulation[12];
							monTableauDeCreatures[2] = maPopulation[13];
							monTableauDeCreatures[3] = maPopulation[14];
							monTableauDeCreatures[4] = maPopulation[15];
							monTableauDeCreatures[5] = maPopulation[16];
							monTableauDeCreatures[6] = maPopulation[17];
							monTableauDeCreatures[7] = maPopulation[18];
							monTableauDeCreatures[8] = maPopulation[19];
							monTableauDeCreatures[9] = maPopulation[20];
							monTableauDeCreatures[10] = maPopulation[21];
							
							break;
							
						case 3:
							// level 3
							monTableauDeCreatures[0] = maPopulation[22];
							monTableauDeCreatures[1] = maPopulation[23];
							monTableauDeCreatures[2] = maPopulation[24];
							monTableauDeCreatures[3] = maPopulation[25];
							monTableauDeCreatures[4] = maPopulation[26];
							monTableauDeCreatures[5] = maPopulation[27];
							monTableauDeCreatures[6] = maPopulation[28];
							monTableauDeCreatures[7] = maPopulation[29];
							monTableauDeCreatures[8] = maPopulation[30];
							monTableauDeCreatures[9] = maPopulation[31];
							monTableauDeCreatures[10] = maPopulation[32];
							
							break;
							
						case 4:
							// level 4
							monTableauDeCreatures[0] = maPopulation[33];
							monTableauDeCreatures[1] = maPopulation[34];
							monTableauDeCreatures[2] = maPopulation[35];
							monTableauDeCreatures[3] = maPopulation[36];
							monTableauDeCreatures[4] = maPopulation[37];
							monTableauDeCreatures[5] = maPopulation[38];
							monTableauDeCreatures[6] = maPopulation[39];
							monTableauDeCreatures[7] = maPopulation[40];
							monTableauDeCreatures[8] = maPopulation[41];
							monTableauDeCreatures[9] = maPopulation[42];
							monTableauDeCreatures[10] = maPopulation[43];
							
							break;
					}
					
					// update position of creature symbol on map
					for each (var c:Creature in monTableauDeCreatures){
						c.updatePositionOnMap();
					}
					
				} catch (e:Error) {
					trace("loadCreatures: " + e.getStackTrace);
				}
			}
		}
		
		public function initCoordinates() {
			
			//
			
		}
		public function initObjettheque():void 
		{
			if( !this.maObjettheque ) this.maObjettheque = new Vector.<com.ludus.stuffs.Stuff>;
			
			maObjettheque[0] = (new Tonfa("s1"));
			maObjettheque[1] = (new Baton("s2"));
			maObjettheque[2] = (new Falchion("s3"));
			maObjettheque[3] = (new Longsword("s20"));
			
			maObjettheque[4] = (new porte_1("_d_01", 'HORIZONTAL', {_l:3,_c:3}));
			maObjettheque[5] = (new porte_1("_d_02", 'HORIZONTAL', {_l:2,_c:11}));
			maObjettheque[6] = (new porte_1("_d_03", 'VERTICAL', {_l:12,_c:8}));
			maObjettheque[7] = (new porte_3("_d_04", 'HORIZONTAL', {_l:20,_c:3}));
			
			maObjettheque[8] = (new stairs_down("stairs1"));
			maObjettheque[9] = (new stairs_up("stairs1up"));
			maObjettheque[10] = (new stairs_down("stairs2"));
			maObjettheque[11] = (new stairs_up("stairs2up"));
			maObjettheque[12] = (new stairs_down("stairs3"));
			maObjettheque[13] = (new stairs_up("stairs3up"));

			// ray
			maObjettheque[14] = (new ray_plafond("s100"));

			// doors
			maObjettheque[15] = (new porte_1("_d_01", 'HORIZONTAL', {_l:4,_c:15}));
			maObjettheque[16] = (new porte_1("_d_02", 'HORIZONTAL', {_l:6,_c:1}));
			maObjettheque[17] = (new porte_3("_d_03", 'HORIZONTAL', {_l:11,_c:16}));
			maObjettheque[18] = (new porte_1("_d_04", 'VERTICAL', {_l:13,_c:19}));
			maObjettheque[19] = (new porte_3("_d_05", 'HORIZONTAL', {_l:25, _c:7}));
			
			maObjettheque[20] = (new stairs_up("stairs1up"));
			maObjettheque[21] = (new stairs_down("stairs2"));

			maObjettheque[22] = (new stairs_up("stairs2up"));
			maObjettheque[23] = (new stairs_down("stairs3"));
			
			maObjettheque[24] = (new porte_1("_d_01", 'VERTICAL', {_l:27, _c:20}));
			maObjettheque[25] = (new porte_1("_d_02", 'HORIZONTAL', {_l:14,_c:11}));
			maObjettheque[26] = (new ray_plafond("s105"));
			maObjettheque[27] = (new stairs_up("stairs3up"));
			maObjettheque[28] = (new porte_2("_d_03", 'HORIZONTAL', {_l:30, _c:24}));
			maObjettheque[29] = (new ray_plafond("s106")); maObjettheque[30] = (new ray_plafond("s107")); maObjettheque[31] = (new ray_plafond("s108"));
			
			maObjettheque[32] = (new Longsword("s20"));
			
		}
		
		public function loadStuffs(numLevel) {
			
				try{
					if( !this.monTableauDeStuffs ) this.monTableauDeStuffs = new Vector.<com.ludus.stuffs.Stuff>;
					switch (Global.numLevel) 
					{
						case 1:
							monTableauDeStuffs[0] = maObjettheque[0];
							monTableauDeStuffs[1] = maObjettheque[1];
							monTableauDeStuffs[2] = maObjettheque[2];
							monTableauDeStuffs[3] = maObjettheque[3];
							
							monTableauDeStuffs[4] = maObjettheque[4];
							monTableauDeStuffs[5] = maObjettheque[5];
							monTableauDeStuffs[6] = maObjettheque[6];
							monTableauDeStuffs[7] = maObjettheque[7];
						
							monTableauDeStuffs[8] = maObjettheque[8];
							monTableauDeStuffs[9] = maObjettheque[9];
							monTableauDeStuffs[10] = maObjettheque[10];
							monTableauDeStuffs[11] = maObjettheque[11];
							monTableauDeStuffs[12] = maObjettheque[12];
							monTableauDeStuffs[13] = maObjettheque[13];
							break;
							
						case 2:

							// rays
							monTableauDeStuffs[1] = maObjettheque[14];
							
							// doors
							monTableauDeStuffs[2] = maObjettheque[15];
							monTableauDeStuffs[3] = maObjettheque[16];
							monTableauDeStuffs[4] = maObjettheque[17];
							monTableauDeStuffs[5] = maObjettheque[18];
							monTableauDeStuffs[6] = maObjettheque[19];
							
							monTableauDeStuffs[7] =maObjettheque[20];
							monTableauDeStuffs[8] = maObjettheque[21];
							
							// weapon
							monTableauDeStuffs[9] = maObjettheque[32];
							break;
							
						case 3:
							monTableauDeStuffs[0] = maObjettheque[22];
							monTableauDeStuffs[1] = maObjettheque[23];
							break;
							
						case 4:
							monTableauDeStuffs[0] = maObjettheque[27];
							monTableauDeStuffs[2] =maObjettheque[24];
							monTableauDeStuffs[3] = maObjettheque[25];
							monTableauDeStuffs[1] = maObjettheque[26];
							monTableauDeStuffs[4] = maObjettheque[28];
							monTableauDeStuffs[5] = maObjettheque[29];
							monTableauDeStuffs[6] = maObjettheque[30];
							monTableauDeStuffs[7] = maObjettheque[31];

							break;
					}
				} catch (e:Error) {
					trace ( "loadStuffs: " + e );
				}
			
		}
		
		public function initPopulation() {

			if( !this.maPopulation ) this.maPopulation = new Vector.<com.ludus.creatures.Creature>;
			
			maPopulation.push(new Canard_reptile("c1")); maPopulation.push(new Oeil_volant("c2"));
			maPopulation.push(new Araignee("c3")); maPopulation.push(new Homme_poilu("c4"));
			maPopulation.push(new Homme_poilu("c5")); maPopulation.push(new Araignee("c6"));
			maPopulation.push(new Canard_reptile("c7")); maPopulation.push(new Oeil_volant("c8"));
			maPopulation.push(new Annie("c9")); maPopulation.push(new Canard_reptile("c10"));
			maPopulation.push(new Canard_reptile("c11"));

			maPopulation.push(new Lord_Khaos("c12")); maPopulation.push(new Oeil_volant("c13"));
			maPopulation.push(new Araignee("c14")); maPopulation.push(new Annie("c15"));
			maPopulation.push(new Oeil_volant("c16")); maPopulation.push(new Araignee("c17"));
			maPopulation.push(new Canard_reptile("c18")); maPopulation.push(new Oeil_volant("c19"));
			maPopulation.push(new Araignee("c20")); maPopulation.push(new Canard_reptile("c21"));
			maPopulation.push(new Canard_reptile("c22"));
			
			maPopulation.push(new Canard_reptile("c23")); maPopulation.push(new Oeil_volant("c24"));
			maPopulation.push( new Araignee("c25")); maPopulation.push( new Annie("c26"));
			maPopulation.push(new Oeil_volant("c27")); maPopulation.push(new Araignee("c28"));
			maPopulation.push( new Canard_reptile("c29")); maPopulation.push( new Oeil_volant("c30"));
			maPopulation.push( new Araignee("c31")); maPopulation.push( new Canard_reptile("c32"));
			maPopulation.push( new Canard_reptile("c33"));
			
			maPopulation.push( new Canard_reptile("c34")); maPopulation.push( new Oeil_volant("c35"));
			maPopulation.push( new Araignee("c36")); maPopulation.push( new Annie("c37"));
			maPopulation.push( new Oeil_volant("c38")); maPopulation.push( new Araignee("c39"));
			maPopulation.push( new Canard_reptile("c40")); maPopulation.push( new Oeil_volant("c41"));
			maPopulation.push( new Lord_Khaos("c42")); maPopulation.push( new Makura("c43"));
			maPopulation.push( new Canard_reptile("c44"));
			
			maPopulation[0].setCoordinates(7, 5);
			maPopulation[1].setCoordinates(1,18);
			maPopulation[2].setCoordinates(1,16);
			maPopulation[3].setCoordinates(3,13);
			maPopulation[4].setCoordinates(1,8);
			maPopulation[5].setCoordinates(14,8);
			maPopulation[6].setCoordinates(14,7);
			maPopulation[7].setCoordinates(14,19);
			maPopulation[8].setCoordinates(18,9);
			maPopulation[9].setCoordinates(25,2);
			maPopulation[10].setCoordinates(16,15);
			
			maPopulation[11].setCoordinates(7,6);
			maPopulation[12].setCoordinates(1,9);
			maPopulation[13].setCoordinates(1,17);
			maPopulation[14].setCoordinates(1,19);
			maPopulation[15].setCoordinates(3,13);
			maPopulation[16].setCoordinates(15,8);
			maPopulation[17].setCoordinates(15,10);
			maPopulation[18].setCoordinates(14,20);
			maPopulation[19].setCoordinates(16,16);
			maPopulation[20].setCoordinates(18,10);
			maPopulation[21].setCoordinates(25,3);
			
			maPopulation[22].setCoordinates(1,7);
			maPopulation[23].setCoordinates(1,17);
			maPopulation[24].setCoordinates(1,18);
			maPopulation[25].setCoordinates(3,13);
			maPopulation[26].setCoordinates(7,6);
			maPopulation[27].setCoordinates(14,8);
			maPopulation[28].setCoordinates(14,9);
			maPopulation[29].setCoordinates(14,19);
			maPopulation[30].setCoordinates(17,9);
			maPopulation[31].setCoordinates(17,15);
			maPopulation[32].setCoordinates(25,3);
			
			maPopulation[33].setCoordinates(1,7);
			maPopulation[34].setCoordinates(1,12);
			maPopulation[35].setCoordinates(1,19);
			maPopulation[36].setCoordinates(3,13);
			maPopulation[37].setCoordinates(7,6);
			maPopulation[38].setCoordinates(14,6);
			maPopulation[39].setCoordinates(14,7);
			maPopulation[40].setCoordinates(14,18);
			maPopulation[41].setCoordinates(27,24);
			maPopulation[42].setCoordinates(28,24);
			maPopulation[43].setCoordinates(25,3);
		}
		

		
		public function Evenements() 
		{
			
			this.initPopulation(); this.initObjettheque();
			
			this.loadStuffs(Global.numLevel);
			this.loadCreatures(Global.numLevel);
			
			// set real size
			for each(var s:Stuff in monTableauDeStuffs) 
			{
				
				if(getQualifiedSuperclassName( s) == "com.ludus.stuffs::Arme") {
					s.width *= s.tailleRatio;
					s.height *= s.tailleRatio;
				}
				
			}
			
			// Globalisation
			Global.EVENEMENTS = this;
		}
		
		public function getLabyrinthe(Lab) 
		{
			this.that = Lab;
		}
		
		
		public function displayCreature(_creature:Creature, element:String, that:Labyrinthe) 
		{

			(that.getChildByName(element) as MovieClip).addChild(_creature as MovieClip);
			
			Creature.get_creature_position(_creature);
			
		}

		public function displayStuff(_stuff:Stuff, element:String, that:Labyrinthe) 
		{
			
			try{
				
				var el, isAmbiance:Boolean, gridName:String;
			
				switch(getQualifiedSuperclassName( _stuff)) {
				
					case "com.ludus.stuffs::Arme":
						_stuff.rotation = 45; // mise en position du sol
						_stuff.y = -25;
						gridName = element;
						break;
						
					case "com.ludus.stuffs::Door":
						(_stuff as Door).reposition(element);
						break;
				}
				
				if ( isAmbiance = Utx.isAmbiance(_stuff) ) {
					gridName = element;
				} else if (Utx.isDmy(_stuff)) {
					gridName =  "dmy_" + element;
				} else {
					gridName = element;
				}
				
				el = (that.getChildByName( gridName ) as MovieClip);
				el.addChild(_stuff as MovieClip);
				el.mouseEnabled = false;
				
			} catch (e:Error) {
				
				trace("displayStuff: " + e);
				
			} finally {

				switch(true){
					case (getQualifiedClassName(_stuff) == "com.ludus.stuffs::Baton"):
						_stuff.scaleX = 1.5;
						_stuff.scaleY = 1.5;
						break;
					case getQualifiedClassName(_stuff) == "com.ludus.stuffs::ray_plafond":
						if (Global.Lab.orientation == "top" || Global.Lab.orientation == "left"){
							
							_stuff.scaleX = -1;
						}
						else{
							
							_stuff.scaleX = 1;
						}
						break;
				}
			}
		}
	}
}