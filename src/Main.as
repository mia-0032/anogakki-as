package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import Innocencer.DisplayEffect.Circle;
	import Innocencer.DisplayEffect.EffectBase;
	import Innocencer.DisplayEffect.Rect;
	import Innocencer.SoundEffect.TriangleWaveGenerator;
	
	[SWF(frameRate = "30")]
	public class Main extends Sprite
	{
		private var effects:Array = new Array();
		private var sound:TriangleWaveGenerator = new TriangleWaveGenerator;
		
		public function Main()
		{
			stage.color = 0x0;
			stage.addEventListener(MouseEvent.CLICK, addEffect);
			stage.addEventListener(MouseEvent.CLICK, playSound);
			stage.addEventListener(Event.ENTER_FRAME, makeEffectLarger);
		}
		
		private function addEffect(event:MouseEvent): void
		{
			var effect:EffectBase;
			switch(Math.round(Math.random() * 2 + 0.5)){
				case 1:
					effect = new Circle(mouseX, mouseY);
					break;
				case 2:
					effect = new Rect(mouseX, mouseY);
					break;
				default:
			}
			
			effects.push(effect);
			this.addChild(effect);
		}
		
		private function playSound(event:MouseEvent): void
		{
			//sound.play();
		}
		
		private function makeEffectLarger(event:Event): void
		{
			this.effects.forEach(
				function(effect:EffectBase, index:Number, effects:Array): void
				{
					effect.effectClear();
					effect.effectEnlarge();
					effect.display();
					if(effect.isFinished()){
						removeChild(effect);
					}
				}
			);
			this.effects = this.effects.filter(
				function(effect:EffectBase, index:Number, effects:Array): Boolean
				{
					return !effect.isFinished();
				}
			);
		}
	}
}