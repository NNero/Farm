package main
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;

	public class Turnip extends Plant
	{
		private static var StageImages:Array = new Array();
		
		public function Turnip(id:int, stage:int)
		{
			super(id, stage);
		}
		
		override public function get Type():String
		{
			return "turnip";
		}
		
		override public function set Stage(value:int)
		{
			if (Stage != value)
			{
				super.Stage = value;
				if (StageImages[value] == null)
				{
					var img:Loader = new Loader();
					var url:URLRequest = new URLRequest(ImageUrl(value));
					img.load(url);
					img.contentLoaderInfo.addEventListener(Event.COMPLETE, function(event:Event){
						StageImages[value] = Bitmap(event.target.content).bitmapData;
						ShowImage(value);
					});
				}
				else
					ShowImage(value);
			}
		}
		
		private function ShowImage(stage:int)
		{
			Image.bitmapData = BitmapData(StageImages[stage]);
			Image.x = - Image.width / 2;
			Image.y = - 2 * Image.height / 3;
		}
	}
}