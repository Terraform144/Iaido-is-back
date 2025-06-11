package com.ludus.Player {

    import com.ludus.stuffs.Stuff;
    import com.Utx;
    import flash.display.MovieClip;
    
    /**
     * Player inventory class
     * @author Gamegü
     */
    public class Inventory extends MovieClip {
        
        private var _items:Array = []; 
 // Constructor

        public function Inventory(_item_list:Array) {
            super();
            _items = _item_list || [];
			
        }

// Properties

        public function getItem(_id: int):Stuff {
            // Retrieve an item by its ID from the inventory
			var item:Stuff;
            try {
                var index:int = _items.indexOf(_id);
                if (index != -1) 
                {
                    item = _items.splice(index, 1)[0];
                }
            } catch(error:Error) {
                trace("Error retrieving item: " + error.message);
            }
			return item;
        }

        public function addItem(_item:Stuff):void {
            _items.push(_item);
        }

        public function displayItems():void { // todo
            
        }

        public function manageItems():void { // todo
            // Logic to manage items in the inventory
            // e.g., sorting, filtering, etc.
        }

// UI

        /**
         * Displays the inventory panel with items
         */ // TODO refaire ceci pour que cela soit plus générique et prenne en entrée un tableau de string pour faire le display des objets dans les inventaires --> UTX ??
        public function displayInventaire():void {

            var p_inv_alter = Global.ROOT_CLIP.getChildByName("pan_inventaire_alter");
			var posX = (p_inv_alter.getChildByName("case_i_0")).width/2;
			var posY = (p_inv_alter.getChildByName("case_i_0")).height/2;
			p_inv_alter.visible = true;

            try {
                for(var i= 0; i < _items.length; i++) {
// trace(_items[i]+' '+"case_i_"+i);
					var obj = Utx.get_objectByName(_items[i]); obj.x += posX; obj.y += posY;
                     // flush all previous children in the inventory panel
                    Utx.removeAllChildren(p_inv_alter.getChildByName("case_i_"+i));
                    p_inv_alter.getChildByName("case_i_"+i).addChild(obj); 
                }
            } catch (e:Error) {
                trace("Error displaying inventory panel: " + e.message);
            }
        }
        
        public function hideInventaire():void {
            //p_inv_alter.visible = false;
        }
    }

}