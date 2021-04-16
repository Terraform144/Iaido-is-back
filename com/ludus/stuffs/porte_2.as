package com.ludus.stuffs {
	
	import flash.display.MovieClip;
	
	
	public class porte_2 extends Door {
		
		public function porte_2(_id, _orientation, _coordinates) {
			
			super(_id, _orientation);
			
			this.setCoordinates(_coordinates.l,_coordinates.c);
		}
	}
	
}
