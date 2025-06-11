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
		public var stats = {mana:320, life:450, dangerousness:30}; // todo restore to 300

		private var _items:Array = [];
		
		public var life:int;
		public var l_hand;
		
		public var inventaire:Inventaire;
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
Global.SOUNDMANAGER.playSound('slash');
				if(l_hand.y>160)
				{
					l_hand.rotation = -5;
					l_hand.y -= 40; l_hand.x -= 20;
Global.BRST.x = 248; Global.BRST.y = 224;
				}
				
//trace("attackLHand FIST:" + l_hand.y);
			} else {
Global.SOUNDMANAGER.playSound('punch');
Global.BRST.x = 260; Global.BRST.y = 241;
				if (l_hand.y > 160) {
					
					l_hand.rotation = 0; l_hand.y -= 30; l_hand.x += 50;
					
				}
//trace("attackLHand PUNCH:"+l_hand.y);
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
			l_hand.rotation = 0;
		}
		
		public function resetPlayer() {
			this.life = this.stats['life'];
			Global.IS_COMBAT = false;
			Global.isGameover = false;
		}
		
		private function setWeapon(_arme)
		{
			Global.HandWeapon = _arme;
			Global.IS_MAP = false;
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
		public function prendre(_stuff:Stuff,isInventaire:Boolean = false)
		{
			//if(_stuff.is_adjacent()) {
				try 
				{
					releaseWeapon(); // relache l'arme dans la main gauche
					
					// todo redo this : qd objet pris pas tjs dans inventaire mais dans les mains...
					if(inventaire.isCompatible(_stuff))
					{
						
						// place weapon in left hand
						l_hand.gotoAndStop(Utx.getLittleClassName(getQualifiedClassName(_stuff)));
						
						Global.BRST = Global.PLAYER.l_hand.getChildByName("burst");
						objects_manager.removeFromGrid(_stuff); // on retire l'objet de la grille
						//  msg_player.setMessage(
						//	Utx.getLittleClassName(getQualifiedClassName(_stuff))
						//	+ " taken");
						
						if (getQualifiedSuperclassName(_stuff) == "com.ludus.stuffs::Arme")
						{// check si il s'agit d'une arme qui a été prise pour la préparer sur le player
							setWeapon(_stuff);
						}
						
					}
					
				} catch (e:Error) {

					trace("prendre:"+e);

				}
			//}
		}
		
		public function setItem(_item:MovieClip = null):void
		{ /** THIS SET A NEW ITEM IN THE ITEMS ARRAY LIST */
			if (_item && _items.length < 8) {
				_items.push(_item.getChildAt(1).name);
				_item.removeChild(_item.getChildAt(1));
				_item.alpha = 1;
			}
			Global.PLAYER.displayInventaire();
//trace("Items in Player: " + _items.length + " - " + _items[_items.length - 1]);
		}

        /**
         * Displays the inventory panel with items
         */ // TODO refaire ceci pour que cela soit plus générique et prenne en entrée un tableau de string pour faire le display des objets dans les inventaires --> UTX ??
        public function displayInventaire():void {

            var p_inv_alter = Global.ROOT_CLIP.getChildByName("pan_inventaire");
			var posX = (p_inv_alter.getChildByName("case_iaido_0")).width/2;
			var posY = (p_inv_alter.getChildByName("case_iaido_0")).height/2;
			p_inv_alter.visible = true;

            try {
                for(var i= 0; i < _items.length; i++) {
// trace(_items[i]+' '+"case_i_"+i);
					var obj = Utx.get_objectByName(_items[i]); obj.x += posX; obj.y += posY;
                     // flush all previous children in the inventory panel
                    Utx.removeAllChildren(p_inv_alter.getChildByName("case_iaido_"+i));
                    p_inv_alter.getChildByName("case_iaido_"+i).addChild(obj); 
                }
            } catch (e:Error) {
                trace("Error displaying inventory panel: " + e.message);
            }
        }

		/**
	 	* relacher permet de rendre ce qu'il y a dans la main gauche
	 	*/
		public function relacher(_stuff:Stuff)  
		{// todo refactor - redefine
			try {

				inventaire.retirer(_stuff);
				objects_manager.releaseOnGrid(_stuff);
				_stuff.updatePositionOnMap();
				
			} catch (e:Error) {

				trace("relacher:"+e);

			}
		}
	}
}