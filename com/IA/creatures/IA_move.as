package com.IA.creatures
{
	import com.ludus.DM.Evenements;
	import com.ludus.creatures.Creature;

	import flash.display.MovieClip;
	import com.Utx;
	import flash.utils.getQualifiedClassName;
	/*
		activités : biologie, algèbre, functions, géométrie -> impressive 
		astrophysique : dérivées et intégrales
	*/
	public class IA_move extends MovieClip
	{
		public function IA_move()
		{
			super();
		}
		
		public function move() {
			
			/**
			 * 
			 * weight in movement
			 */
			var l,c;
			// todo a random movement from immediate squares
			// todo replace by decision of direction ... set a little memory for creatures that escapes the player
			for each (var creature:Creature in Global.EVENEMENTS.monTableauDeCreatures) 
			{
				l = creature.getCoordinates().l;
				c = creature.getCoordinates().c;
				// if in the visibility of the user
				if(l!=0 && creature != Global.CLICK_CREATURE && creature.life >0) // if creature alive and not last Clicked
				{	
					try {
						var res_l = Utx.rnd(0,3); res_l= (res_l-2);
						var res_c = Utx.rnd(0,3); res_c= (res_c-2);
						
						var isHorizontal = Utx.rnd(0,2)%2?true:false;
						
						if(isHorizontal) // creature moves horizontally of vertically
						{
							if(Global.Lab.caseExist(l+res_l,c)
								&& !Global.Lab.dl.entiteSurCase (
									{l:(l+res_l),c:c}, creature
									)
								&& !Global.Lab.dl.cursorSurCase (
									{l:(l+res_l),c:c}
									)
								&& !Global.Lab.dl.massiveObjectSurCase (
									{l:(l+res_l),c:c}, creature
								)
							) {
								// if it's a MurAttack
								switch(getQualifiedClassName(creature)) {
									case 'com.ludus.creatures::MurAttack':
										if(Global.IS_M21 && Global.Lab.position.c==5) {// faire bouger que si Global.IS_M21
											creature.setCoordinates(( (l<4) ? (l+1) : l), c) ; //si mur arrive au mur de droite, il n'avance plus
											if ( (Global.Lab.position.c==5) && (Global.Lab.position.l==l+1) && (Global.Lab.position.l<4) )
											{
												(Global.Lab.position.l<4)?(Global.Lab.position.l += 1):(Global.Lab.position.l);
											}
											if (Global.Lab.position.l<=5 && l<=4 && Global.Lab.position.c == 5)
											{
												creature.addCreatureToCombat(creature);
											}
										}
										break;
										
									default:
										creature.setCoordinates(l+res_l,c); // faire bouger que si Global.IS_M21
								}
							}
								 
						} else {
							if(Global.Lab.caseExist(l,c+res_c)
								&& !Global.Lab.dl.entiteSurCase(
									{l:l,c:(c+res_c)}, creature
								)
								&& !Global.Lab.dl.cursorSurCase(
									{l:l, c:(c + res_c)}
									)
								&& !Global.Lab.dl.massiveObjectSurCase (
									{l:l, c:(c + res_c)}, creature
								)
							)  {
								switch(getQualifiedClassName(creature)) {
									case 'com.ludus.creatures::MurAttack':
										if(Global.IS_M21) {
											//creature.setCoordinates(l,c+res_c);
										}
										break;

									default:
										creature.setCoordinates(l,c+res_c); // faire bouger que si Global.IS_M21
								}
						}}
						
						if (creature != Global.CLICK_CREATURE) creature.updatePositionOnMap();
						
					}catch(e:Error) {
						//
						trace("move : "+e);
					}finally{
						//
						Global.Lab.dl.showWalls(Global.Lab.orientation,Global.Lab.position);
					}
				}
			}
		}
	}
}