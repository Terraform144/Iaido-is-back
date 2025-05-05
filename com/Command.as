package com 
{
	/**
	 * ...
	 * @author zulad
	 */
	public class Command 
	{
		
		private var fnCallback:Function;

		/** Label */
		private var label:String;
		
		//
		// Public Methods
		//
		
		/** Create New Command 
		 * First Level only of F.Bardon
		 * 
		*/
		public function Command(label:String,fnCallback:Function)
		{
			this.fnCallback=fnCallback;
			this.label=label;
		}
		
		//
		// Command Implementation
		//
		
		/** Get Label */
		public function getLabel():String
		{
			return label;
		}
		
		/** Execute */
		public function execute():void
		{
			fnCallback();
		}
	}
}