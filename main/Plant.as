package main
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	
	public class Plant extends MovieClip
	{
		public var Id:int;
		private var _stage:int;
		
		public var Image:Bitmap;
		
		public function Plant(id:int, stage:int)
		{
			super();
			Id = id;
			Image =  new Bitmap();
			Stage = stage; 
			addChild(Image);
		}
		
		public function get Type():String
		{
			return "";
		}
		
		public function ImageUrl(stage:int):String
		{
			return "images/stages/" + Type + "_" + stage + ".png";
		}
		
		public static function CreatePlant(id:int, type:String, stage:int):Plant
		{
			switch (type)
			{
				case "turnip":
					return new Turnip(id, stage);
				default:
					return null;
			}
		}
		
		public function get Stage():int
		{
			return _stage;
		}
		
		public function set Stage(value:int)
		{
			_stage = value;
		}
	}
}