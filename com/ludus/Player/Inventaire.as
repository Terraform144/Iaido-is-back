package com.ludus.Player {

    import com.ludus.stuffs.Stuff;
    import com.Utx;
    import flash.display.MovieClip;
    
    /**
     * Player inventory class
     * @author Gamegü
     */
    public class Inventaire extends MovieClip {
        
        private var _items:Array = [];

 // Constructor

        public function Inventaire() {
           
            super();
            
            this.addEventListener(Event.ADDED_TO_STAGE, init);

        }

// Properties

        public function getItem(_id:Stuff):Stuff { // todo
            
            //get

            //remove from _items array
        }

        public function addItem(_item:Stuff):void {
            _items.push(_item);
        }

        public function displayItems():void { // todo
            // Display items in the inventory
            for each (var item:Stuff in _items) {
                // Logic to display each item
                // trace("Displaying item: " + item.id);
            }
        }

        public function manageItems():void { // todo
            
            // Logic to manage items in the inventory
            // e.g., sorting, filtering, etc.
        }
    }

}