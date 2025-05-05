package com.managers 
{
	
	import flash.media.Sound;
	import flash.utils.getDefinitionByName; 
	
	/**
	 * ...
	 * @author zulad
	 */
	public class SoundManager 
	{
		
		private var _sndObject:Object = {};
		
		public function SoundManager() 
		{
			//
		}
		
		public function getSound(sndName)
		{
			var SoundClass:Class = getDefinitionByName("com.ludus.snd."+sndName) as Class;
			return new SoundClass(); 
		}
		
		public function playSound(sndName, maxLoop:int=1)
		{
			var snd:Sound;
			if (!_sndObject[sndName]) {
				snd = getSound(sndName);
				_sndObject[sndName] = snd;
			}
			_sndObject[sndName].play(0, maxLoop);
		}
	}
	
}