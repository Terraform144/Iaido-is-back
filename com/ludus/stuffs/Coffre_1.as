package com.ludus.stuffs 
{

	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.ludus.Player.Inventory;

	/**
	 * @author zulad
	 */
	public class Coffre_1 extends Stuff
	{
		private var _items:Array = ["mFiole","mFiole","baton","mFiole","mFiole","wMap","tonfa","falchion","mFiole","longsword"];
		private var _inventaire:Inventory;

		public function Coffre_1(_id:String, name:String = "CoffreIaido") 
		{
			// Constructor
			super (_id);
			this.addEventListener(MouseEvent.CLICK, openMe);
			// init inventaire
			_inventaire = new Inventory(_items);
		}
		
		public function openMe(e:MouseEvent):void
		{
			try {
				
				if(this.currentFrame == 1) {
					this.gotoAndStop(2);
					
					this._inventaire.displayInventaire();

				} else {
					this.gotoAndStop(1);
				}
				
				_inventaire.displayItems();

			} catch(e:Error) {
				trace("Error opening inventory panel: " + e.message);
			}
		}
	}
}