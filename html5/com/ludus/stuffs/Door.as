package com.ludus.stuffs 
{
	/**
	 * ...
	 * @author zulad
	 */
	public class Door extends Stuff
	{
		
		private var orientation:String;
		
		public function Door(_id, _orientation) 
		{
			super(_id);
			this.orientation = _orientation;
		}
		
		public function reposition(_el:String) {
			var theCasePos:String = _el.split("_")[1], val:int;
			
			switch(Global.Lab.orientation) {
				
				case 'top' :
					
					if (this.orientation == 'HORIZONTAL') {
						//trace("top horizontal");
						this.gotoAndStop(2); 
						switch(theCasePos) {
							
							case 'r': val = 1; 	break;
							case 'l': val = -1; break;
							case 'm': val = 1; 	break;
							
						}
					} else {
						//trace("top VERTICAL");
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
						this.gotoAndStop(2);
						switch(theCasePos) {
							
							case 'r': val = 1; 		break;
							case 'l': val = -1;	break;
							case 'm': val = -1;		break;
						}
					} else {
						//trace("bottom vertical");
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
						this.gotoAndStop(1); 
						switch(theCasePos) {
							
							case 'r': val = 1; 	break;
							case 'l': val = -1; break;
							case 'm': val = 1; 	break;
						}
					} else {
						//trace("right vertical");
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
						this.gotoAndStop(1); 
						switch(theCasePos) {
							
							case 'r': val = 1; 	break;
							case 'l': val = -1; break;
							case 'm': val = -1; 	break;
						}
					} else {
						//trace("left vertical");
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