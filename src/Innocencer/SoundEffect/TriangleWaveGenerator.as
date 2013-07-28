package Innocencer.SoundEffect
{
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.utils.ByteArray;

	public class TriangleWaveGenerator
	{
		private var sound:Sound = new Sound();
		private var channel:SoundChannel;
		
		public function TriangleWaveGenerator()
		{
		}
		
		public function play():void
		{
			var a:Number = 0.3; // 振幅
			var f0:Number = 262.0; // 基本周波数
			var fs:Number = 44100; // サンプリング周波数
			var time:Number = 1.0; // 再生する秒数
			var samples:int = fs * time; // サンプル数
			
			var byteArray:ByteArray = new ByteArray();
			for (var i:int = 0; i < samples; i++)
			{
				var n:Number = Math.sin(i * f0 * Math.PI * 2 / fs) * a;
				byteArray.writeFloat(n);
			}
			byteArray.position = 0;
			this.sound.loadPCMFromByteArray(byteArray, samples, "float", false, fs);
			this.channel = this.sound.play();
			this.channel.addEventListener(Event.SOUND_COMPLETE, function(e:Event):void
				{
					channel.stop();
					channel = null;
				});
		}
	}
}