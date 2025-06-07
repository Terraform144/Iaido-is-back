package com.ludus.stuffs {
	
	import flash.display.MovieClip;
	import com.Utx;
	
	public class porte_2 extends Door {
		
		public function porte_2(_id, _orientation, _coordinates) {
			
			super(_id, _orientation);
			
			this.setCoordinates(_coordinates.l,_coordinates.c);
		}

		override public function reposition(_el:String) {
			var theCasePos:String = _el.split("_")[1], val:int;
			
			switch(Global.Lab.orientation) {
				
				case 'top' :
					
					if (this.orientation == 'HORIZONTAL') {
						//trace("top horizontal");
						if(Global.IsOpen >= 1)
							this.gotoAndStop(3);
						else
							this.gotoAndStop(1); 
						switch(theCasePos) {
							
							case 'r': val = 1; 	break;
							case 'l': val = -1; break;
							case 'm': val = 1; 	break;
							
						}
					} else {
						//trace("top VERTICAL");
						if(Global.IsOpen >= 1)
							this.gotoAndStop(3);
						else
							this.gotoAndStop(1);
						switch(theCasePos) {
							
							case 'r': val = -1; 	break;
							case 'l': val = 1; 		break;
							case 'm': val = 1; 	break;
						}
					}
					break;
					
				case 'bottom' :
					
					if (this.orientation == 'HORIZONTAL') {
						//trace("bottom horizontal");
						if(Global.IsOpen > 1)
							this.gotoAndStop(4);
						else
							this.gotoAndStop(2);
						switch(theCasePos) {
							
							case 'r': val = 1; 		break;
							case 'l': val = -1;	break;
							case 'm': val = -1;		break;
						}
					} else {
						//trace("bottom vertical");
						if(Global.IsOpen >= 1)
							this.gotoAndStop(3);
						else
							this.gotoAndStop(1); 
						switch(theCasePos) {
							
							case 'r': val = -1;	break;
							case 'l': val = -1;	break;
							case 'm': val = -1;	break;
						}
					}
					break;	
				case 'right' :
					
					if (this.orientation == 'HORIZONTAL') {
						
						//trace("right horizotal");
						if(Global.IsOpen >= 1)
							this.gotoAndStop(3);
						else
							this.gotoAndStop(1); 
						switch(theCasePos) {
							
							case 'r': val = 1; 	break;
							case 'l': val = -1; break;
							case 'm': val = 1; 	break;
						}
					} else {
						//trace("right vertical");
						if(Global.IsOpen >= 1)
							this.gotoAndStop(4);
						else
							this.gotoAndStop(2); 
						switch(theCasePos) {
							
							case 'r': val = 1; 	break;
							case 'l': val = -1; break;
							case 'm': val = 1; 	break;
						}
					}
					break;
				case 'left' :
					
					if (this.orientation == 'HORIZONTAL') {
						
						//trace("left horizontal");
						if(Global.IsOpen >= 1)
							this.gotoAndStop(3);
						else
							this.gotoAndStop(1); 
						switch(theCasePos) {
							
							case 'r': val = 1; 	break;
							case 'l': val = -1; break;
							case 'm': val = -1; 	break;
						}
					} else {
						//trace("left vertical");
						if(Global.IsOpen >= 1)
							this.gotoAndStop(4);
						else
							this.gotoAndStop(2);
						switch(theCasePos) {
							
							case 'r': val = 1; 	break;
							case 'l': val = -1; break;
							case 'm': val = -1; 	break;
						}
					}
					break;
			}
			this.scaleX = val;
			
		}
	}
	
}
