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
	import com.ludus.creatures.MurAttack;
	import com.ludus.creatures.Coffre;
	import com.ludus.creatures.Roboto;
	import com.ludus.creatures.Skeleton;

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
	import com.ludus.stuffs.caveau;
	import com.ludus.stuffs.stairs_down;
	import com.ludus.stuffs.stairs_up;
	import com.ludus.stuffs.MarieStatue;
	import com.ludus.stuffs.Coffre_1;

	import com.ludus.cinematiques.murAttaque;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.GameInputEvent;
	import flash.utils.getDefinitionByName;
	import flash.utils.Dictionary;
	
	import com.Utx;
	
	import flash.utils.getQualifiedSuperclassName;
	import flash.utils.getQualifiedClassName;
	
	/**
	 * Cette classe reprend tout ce que l'on peut vivre dans le labyrinthe
	 */
	public class Evenements
	{
		public var that;
		
		public var monTableauDeCreatures:Vector.<Creature>;public var maPopulation:Dictionary;

		public var monTableauDeStuffs:Vector.<Stuff>; public var maObjettheque:Vector.<Stuff>;
		public var monTableauArtefacts:Vector.<Object>;
		
		private const DISTANCE:int = 3;
		
		public function loadCreatures(numLevel) {
			
			this.monTableauDeCreatures = new Vector.<com.ludus.creatures.Creature>;
			{// creatures
				
				try{
						
					switch (Global.numLevel) 
					{
						case 1:
							// level 1
							monTableauDeCreatures[0] = maPopulation['araignee'];
							monTableauDeCreatures[1] = maPopulation['poilu'];
							monTableauDeCreatures[2] = maPopulation['roboto1'];
							break;				
							
						case 2:
							// level 2
							monTableauDeCreatures[0] = maPopulation['lordtwin'];
							monTableauDeCreatures[1] = maPopulation['oeil1'];
							monTableauDeCreatures[2] = maPopulation['speedy'];
							monTableauDeCreatures[3] = maPopulation['mur'];
							break;
							
						case 3:
							// level 3
							monTableauDeCreatures[0] = maPopulation['skelet1'];
							break;
							
						case 4:
							// level 4
							monTableauDeCreatures[0] = maPopulation['lord'];
							monTableauDeCreatures[1] = maPopulation['coffre'];
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
			maObjettheque[33] = (new MarieStatue("statue_110", "Marie Statue"));
			maObjettheque[34] = (new Coffre_1("coffre_10"));
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
						monTableauDeStuffs[14] = maObjettheque[34];
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
						
						monTableauDeStuffs[7] = maObjettheque[20];
						monTableauDeStuffs[8] = maObjettheque[21];
						
						// weapon
						monTableauDeStuffs[9] = maObjettheque[32];
						break;
						
					case 3:
						monTableauDeStuffs[0] = maObjettheque[22];
						monTableauDeStuffs[1] = maObjettheque[23];
						monTableauDeStuffs[3] = maObjettheque[33];
						break;
						
					case 4:
						monTableauDeStuffs[0] = maObjettheque[27];
						monTableauDeStuffs[2] = maObjettheque[24];
						monTableauDeStuffs[3] = maObjettheque[25];
						monTableauDeStuffs[1] = maObjettheque[26];
						monTableauDeStuffs[4] = maObjettheque[28];
						monTableauDeStuffs[5] = maObjettheque[29];
						monTableauDeStuffs[6] = maObjettheque[30];
						break;
				}
				
				// update position of stuff symbol on map
				for each (var s:Stuff in monTableauDeStuffs) {
					var bool = true;
					switch (getQualifiedSuperclassName(s)) {
						case 'com.ludus.stuffs::Stairs':
							bool = false;
							break;
						case 'com.ludus.stuffs::Door':
							bool = false;
							break;
					}
					if(bool) s.updatePositionOnMap();
				}

			} catch (e:Error) {
				trace ( "loadStuffs: " + e );
			}
			
		}
		
		public function initPopulation() 
		{

			maPopulation = new Dictionary();
			if( !this.maPopulation ) this.maPopulation = new Vector.<com.ludus.creatures.Creature>;
			
			// creatures du niveau 1
			maPopulation['araignee'] = new Araignee("c_1_5"); maPopulation['poilu']=new Homme_poilu("c_1_10");
			maPopulation['roboto1'] = new Roboto("c_1_15");

				// coordonnées des créatures
				// 1ere population
				maPopulation['araignee'].setCoordinates(1, 18); //5
				maPopulation['poilu'].setCoordinates(1,9);
				maPopulation['roboto1'].setCoordinates(6,17);

			// creatures du niveau 2
			maPopulation['lordtwin'] = new Lord_Khaos("c_2_5"); maPopulation['oeil1'] = (new Oeil_volant("c_2_10")); 
			maPopulation['speedy'] = (new Araignee("c_2_15")); maPopulation['mur']=(new MurAttack("c_2_20")); 
			
				// coordonnées des créatures
				// 2eme population
				maPopulation['lordtwin'].setCoordinates(1,19); //5
				maPopulation['oeil1'].setCoordinates(1,17);
				maPopulation['speedy'].setCoordinates(1,9); //15
				maPopulation['mur'].setCoordinates(1,5);

				
			// creatures du niveau 3
			maPopulation['skelet1']=new Skeleton("c_3_5"); 

				// coordonnées des créatures
				// 3eme population
				maPopulation['skelet1'].setCoordinates(23,9); //5


			maPopulation['lord']= new Lord_Khaos("c_4_5"); maPopulation['coffre']= new Coffre("c_4_10");

				// coordonnées des créatures
				// 4eme population
				maPopulation['lord'].setCoordinates(27,24); //5
			    maPopulation['coffre'].setCoordinates(15,9); //5			
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

			if( !Global.IS_M21 && (getQualifiedClassName(_creature) == "com.ludus.creatures::MurAttack") ) {
				if((Global.numLevel == 2) && (Global.Lab.position.l == 2) && (Global.Lab.position.c == 4)) {
					// mur
					Global.CINEMATIQUE = Global.ROOT_CLIP.getChildByName("dmy_anim");
					Global.SOUNDMANAGER.playSound('tension');
					var murAttack = new murAttaque();
					Global.CINEMATIQUE.addChild(murAttack);
					Global.IS_M21 = true;
				}
			}else {
				//
			}

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

//Utx.pixelate(_stuff,8);
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