package com.IA.creatures
{
	import com.interfaces.iVision;
	import com.IA.FuzzyLogic;
	import com.ludus.Player;
	import com.ludus.creatures.Creature;
	
	public class IA_vision implements iVision
	{
		public function IA_vision() {
			/* 
				Les créatures peuvent mémoriser des schémas correspondant au tronçons du labyrinthe.
				Pour établir des stratégies de guet-apens, des stratégies de fuites et des opportunités de combat.
			 */
		}
		
		public function evalDistance(ent1, ent2):int {
			// todo evaluation the squares to pass if visible
			
			// fonction orientation du player ou de la creature si ent1 est creature - todo besoin d'orienter la creature
		}
		
		public function evalDangerousness(ent1, ent2):Number {
			// todo evaluate the dangerousness of combat
		}
		
		public function See(me,entity=null) {
			// todo entity, me is creature or player 
			
			var obj = {
				crisp_input: [ 	this.evalDistance(me, entity), // eval the distance between the 2 entities
								this.evalDangerousness(me, entity) ], // evan the dangerousness by fuzzy
				variables_input: [
					{
						name: "Distance",
						setsName: ["Close", "Medium", "Far"],
						sets: [
							[0,3,5,9], 		// close distance
							[7,10,13,15],	// medium
							[12,15,18,20]	// far
						]
					},
					{
						name: "Dangerousness",
						setsName: ["Light", "Medium", "Heavy"],
						sets: [
							[0,0,5,10],			// light
							[0,10,10,30],		// medium
							[10,30,40,50]		// heavy
						]
					}
				],
				variable_output: {
					name: "Desirability",
					setsName: ["Undesirable", "Desirable", "Very Desirable"],
					sets: [
						[0,0,25,50],		// id:0 -> undesirable
						[25,50,50,75],		// id:1	-> desirable
						[50,75,100,100]		// id:2	-> very
					]
				},
				inferences: [
					[2,1,0], // nfo:Distance -> close:very desirable, medium:desirable, far:undesirable
					[2,1,0]  // nfo:Dangerousness -> light:very desirable, medium: desirable, heavy: undesirable
				]
			};
			
			var fl:FuzzyLogic = new FuzzyLogic(); var percentage = fl.getResult(obj);
		
		// 
		return {percentage, me, entity};
		}
		
		private function setFirstOpponent4Combat():Creature {
			// todo with logic
		}
		
		private function getAllOpponents(coordinates:Object=null):Vector.<Creature> {
			// todo
		}
		
		private function isVisible() {
			// equal is audible !!!! radar
		}
	}
}
/*
	vision : la vision rapporte les creatures a sa portee et etablit des groupes selon la dangerosité.
	
		-> prend les opposant dans un groupe et identifie le premier opposant à engager. Charge...
		-> si combat indésirable elle n'engage pas le combat ou prend la fuite si dangerosite est trop elevee
			-> selon son intelligence

*/
