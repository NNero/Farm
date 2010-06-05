package main
{
	import flash.display.BitmapData;
	
	public class Cell extends BitmapData
	{
		public function Cell(width:int, height:int)
		{
			super(width, height, true, 0xFFFFFFFF);
		}
	}
}