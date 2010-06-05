package main
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class App extends MovieClip
	{
		public const FIELD_X:int = 94;
		public const FIELD_Y:int = 225;
		
		public var Field:main.Field;
		public var btnNext:NextButton;
				
		public function App()
		{
			super();
			Field = new main.Field();
			Field.x = FIELD_X;
			Field.y = FIELD_Y;
			addChild(Field);
			
			btnNext = new NextButton();
			btnNext.x = 850 - btnNext.width - 10;
			btnNext.y = 450 - btnNext.height - 10;
			btnNext.addEventListener(MouseEvent.CLICK, LoadNextState);
			addChild(btnNext);
			
			LoadNextState(null);
		}
		
		private var Step:int = 1;
		
		function LoadNextState(event:MouseEvent)
		{
			if (Step <= 7)
			{
				var loader:URLLoader = new URLLoader();
				var request:URLRequest = new URLRequest("xml/SAMPLE" + Step + ".XML");
				loader.load(request);
				loader.addEventListener(Event.COMPLETE, NextStateComplete);
				Step++;
			}
		}
		
		function NextStateComplete(event:Event)
		{
			var ranchoXml = XML(event.target.data);
			var ids:Array = new Array();
			for each (var fieldXml:XML in ranchoXml.field)
			{
				ids.push(fieldXml.crop.@id);
				Field.SetPlant(fieldXml.crop.@id, fieldXml.crop.@klass, fieldXml.crop.@stage, fieldXml.@x, fieldXml.@y);
			}
			for each (var plant:Plant in Field.Plants)
			{
				var isDel:Boolean = true;
				for each (var id:int in ids)
				{
					if (id == plant.Id)
					{
						isDel = false;
						break;
					}
				}
				if (isDel)
				{
					Field.DeletePlant(plant.Id);
				}
			}
		}
	}
}