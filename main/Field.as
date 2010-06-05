package main
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.utils.Dictionary;
	
	public class Field extends Sprite
	{
		private const SIZE_X:int = 5;
		private const SIZE_Y:int = 5;
		
		private const CELL_W:int = 168;
		private const CELL_H:int = 85;
		
		public var CellImg:Cell;
		public var Plants:Dictionary = new Dictionary(); 
		
		public function Field()
		{
			super();
			CellImg = new Cell(CELL_W, CELL_H);
			for (var x:int = 0; x<SIZE_X; x++)
				for (var y:int = 0; y<SIZE_Y; y++)
				{
					var cell:Bitmap = new Bitmap(CellImg);
					cell.x = GetCellCoordX(x,y) - CELL_W / 2;
					cell.y = GetCellCoordY(x,y) - CELL_H / 2;
					addChild(cell);
				}
		}
		
		private function GetCellCoordX(cellX:int, cellY:int):Number
		{
			return (cellX + cellY) * CELL_W / 2;
		}

		private function GetCellCoordY(cellX:int, cellY:int):Number
		{
			return (cellX - cellY) * CELL_H / 2;
		}
		
		public function SetPlant(id:int, type:String, stage:int, x:int, y:int)
		{
			var exPlant:Plant = Plant(Plants[id]);
			if (exPlant != null)
			{
				exPlant.Stage = stage;
			}
			else
			{
				var newPlant:Plant = Plant.CreatePlant(id, type, stage);
				if (newPlant != null)
				{
					newPlant.x = GetCellCoordX(x, y);
					newPlant.y = GetCellCoordY(x, y);
					addChild(newPlant);
					Plants[id] = newPlant;
				}
			}
		}
		
		public function DeletePlant(id)
		{
			var delPlant:Plant = Plant(Plants[id]);
			if (delPlant != null)
			{
				removeChild(delPlant);
				Plants[id] = null;
				delete Plants[id];
			}
		}
	}
}