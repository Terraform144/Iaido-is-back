package com.ludus.DM
{
	import flash.display.MovieClip;
	
	public class Element extends MovieClip
	{
		public var id;
		public var labElement:MovieClip;
		
		// ligne et colonne
		private var ligne;
		private var colonne;
		
		// fictive position
		public var topFictive = {l:0,c:0};
		public var leftFictive = {l:0,c:0};
		public var bottomFictive = {l:0,c:0};
		public var rightFictive = {l:0,c:0};
		
		public function Element(_id, _mc:MovieClip, _topFictive, _leftFictive, _bottomFictive, _rightFictive)
		{
			super();
			
			this.id = _id;this.labElement = _mc;
			this.topFictive = _topFictive, this.leftFictive = _leftFictive,
			this.bottomFictive = _bottomFictive, this.rightFictive = _rightFictive
			
		}
		
		public function setCoordinate(_ligne, _colonne)
		{
			this.ligne = _ligne; this.colonne = _colonne;
		}
	}
}