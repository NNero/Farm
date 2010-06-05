package main
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	public class FarmService
	{
		public static const SERVER_NAME = "http://localhost:1112/";
		public static const SERVICE_NAME = "methods.ashx";

		public static function Reset()
		{
			Execute("reset");
		}
		
		public static function Next(callback:Function)
		{
			Execute("next", callback);
		}
		
		private static function Execute(method:String, callback:Function = null)
		{
			var loader:URLLoader = new URLLoader();
			var request:URLRequest = new URLRequest(SERVER_NAME + SERVICE_NAME + "?method=" + method + "&" + (new Date()).getTime());
			request.method = "POST";
			if (callback != null)
			{
				loader.addEventListener(Event.COMPLETE, callback);
			}
			loader.load(request);
		}
	}
}