package Innocencer.DisplayEffect
{
	import flash.display.CapsStyle;
	import flash.display.JointStyle;
	import flash.display.LineScaleMode;

	public class Circle extends EffectBase
	{
		public function Circle(x:Number, y:Number)
		{
			super(x, y);
		}
		
		public override function effectClear():void
		{
			this.graphics.clear();
		}
		
		public override function effectEnlarge():void
		{
			super.effectEnlarge();
			this.graphics.lineStyle(this.lineWidth, this.COLOR, this.lineAlpha, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.MITER);
		}
		
		public override function display():void
		{
			this.graphics.drawCircle(this.pointX, this.pointY, this.r);
		}

	}
}