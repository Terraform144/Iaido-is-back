package com.IA.creatures 
{
	/**
	 * ...
	 * @author zulad
	 */
	public class IA_sense 
	{
		
		public function IA_sense() 
		{
			/* like vision simulate the sense of the creature 
			-- see interaction of a sonar if sgnl received touched some other enemy - then charge and strike
			
			// nota : implement recognition and sense of enemy*/
		}
		
		public function audition(entity) {
			// todo !.1 - like vision gets a signal
			
			/*  the sense of audition like a radar gets feeds wich works like chunks of signals (invisible monition moving forward) touching the target. 
				if their is no contact, their is no sound. !! remember the gamecodeur.fr folk who giv me this trick.
			*/ 
			
		}
		
		public function isAudible(entity) {
			// touching signal or not
		}
	}

}