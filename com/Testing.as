package com
{
	import com.ludus.stuffs.Baton;
	import com.ludus.stuffs.Tonfa;
	import com.IA.FuzzyLogic;
	
	public class Testing
	{
		/**
		 * INITIALISATION DES TESTS
		 */
		public function Testing()
		{
			
		}
		
		public function testPrendre()
		{
			
			var tonfa = new Tonfa("s2");
			
			Global.PLAYER.relacher(tonfa);
		}
		
		public function testFuzzy()
		{
				var obj = {
				crisp_input: [150, 10],
				variables_input: [
					{
						name: "Distance to Target",
						setsName: ["Close", "Medium", "Far"],
						sets: [
							[0,0,25,150], 		// close distance
							[25,150,150,300],	// medium
							[150,300,400,400]	// far
						]
					},
					{
						name: "Defense",
						setsName: ["Light", "Medium", "Heavy"],
						sets: [
							[0,0,0,10],			// light
							[0,10,10,30],		// medium
							[10,30,40,40]		// heavy defense
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
					[0,2,0], // nfo:Distance to target -> close:undesirable, medium:very desirable, far:undesirable
					[0,1,2]  // nfo:Defense -> light:undesirable, medium:desirable, heavy:very desirable
				]
			};
			var fl:FuzzyLogic = new FuzzyLogic(); trace(fl.getResult(obj));
		}
	}
}