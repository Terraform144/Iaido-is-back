package com.managers
{
	import com.interfaces.iCombat;
	import com.ludus.Player;
	import com.ludus.creatures.Creature;
	import flash.display.MovieClip;
	import com.Utx;
	import flash.utils.getQualifiedSuperclassName;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.display.BlendMode;
	import fl.motion.Color;
	import flash.geom.ColorTransform;

	public class CombatManager
	{
		private var l_hand, brst;
		
		public function CombatManager()
		{
			super();
		}
		
		public function init() {
			l_hand = Global.ROOT_CLIP.getChildByName("l_hand");
			brst = l_hand.getChildByName("burst"); Global.BRST = brst;
		}
		
		public function attack() 
		{
			// todo
		}
		
		public function defend() 
		{
			// todo
		}
		
		public function evaluateEnemies()
		{
			// todo this must generate a list of enemies that can be hitted
		}
		
		public function hideBurst() {
			init();
			brst.visible = false; 
		}
		
		public function showBurst(damage:int, brstmode) 
		{
			if (damage > 0) {
				brst.blendMode = brstmode;
//trace(brst.visible);
				brst.visible = true; brst.txt_burst.text = damage.toString();
				combatLoop(
					Global.GAMESPEED,
					onTimer
				);
			}
		}
		
		public function impactPlayer(damage:int) 
		{
			this.init(); Global.PLAYER.fistPosition();
			
			damage = InjuryManager.getInjury(damage);
			
			showBurst(damage, "subtract"); Utx.setFrame(4, brst);
			this.tremble(Utx.rnd(2, 8));
			Global.PLAYER.life -= damage
			
			if (Global.IS_COMBAT) disengagement();
		}
		
		// Questa funcione mette la creature in bianco a tre volte
		public function flashCreature(creature:Creature) {

			// 1. Stocke la couleur d'origine
			var originalColor:ColorTransform = creature.transform.colorTransform;

			// 2. Crée un Timer pour le clignotement (500ms ici, 6 fois)
			var blinkTimer:Timer = new Timer(100, 6); // 100ms intervalle, 6 fois (donc 3 flashs)

			// 3. Variable d'état pour alterner entre blanc et original
			var isWhite:Boolean = false;

			// 4. Fonction de clignotement
			blinkTimer.addEventListener(TimerEvent.TIMER, function(e:TimerEvent):void {
				if (isWhite) {
					creature.transform.colorTransform = originalColor;
				} else {
					var whiteTint:ColorTransform = new ColorTransform();
					whiteTint.color = 0xFFFFFF;
					creature.transform.colorTransform = whiteTint;
				}
				isWhite = !isWhite;
			});

			// 5. Démarre le clignotement
			blinkTimer.start();
		}

		public function impactCreature(entity, impct) 
		{
			var crtr, plr;
			
			impct = InjuryManager.getInjury(impct); showBurst(impct, "darken");
			if (getQualifiedSuperclassName(entity) == "com.ludus.creatures::Creature")
			{
				
				crtr = entity as Creature;
				crtr.life -= impct; flashCreature(crtr);
					setScore(impct);
				if ( crtr.life < 0) {
					crtr.alive = false;
				}
			}
			
		}
		
		private function disengagement() {
			var val = Utx.rnd(0, 6);
			if (val > 5) {
				Global.IS_COMBAT = false;
			}
			
		}
		
		private function setScore(value) {
			Global.score += value;
		}
		
		private function combatLoop(delay:Number, fct:Function):void {
			var timer:Timer = new Timer(delay, 1);
			timer.addEventListener(TimerEvent.TIMER, fct);
			timer.start();
		}
		
		private function onTimer(evt:TimerEvent):void {
			
		}
		
		private function tremble(intensity:int) {
			Global.BRST = Global.PLAYER.l_hand.getChildByName("burst");

			Global.PLAYER.l_hand.rotation = intensity;
		}
	}
}