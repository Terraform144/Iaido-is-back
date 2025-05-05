package com
{
	import com.ludus.creatures.Canard_reptile;
	import com.ludus.creatures.Creature;
	import com.MiniLoop;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * This mc evoque de creature clicked into the combat panel dummy
	 */
	public class dummy extends MovieClip {
		
		public var miniloop:MiniLoop;
		
		public function dummy() {
			
			super();
			
			Global.Dmy = this;
			// todo creature doit etre vivante
			this.vivace_creature();
		}
		
		/**
		 * to check
		 */
		public function vivace_creature() {
			
			try{
				
				if ( Global.CLICK_CREATURE && Global.CLICK_CREATURE.life > 0 ) {
					this.addChild( (Global.CLICK_CREATURE as Creature) );
				}
				
			} catch (error) {
				trace("dummy.todel: " + error);
			}
			
		}
		

	}
}