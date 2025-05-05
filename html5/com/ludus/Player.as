package com.ludus
{
	import com.msg_player;
	import com.ludus.stuffs.Bag;
	import com.ludus.stuffs.Belt;
	import com.ludus.stuffs.Inventaire;
	import com.ludus.stuffs.Stuff;
	import com.Utx;
	import com.managers.ObjetcsManager;
	import com.CWeapon;
	
	import flash.utils.getQualifiedSuperclassName;
	
	import flash.display.MovieClip;
	import flash.utils.getQualifiedClassName;
	
	public class Player extends MovieClip
	{
		public var stats = {mana:300, life:9000, dangerousness:30}; // todo restore to 300
		public var life:int;
		
		public var l_hand;
			
		private var inventaire:Inventaire;
		private var bag:Bag = null;
		private var belt:Belt = null;
		
		private var objects_manager:ObjetcsManager;
		
		public var equipement = null;
		
		public function Player()
		{
			super();
			
			this.init();
		}
		
		public function init() 
		{
			this.life = this.stats['life'];
			this.l_hand = Global.ROOT_CLIP.getChildByName("l_hand");
			//
			
			inventaire = new Inventaire();
			objects_manager = new ObjetcsManager();
		}
		
		public function attackLHand() 
		{
//trace("attackLHand :" + l_hand.y);
Global.BRST.x = 260; Global.BRST.y = 241;
			if ( ! Utx.isLabel(l_hand, 'Fist') ) {

				if(l_hand.y>160)
				{
					l_hand.rotation = -5;
					l_hand.y -= 40; l_hand.x -= 20;
//Global.BRST.x = 248; Global.BRST.y = 224;
					Global.SOUNDMANAGER.playSound('hit_hurt');
				}
				
//trace("attackLHand FIST:" + l_hand.y);
			} else {
//Global.BRST.x = 260; Global.BRST.y = 241;
				if (l_hand.y > 160) {
					
					l_hand.rotation = 0; l_hand.y -= 30; l_hand.x += 50;
					Global.SOUNDMANAGER.playSound('punch');
				}
				
				
trace("attackLHand PUNCH:"+l_hand.y);
			}
			
		}
		
		public function fistPosition() {
			Global.BRST.x = 260; Global.BRST.y = 241;
			if (l_hand.currentFrameLabel == 'free')
				l_hand.gotoAndStop("Fist");
		}
		
		public function freePosition() {
			Global.BRST.x = 248; Global.BRST.y = 224;
			if (l_hand.currentFrameLabel == 'Fist')
				l_hand.gotoAndStop("free");
		}
		
		public function restoreLHand() {
			l_hand.rotation = 0; l_hand.y = 219.9; l_hand.x = -184.85;
		}
		
		public function resetPlayer() {
			this.life = this.stats['life'];
			Global.IS_COMBAT = false;
			Global.isGameover = false;
		}
		
		private function setWeapon(_arme)
		{
			Global.HandWeapon = _arme;
		}
		
		/**
		 * CORE
		 */
		public function releaseWeapon()
		{
			if ( Global.HandWeapon ) relacher(Global.HandWeapon);
		}
		
		/**
		 * prendre permet de prendre un objet et eventuellement le mettre dans l'inventaire
		 * @param	_stuff
		 */
		public function prendre(_stuff:Stuff) 
		{
			try 
			{
				releaseWeapon(); // relache l'arme dans la main gauche
					
				// todo redo this : qd objet pris pas tjs dans inventaire mais dans les mains...
				
				if(inventaire.isCompatible(_stuff))
				{
					if ( getQualifiedClassName(_stuff) == 'com.ludus.stuffs::Baton' )
					{// si on prend un baton on le met dans l'inventaire
						inventaire.placer(_stuff);
					}
					// place weapon in left hand
					l_hand.gotoAndStop(Utx.getLittleClassName(getQualifiedClassName(_stuff)));
					
					Global.BRST = Global.PLAYER.l_hand.getChildByName("burst");
					Global.BRST.x = 248; Global.BRST.y = 224;
					objects_manager.removeFromGrid(_stuff); // on retire l'objet de la grille
					msg_player.setMessage(
						Utx.getLittleClassName(getQualifiedClassName(_stuff))
						+ " taken");
					
					if (getQualifiedSuperclassName(_stuff) == "com.ludus.stuffs::Arme")
					{// check si il s'agit d'une arme qui a été prise pour la préparer sur le player
						setWeapon(_stuff);
					}
				}
				else
					msg_player.setMessage(
						Utx.getLittleClassName(getQualifiedClassName(_stuff))
						+ " released");
			} catch (e:Error) {
				trace("prendre:"+e);
			}
		}
		
		/**
		 * relacher permet de rendre ce qu'il y a dans la main gauche
		 */
		public function relacher(_stuff:Stuff)  
		{// todo refactor - redefine
			if ( getQualifiedClassName(Global.HandWeapon) == 'com.ludus.stuffs::Baton' )
			{
				msg_player.setMessage(
					Utx.getLittleClassName(getQualifiedClassName(_stuff))
					+ " stowed at the waist");
			} else {
				inventaire.retirer(_stuff);
				objects_manager.releaseOnGrid(_stuff);
				msg_player.setMessage(
					Utx.getLittleClassName(getQualifiedClassName(_stuff))
					+ " released");
			}
		}
	}
}