package 
{
	import com.CWeapon;
	import com.Game;
	import com.GameLoop;
	import com.MiniLoop;
	import com.Testing;
	import com.dummy;
	import com.tab_inventaire;
	import com.ludus.Player;
	import com.ludus.DM.Evenements;
	import com.ludus.DM.Labyrinthe;
	import com.ludus.DM.TheCase;
	import com.ludus.creatures.Creature;
	import com.ludus.snd.painscream;
	import com.ludus.stuffs.Arme;
	import com.ludus.stuffs.Stuff;
	import com.ludus.stuffs.Hands;
	import com.ludus.stuffs.Inventaire;
	import com.managers.CombatManager;
	import com.managers.SoundManager;
	import flash.media.SoundMixer;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Stage;
	
	public class Global extends MovieClip
	{
		public static var ROOT_CLIP:MovieClip;
		public static var ROOT:DisplayObjectContainer;
		public static var GAMESPEED:int;
		public static var CINEMATIQUE;
		public static var isInventaire:Boolean;
		public static var isMenu:Boolean;
		public static var isGameover:Boolean = false;
		public static var isGamewin:Boolean = false;
		public static var numLevel:int = 1;
		public static var score:int = 0;
		public static var IS_BATON = false;
		public static var BRST;
		public static var SELECTED_ITEM:String;
		
		// Combat
		public static var HandWeapon:Arme;
		public static var PanInventaire:Inventaire;
		public static var COMBATMANAGER:CombatManager;
		
		// Sound
		public static var SOUNDMANAGER:SoundManager;
		
		// Labyrinthe objects
		public static var Dmy:dummy;
		public static var Lab:Labyrinthe;
		public static var CLICK_CREATURE:Creature;
		public static var CLICK_ELEMENT;
		public static var EVENEMENTS:Evenements;
		public static var IS_COMBAT:Boolean;
		public static var IS_ROARED:Boolean;
		public static var IS_MAP:Boolean;
		public static var GAME:Game;
		public static var PLAYER:Player;
		public static var GAMELOOP:GameLoop;
		public static var IsOpen:int = 0;
		public static var IsOpening:Boolean = true;
		public static var CPT:Number = 1;
		public static var TESTING:Testing;
		public static var handPush:Number = 1;
		
		// Labyrinthe evenements
		public static var IS_M21:Boolean;

		public static var map;
		
		public static function setNavVisible(bool:Boolean) {
			Global.Lab.right_cursor.visible = bool;
			Global.Lab.left_cursor.visible = bool;
			Global.Lab.forward_cursor.visible = bool;
			Global.Lab.cursor_to_left.visible = bool;
			Global.Lab.cursor_to_right.visible = bool;
		}
		
		public static function debug_this (str:String) {
			var db = Global.ROOT_CLIP.getChildByName("debug_com");
			db.debug_txt.text = str;
		}
		
	}
}