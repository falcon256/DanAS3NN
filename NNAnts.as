package  {
	
    import flash.utils.getTimer;
	import flash.display.MovieClip;
	import Neuron;
	import Network;
	
	public class NNAnts extends MovieClip {
		
		var Networks:Array;
		public function NNAnts() {
			Networks = new Array();
			Networks[0] = new Network(5,5);
			var x:int;
			var y:int;
			var n:Network;
			var ne:Neuron;
			for(x = 0; x < 5; x++)
			{
				for(y = 0; y < 5; y++)
				{
					n = Networks[0];
					ne = n.allNodes[x][y];
					ne.mutateNeuron(1,1);
					trace(ne.childWeights);
					trace(ne.childBiases);
					trace(ne.value);
				}
			}
			
			
			
			for(x = 0; x < 5; x++)
			{
				for(y = 0; y < 5; y++)
				{
					n = Networks[0];
					ne = n.allNodes[x][y];
					ne.Tick();
					trace(ne.value);
				}
			}
			
			trace("Starting second mutated network");
			var newNet:Network = n.mutateAndReturnNewNetwork(0.1,0.01,0.01);
			for(x = 0; x < 5; x++)
			{
				for(y = 0; y < 5; y++)
				{	
					ne = newNet.allNodes[x][y];
					ne.Tick();
					trace(ne.value);
				}
			}
			var tests:int = 100000;
			var startDate:Date = new Date();
			var startTime:Number = getTimer();
			for(var ticks:int = 0; ticks<10000; ticks++)
			{
				newNet.tickNetwork();
			}
			var endTime:Number = getTimer();
			trace(((endTime-startTime)/tests)+" ms per 5x5 network tick.");
			
		}
	}
	
}
