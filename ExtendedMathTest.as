package  {
	import flash.events.Event;
	import flash.display.MovieClip;
	
	public class ExtendedMathTest extends MovieClip {

		public function ExtendedMathTest() {
			// constructor code
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(evt:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			//trace(ExtendedMath.repeat(15));
			
			for each( var t in [0,1,2,3,4,5,6,7,8]) {
			   //trace(ExtendedMath.pingPong(t, 3));
		    }
		}

	}
	
}
