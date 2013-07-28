package Innocencer.DisplayEffect
{
	import flash.display.CapsStyle;
	import flash.display.JointStyle;
	import flash.display.LineScaleMode;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class EffectBase  extends Sprite implements IDisplay
	{
		protected var lineWidth:Number = 4.0;
		protected var pointX:Number;
		protected var pointY:Number;
		protected var r:Number = 100;
		protected var lineAlpha:Number = 1;
		protected const COLOR:Number = 0x00FFCC;
		
		public function EffectBase(x:Number, y:Number)
		{
			super();
			this.graphics.lineStyle(this.lineWidth, this.COLOR, this.lineAlpha, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.MITER);
			this.pointX = x;
			this.pointY = y;
			addEventListener(Event.REMOVED_FROM_STAGE,   
				function(e:Event):void {  
					removeEventListener(Event.REMOVED_FROM_STAGE, arguments.callee);  
					destruct();  
				}  
			);
		}
		
		public function effectClear():void
		{
			
		}

		public function effectEnlarge():void
		{
			this.lineWidth += 1.0;
			this.r += 5.0;
			this.lineAlpha -= 0.03;
		}
		
		public function display():void
		{
			
		}

		public function isFinished():Boolean
		{
			if(this.lineAlpha < 0){
				return true;
			}
			return false;
		}
		
		public function destruct():void
		{
			
		}
	}
}