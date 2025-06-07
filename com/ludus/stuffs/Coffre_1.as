package com.ludus.stuffs 
{

	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.ludus.Player.Inventaire;
	/**
	 * ...
	 * @author ...
	 */
	public class Coffre_1 extends Stuff
	{
		private var _items:Array = ["flask","flask","katana"];
		private var _inventaire:Inventaire;

		public function Coffre_1(_id:String, name:String = "CoffreIaido") 
		{
			// Constructor
			super (_id);
			this.addEventListener(MouseEvent.CLICK, openMe);
			// init inventaire
			_inventaire = new Inventaire(); _inventaire.placeItems(_items);
		}
		
		public function openMe(e:MouseEvent):void
		{
			if(this.currentFrame == 1) {
				this.gotoAndStop(2);
			} else {
				this.gotoAndStop(1);
			}

			_inventaire.displayItems();
		}
	}

}