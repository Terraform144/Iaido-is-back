package com   {
	
	import com.IA.creatures.IA_attack;
	import com.IA.creatures.IA_move;
	import com.admobutils.AdMobClass;
	import com.admobutils.ButtonLayout;
	import com.ludus.creatures.Creature;
	import com.managers.CreaturesManager;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Scene;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import com.admobutils.SimpleButton;
//import com.milkmangames.nativeextensions.*;
//import com.milkmangames.nativeextensions.events.*;	
	
    import flash.text.TextField;
    import flash.display.Sprite;
    import flash.geom.Rectangle;
	
	public class GameLoop extends MovieClip
	{
		private var willQuit:Boolean = false;
		private var endGame:Boolean = false;
		private var underDungeon:Boolean = false;
		private var count:int = 0;
		
//private var adMob_utx:AdMobClass;
		
		public var ia_a:IA_attack;
//public var adIsVisible:Boolean;

	//
		public function GameLoop(_vitesse:int=0) 
		{
			if (_vitesse > 0) Global.GAMESPEED = _vitesse;
			
			// init the game
			Global.IS_COMBAT = false; Global.CLICK_CREATURE = null; 
			
			// init the loop
//adIsVisible=true;
			
//this.adMob_utx = new AdMobClass();
			
			// start the loop
			this.restart_game_loop();
			
		}
		
		private function loop(delay:Number):void {
			var timer:Timer = new Timer(delay, 1);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
		}
		
		public function restart_game_loop():void 
		{
			this.loop(Global.GAMESPEED); 
		}
		
		public function reset_counter():void
		{
			if(count>49)
			{
				restart_game_loop();
			}
			this.count = 0;
		}
		
		/**
		 * reposition left hand
		 */
		public function positionLHand()
		{
			try{
				var l_hand = Global.ROOT_CLIP.getChildByName("l_hand");
				l_hand.getChildByName("burst").visible = false; 
				if(Global.ROOT_CLIP.currentFrameLabel == 'enterTheCombat') Utx.freezeCombatPanel(false);
				l_hand.rotation = 0; l_hand.y = 219.9; l_hand.x = -184.85;
			} catch (e:Error) {
				//
			}
			
		}
		
		/**
		 * perform all actions of the loop
		 */
		private function doActions() {
			
			if ( !willQuit) 
			{
				try {
					// actions of the move creature IA
					if (Global.IS_COMBAT) {
						Creature.get_creature_position(Global.CLICK_CREATURE);
					}
				
					// if creature is vivace - attacking
					var ia_m:IA_move = new IA_move(); ia_m.move();
					ia_a = new IA_attack(); ia_a.attack();
				
					{ // to exec finally
						if(Global.CLICK_CREATURE) {Global.Dmy.vivace_creature();}
					}
				} catch (e:Error)    {
					trace("doAction" + e.message);
				}
				
// to del
//doTraces("end loop" + (++this.count));
if(Global.PLAYER.life < 50)  doTraces("player life " + Global.PLAYER.life);
			}
			
		}
		
		/**
		 * tmp traces
		 * 
		 */
		private function doTraces(txt:String = "") {
			
			if(txt == "")
			{
				if (Global.CLICK_CREATURE) trace("timeOfDead-" + Global.CLICK_CREATURE.time_of_dead);
			} else {
				trace("doTrace:"+txt);
			}
			
		}
		
		/** 
		 * the timer loop
		 */
		private function onTimer(evt:TimerEvent):void {
			
			try 
			{
				doActions();

				// 
				if ( this.count++ < 50 && !Global.isGameover ) {
					restart_game_loop();
				}
				
				//end test
				switch(true) 
				{
					// game is succeeded
					case (Global.isGamewin) :
						Global.GAMELOOP.count = 75;
						Global.SOUNDMANAGER.playSound('pshift');
						Global.ROOT_CLIP.gotoAndStop("game_escape");
						break;
						
					// if the game is over
					case (Global.PLAYER.life < 0 ) :
						if( !Global.isGameover ) Global.SOUNDMANAGER.playSound('painscream');
						Global.isGameover = true; Global.GAMELOOP.count = 75;
						Global.ROOT_CLIP.gotoAndStop("game_over");
						
						break;
						
					case (!Global.IS_COMBAT):
						
						if (Global.ROOT_CLIP.currentFrameLabel != "startTheAdventure") {
							Global.Lab.dl.showWalls(Global.Lab.orientation, Global.Lab.position );
							Global.ROOT_CLIP.gotoAndStop("startTheAdventure"); Global.CLICK_CREATURE = null;
						}
						break;
						
					default:
						break;
				}
				
			} catch (e:Error) {
				doTraces("onTimer:" +e.toString());
			} finally {
				
				switch (this.count) { // show admob interstitial if user is awaiting too long
					
					case 2:
						Global.PLAYER.restoreLHand(); 
						if (Global.PLAYER.l_hand.currentFrameLabel == 'Fist') {
							Global.PLAYER.freePosition();
						}
						break;
					
					case 3:
						Global.COMBATMANAGER.hideBurst();
						Global.PLAYER.restoreLHand(); 
						break;
						
					case 25:
//adMob_utx.showInterstitialAd();
						doTraces("load interstitial");
						break;
				}
				
			}
//doTraces("endLoop: " + this.count.toString());
		} // end loop
		
	}
}
