package com.ludus.stuffs {
	
	import flash.display.MovieClip;
	
	
	public class caveau extends Door {
		
		
		public function caveau(_id, _orientation, _coordinates) {
			
			super(_id, _orientation);
			
			this.setCoordinates(_coordinates.l,_coordinates.c);
			// constructor code
		}
	}
	
}
