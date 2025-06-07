package com.ludus.creatures {
	
	import com.Utx;
	import com.msg_player;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.geom.Transform;
	
	import fl.motion.Color;
	import com.managers.InjuryManager;
	
	public class Creature extends MovieClip {
		
		public var firstName:String = '';
		public var id:String;
		public var alive:Boolean = true;
		public var life:int;
		public var time_of_dead:int = 0;
		public var touched_square = "_0#0";
		
		// stats of the creature for passing tests on personnality in combat, engagement, desengagement
		protected var stats:Object = {intelligence:5, agressivity:5,  nervosity:5, determination:5, dangerousness:5};
		
		private var coordinate:Object={l:0, c:0, orientation:"TOP"}; // todo orientation des creatures en m
		protected var bite:Object = {miss:0, soft:5, medium:10, hard:15};
		
		public function getFirstname() {
			return this.firstName;
		}
		
		public function Creature(_id: String) 
		{
			// Constructor code
			super();
			this.id = _id;
			
			this.addEventListener(MouseEvent.CLICK, addMeToCombat);
		}
		
		// check if user or creature is adjacent to another
		public function is_adjacent(entity:Creature) : Boolean
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
		
		public function traceCoordinates() // do getter
		{
			trace(this.coordinate.l+" "+this.coordinate.c);
		}
		
		public function getCoordinates() // do getter
		{
			return ((this.coordinate)?(this.coordinate):(false));
		}
		
		public function setCoordinates(_l:int, _c:int) // do setter
		{
			this.coordinate.l = _l; this.coordinate.c = _c;
		}
		
		public function updatePositionOnMap() {
			// creature symbol
			var creature_smb = Global.map.getChildByName(this.id);
			
			// square symbol
			var square_smb = Global.map.getChildByName("_"+this.coordinate.l+"$"+this.coordinate.c);
			
			// place creature symbol on square symbol
			creature_smb.x =  square_smb.x;creature_smb.y =  square_smb.y;
		}
		
		public function addMeToCombat( e:Event )
		{
			
			try {
				
				if( this.getFirstname() == 'Makura' ) msg_player.setMessage( "Dady, help me!!" );
				
				if( this.is_adjacent( null ) )
				{
					Global.CLICK_CREATURE = this;
					Global.CLICK_ELEMENT = this.parent;
					
					if( Global.CLICK_CREATURE.life > 0 && (!Global.IS_MAP)) Global.ROOT_CLIP.gotoAndStop( "enterTheCombat" );
				}
				Global.GAMELOOP.reset_counter();

			} catch ( e:Error ) {

				trace( "addMeToCombat: " + e );

			}
			
		}

		public function addCreatureToCombat(_creature:Creature) {
			
			Global.CLICK_CREATURE = _creature;
			Global.CLICK_ELEMENT = _creature.parent;
			
			if( Global.CLICK_CREATURE.life > 0 && (!Global.IS_MAP)) Global.ROOT_CLIP.gotoAndStop( "enterTheCombat" );
		}
		
		/**
		 * strike the opponnent
		 */
		public function strikePlayer() { // see critical success & fail
			
			var impact:int = Utx.rnd(0, 4);
			var damage:int, msg:String;
			
			if (this.getFirstname() == 'Makura') {
				msg = '';
				switch(Utx.rnd(0, 6)) {case 1:msg = 'I am under spell!!'; break; case 2:msg = 'Daddy, help me!!'; break; case 3:msg = 'Uhh, help!!'; break; }
				msg_player.setMessage(msg);
				//release weapon after Makura is begging for help
				Global.PLAYER.releaseWeapon();Global.HandWeapon = null;
			}
			
			switch (impact) 
			{
				case 0:
				case 1:
					damage = this.bite.miss; Global.GAMELOOP.reset_counter();
					break;
				case 2:
					damage = this.bite.soft; Global.GAMELOOP.reset_counter();
					break;
				case 3:
					damage = this.bite.medium; Global.GAMELOOP.reset_counter();
					break;
				case 4:
					damage = this.bite.hard; Global.GAMELOOP.reset_counter();
					break;
			}
			Global.SOUNDMANAGER.playSound('chit_hurt');
			Global.COMBATMANAGER.impactPlayer( InjuryManager.strikePower(damage) ); // todo + coefficient multiple function of force
		}
		
		public function attack() {
			// if creature is in pos 1 of player take damage and change position then strike
			// 1. toremake
			if (this.coordinate.l != 0)
			{
				if ( Math.abs(this.coordinate.l - Global.Lab.position.l) < 2 
				&& Math.abs(this.coordinate.c - Global.Lab.position.c) < 2 && Utx.rnd(0,6)<4) // toremake coefficient of determination in attack
				{
					var pos = this.getCoordinates();
					if (!(pos.l >= 31 && pos.c == 24 && Global.numLevel == 4 && this.firstName == 'Makura')) {
						this.strikePlayer();this.gotoAndStop(2);
					} else {
						if (Global.CPT++ > 4) {
							Global.isGamewin = true;
						}
					}
				}
			}
			// 1. end toremake
		}
		
		/**
		 * This set position left or right by mirror
		 */
		public static function get_creature_position( creature: Creature ) 
		{
			if (creature.time_of_dead == 0) {
				var pos_value = Utx.rnd(0,2);
				
				switch( pos_value )
				{
					case  1: // mirror
						creature.scaleX = -1;	
						break;
					
					default:
						creature.scaleX = 1;
						break;
				}
				
				creature.gotoAndStop(1);
			} else { // creature is dead
				creature.gotoAndStop(3);
			}
		}
	}
}