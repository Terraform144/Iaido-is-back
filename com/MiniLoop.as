package com
{
	import com.IA.creatures.IA_attack;
	import com.ludus.creatures.Creature;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.utils.flash_proxy;

	public class MiniLoop extends MovieClip
	{
		public function MiniLoop()
		{}
		
		public function pause(delay:Number, commanditaire):void 
		{
			try{
				var timer:Timer = new Timer(delay, 1);
				timer.addEventListener(TimerEvent.TIMER, onTimer );
				timer.start();
			} catch (e:Error) {
				trace('pause:'+e);
			}
		}
		
		public function doDummyActions():void 
		{
			try {
				
				switch(true) {
					case (Global.CLICK_CREATURE.life <= 0): /*creature is dead*/
						Global.CLICK_CREATURE.time_of_dead++;
						
					case (Global.CLICK_CREATURE.time_of_dead > 0):
						Global.ROOT_CLIP.gotoAndStop("startTheAdventure");
						Global.Lab.dl.showWalls(Global.Lab.orientation, Global.Lab.position);
						break;
				}
				
			} catch (e:Error) {
				trace("miniLoop_doDummyAction: " + e);
			}
		}
		
		public function doCombatActions()
		{
			try{
				
				if(!Global.CLICK_CREATURE.alive) {
					
					//
				}
				
			} catch(error) {
				
				trace("combat_panel_onTimer :" + error);
				
			} 
		}
		
		public function onTimer(event:TimerEvent, commanditaire=null):void 
		{
			try{
				
				this.doDummyActions();
				this.doCombatActions();
				
			} catch(e:Error) {
				trace("miniLoop_ontimer: "+e); 
			} finally {
				Global.GAMELOOP.positionLHand();
			}
			
//trace("endOntimer MiniLoop");
		}
	}
}