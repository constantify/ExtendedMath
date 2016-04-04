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
			trace(ExtendedMath.isPowerOfTwo(1024));
		}

	}
	
}
