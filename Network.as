package  {
	import Neuron;
	public class Network {

		var allNodes:Array;
		var score:Number;
		public function Network(layers:int, nodes:int) {
			allNodes = new Array();
			var layerN:int;
			var nodeN:int;
			for(layerN = 0; layerN < layers; layerN++)
			{
				allNodes[layerN] = new Array();
				for(nodeN = 0; nodeN<nodes; nodeN++)
				{
					allNodes[layerN][nodeN] = new Neuron(null);
				}
			}
			for(layerN = layers-1; layerN >= 0; layerN--)
			{
				trace(allNodes[layerN]);
			}
			for(layerN = layers-2; layerN >= 0; layerN--)
			{
				for(nodeN = 0; nodeN<nodes; nodeN++)
				{
					trace(layerN);
					var n:Neuron = allNodes[layerN][nodeN];
					n.setChildNeurons(allNodes[layerN+1]);
				}
			}
		}
	
		
		public function setSingleInput(index:int, value:Number)
		{
			var n:Neuron = allNodes[0][index];
			n.value = value;
		}

		public function getSingleOutput(index:int):Number
		{
			var n:Neuron = allNodes[allNodes.length-1][index];
			return n.value;
		}
	}
	
}
