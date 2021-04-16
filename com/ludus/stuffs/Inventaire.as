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
		private var objet_cou = null;
		private var potion = null;
		private var grimoire = null;
		
		private var objet_baton:Vector.<Stuff> = new Vector.<Stuff>(3);
		
		public function Inventaire()
		{
			this.init();
			Global.PanInventaire = this;
		}
		
		private function init() 
		{
			objet_baton[1] = null;
			objet_baton[2] = null;
			objet_baton[3] = null;
			
			objet_compatibles[1] = "com.ludus.stuffs::Baton";
			objet_compatibles[2] = "com.ludus.stuffs::Tonfa";
			objet_compatibles[3] = "com.ludus.stuffs::Falchion";
			objet_compatibles[4] = "com.ludus.stuffs::Longsword";
		}
		
		public function isCompatible(_stuff:Stuff)
		{
			if( this.objet_compatibles.indexOf(getQualifiedClassName(_stuff)) < 0)
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
					if (getQualifiedClassName(_stuff) == 'com.ludus.stuffs::Baton' && !Global.IS_BATON) 
					{
						var tab_inventaire = Global.ROOT_CLIP.getChildByName("tab_inventaire");
						tab_inventaire.nextFrame();
						var pan_inv = Global.ROOT_CLIP.getChildByName("pan_inventaire");
						var mc_b = pan_inv.getChildByName("mc_baton");
						mc_b.visible = true; mc_b.alpha = 0.5; Global.IS_BATON = true;
					}
					break;
				case "com.ludus.stuffs::Object_cou":
					if(objet_cou==null)
						objet_cou = _stuff;
					break;
				case "com.ludus.stuffs::Fiole":
					if(this.potion==null)
						potion = _stuff;
					break;
				case "com.ludus.stuffs::Grimoire":
					if(this.grimoire==null)
						grimoire = _stuff;
					break;
				case "com.ludus.stuffs::Objet_baton":
					if(objet_baton.length <3) {
						objet_baton.push(_stuff);	
					}
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
				case "com.ludus.stuffs::Object_cou":
					if(objet_cou!=null)
						objet_cou = null;
					break;
				case "com.ludus.stuffs::Fiole":
					if(this.potion!=null)
						potion = null;
					break;
				case "com.ludus.stuffs::Grimoire":
					if(this.grimoire!=null)
						grimoire = null;
					break;
				case "com.ludus.stuffs::Objet_baton":
					if(objet_baton.length <3) {
						objet_baton.push(_stuff);	
					}
					break;
			}
		}
	}
}