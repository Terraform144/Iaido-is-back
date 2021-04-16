package com.managers
{
	import com.mc_creature;
	import com.ludus.stuffs.Stuff;
	
	import flash.display.MovieClip;
	
	/**
	 * Cette classe gère all the objects on ground
	 * release on ground, dissapearing 
	 */
	public class ObjetcsManager
	{
		public function ObjetcsManager()
		{
			//this.init();
		}
		
		
		
		public function releaseOnGrid(_stuff:Stuff)
		{
			try{
				var mc:MovieClip = new mc_creature(); mc.name = _stuff.id;
				var cs:MovieClip = Global.map.getChildByName("_" + Global.Lab.position.l + "$"+Global.Lab.position.c);
				Global.map.addChild(mc);
				mc.x = cs.x; mc.y = cs.y;
				_stuff.setCoordinates( Global.Lab.position.l,  Global.Lab.position.c);
				Global.Lab.dl.showWalls(Global.Lab.orientation,Global.Lab.position);
			}catch (e){trace("releaseOnGrid : "+e);}

		}
		
		public function removeFromGrid(_stuff:Stuff)
		{
			try{
				var mc = Global.map.getChildByName(_stuff.id);
				Global.map.removeChild(mc);
				Global.Lab.dl.showWalls(Global.Lab.orientation,Global.Lab.position);
			}catch (e){trace("removeFromGrid : "+e);}
			
		}
	}
}