package com.admobutils {

	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
    
    /** Button Layout */
	class ButtonLayout
	{
		private var buttons:Array;
		private var rect:Rectangle;
		private var padding:Number;
		private var parent:DisplayObjectContainer;
		
		public function ButtonLayout(rect:Rectangle,padding:Number)
		{
			this.rect=rect;
			this.padding=padding;
			this.buttons=new Array();
		}
		
		public function addButton(btn:SimpleButton):uint
		{
			return buttons.push(btn);
		}
		
		public function attach(parent:DisplayObjectContainer):void
		{
			this.parent=parent;
			for each(var btn:SimpleButton in this.buttons)
			{
				parent.addChild(btn);
			}
		}
		
		public function layout():void
		{
			var btnX:Number=rect.x+padding;
			var btnY:Number=rect.y;
			for each( var btn:SimpleButton in this.buttons)
			{
				btn.width=rect.width-(padding*2);
				btnY+=this.padding;
				btn.x=btnX;
				btn.y=btnY;
				btnY+=btn.height;
			}
		}
	}
}