package  com {
	
	import com.ludus.creatures.*;
	import flash.display.*;
	import flash.events.*;
	import flash.utils.getQualifiedClassName;
	
	public class combat_panel extends MovieClip {
		
		public var prop_keys:Array = []; 
		public var prop_values:Array = [];		
		public var present_creature:String;
		private var miniLoop:MiniLoop;	
		
		/*
			this is the combat panel constructor
			
			it regulates the 4 attack buttons and send an event on click to engage the strike
		*/
		public function combat_panel() {
			
			try {
				
				this.mCombat_1.addEventListener(MouseEvent.CLICK, function(e:Event){ combat(0,e); });
				this.mCombat_2.addEventListener(MouseEvent.CLICK, function(e:Event){ combat(1,e); });
				this.mCombat_3.addEventListener(MouseEvent.CLICK, function(e:Event){ combat(2,e); });
				this.mCombat_4.addEventListener(MouseEvent.CLICK, function(e:Event){ combat(3,e); });
				
				miniLoop = new MiniLoop();
				
			} catch (error) {
				
			} finally {
				// continue :)
			}
			
		}
		
		public function set_present_creature_name(name:String):void {
			this.present_creature = name;
		}
		
		public function get_present_creature_name():String {
			return this.present_creature;
		}
		
		// this is the combat menu core manager
		public function combat(_key,e:Event) {
			
			try{

				Global.GAMELOOP.reset_counter();
				var l_hand = Global.PLAYER.l_hand;l_hand.rotation = -7;
				Global.PLAYER.attackLHand();
				
				var brst = Global.PLAYER.l_hand.getChildByName("burst"); Utx.setFrame(4, brst);
				brst.blendMode = "darken";
				
				// re todo -> gestion du combat - atteinte et attaque
				if(Global.IS_COMBAT) brst.visible = true; 
				
				impactCreature(Global.CLICK_CREATURE, this.prop_values[_key]);
				
				
 				// [0] todo this better
				if(e.target.text == 'quit' && Global.CLICK_CREATURE.alive )
				{
					
					Global.IS_COMBAT = false;
					Global.ROOT_CLIP.gotoAndStop("startTheAdventure");
					
					//
					if (Global.CLICK_CREATURE.life <= 0) {
						Global.CLICK_CREATURE.time_of_dead++;
					}
					Global.CLICK_CREATURE = null;
					Global.Lab.dl.showWalls(Global.Lab.orientation, Global.Lab.position);
					
				} else if (e.target.text == 'push' && Global.CLICK_CREATURE.alive) {
					
					Global.BRST.visible = false;
					
					Global.IS_COMBAT = false;
					Global.ROOT_CLIP.gotoAndStop("startTheAdventure");
					
					//
					if (Global.CLICK_CREATURE.life <= 0) {
						Global.CLICK_CREATURE.time_of_dead++;
					}
					
					Utx.repositionAfterPush(Global.CLICK_CREATURE);
					Global.Lab.dl.showWalls(Global.Lab.orientation, Global.Lab.position);
					Global.CLICK_CREATURE = null;
					
				} else {

					Utx.freezeCombatPanel(true); Global.PLAYER.fistPosition();
					if( Global.IS_COMBAT ) miniLoop.pause(1000,'combat_panel');
					
				}
				// [Ø] end
				
			} catch (error) {
trace ("combat: " + error.toString()); // todo <- delete
			} finally {
				
				try {
					
					if (Global.CLICK_CREATURE.getFirstname() == 'Makura')
					{
						msg_player.setMessage("aahH ! My Makura");
					}
					
				} catch (e) {
					// todo
				}
				
			}
		}
		
		/** impactCreature
		
			impact la creature en soustrayant les points d'éclat
			 * 
			 * todo pass to iCombat - generalize the impact to entity (player/creature)
		*/
		public function impactCreature(crtr:MovieClip, impct:int):void {
			
			Global.COMBATMANAGER.impactCreature(crtr as Creature, impct);
		}
		
		/** setPropList
			dresse la liste des propriétés de l'objet en main et les déposer dans un array
		*/
		public function setPropList(_prop_attack:Object) {
			var i=0;
			// set list
			for( var k:String in _prop_attack) {
				++i;
				this.prop_keys.push(k); 
				this.prop_values.push(_prop_attack[k]);
				(this.getChildByName("mCombat_" + i) as MovieClip).txt_combat.text = k;
			}
		}
	}
}