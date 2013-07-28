package Innocencer.DisplayEffect
{
	import flash.display.*;

    public class Rect extends EffectBase
	{
		private var base:Sprite;
		private var rrect:Shape;
		
		public function Rect(x:Number, y:Number)
		{
			base = new Sprite();
			base.x = x;
			base.y = y;
			addChild(base);
			
			// baseに対して、四角をadd
			rrect = new Shape();
			base.addChild(rrect);
			super(x, y);
		}
		
		public override function effectClear():void
		{
			this.rrect.graphics.clear();
		}
		
		public override function effectEnlarge():void
		{
			super.effectEnlarge();
			this.base.rotation += 3;
			this.rrect.graphics.lineStyle(this.lineWidth, this.COLOR, this.lineAlpha, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.MITER);
		}
		
		public override function display():void
		{
			this.rrect.graphics.drawRect(-1 * this.r/2, -1 * this.r/2, this.r, this.r);
		}
		
		public override function destruct():void
		{
			this.base.removeChild(this.rrect);
			this.removeChild(this.base);
		}
	}
}