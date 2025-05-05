package com.ludus.data 
{
	import com.ludus.stuffs.porte_1;
	/**
	 * ...
	 * @author zulad
	 */
	public class Furniture 
	{
		
		protected var furniture:Array = new Array(26, 20); // todo
		
		
		public function Furniture() 
		{
			
			furniture[6, 19] = new porte_1();
			
		}
		
		public function getFurniture(coordinate, orientation) {
			// todo
		}
	}
	
}