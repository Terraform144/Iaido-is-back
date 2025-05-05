package com.ludus.stuffs
{
	import flash.display.MovieClip;
	import flash.utils.getAliasName;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import com.Utx;
	import flash.utils.getQualifiedSuperclassName;
	import com.managers.ObjetcsManager;
	
	public class Inventaire extends MovieClip
	{
		private var objet_compatibles:Vector.<String> = new Vector.<String>(4);
		
		private var arme = null;
		private var potion = null;
		
		public function Inventaire()
		{
			this.init();
			Global.PanInventaire = this;
		}
		
		private function init() 
		{
			objet_compatibles[1] = "com.ludus.stuffs::Baton";
			objet_compatibles[2] = "com.ludus.stuffs::Tonfa";
			objet_compatibles[3] = "com.ludus.stuffs::Falchion";
			objet_compatibles[4] = "com.ludus.stuffs::Longsword";
		}
		
		public function isCompatible(_stuff:Stuff)
		{
			if (this.objet_compatibles.indexOf(getQualifiedClassName(_stuff)) == -1)
				return false;
			else
				return true;
		}
		
		public function placer(_stuff:Stuff) 
		{
			var class_name = getQualifiedClassName(_stuff);
			var superclass_name = getQualifiedSuperclassName(_stuff);
			// todo
			switch ( superclass_name ) 
			{
				case "com.ludus.stuffs::Arme":
					// todo il peut prendre toutes les armes ...
					arme = _stuff;
					break;
				case "com.ludus.stuffs::Fiole":
					if(this.potion==null)
						potion = _stuff;
					break;
			}
		}
		
		public function retirer(_stuff:Stuff)
		{
			var class_name = getQualifiedClassName(_stuff);
			var superclass_name = getQualifiedSuperclassName(_stuff);
			// todo
			switch ( superclass_name ) 
			{
				case "com.ludus.stuffs::Arme":
					if(arme != null)
					arme = null;
					break;
				case "com.ludus.stuffs::Fiole":
					if(this.potion!=null)
						potion = null;
					break;
			}
		}
	}
}