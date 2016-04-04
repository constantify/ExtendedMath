package  {
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.utils.getTimer;
	
	public class Time extends Sprite{

		private static var instance:Time = new Time();
		private static var currentTime:int;
		private static var previousTime:int;
		
		public function Time() {
			if(instance) throw new Error("This class can't be instantiated!");
			addEventListener(Event.ENTER_FRAME, updateTime, false, 0, true);
			currentTime = getTimer();
		}
		private function updateTime(evt:Event):void {
			previousTime = currentTime;
			currentTime = getTimer();
		}
		public static function get deltaTime():Number {
			return (currentTime-previousTime)/1000;
		}
	}
	
}
