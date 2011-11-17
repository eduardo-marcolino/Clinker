package com.eduardomarcolino.clinker.utils
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	
	import flash.net.URLRequest;
	
	public class ImagemLoader extends MovieClip
	{		
		var loadingbar:Sprite;
		var loadingbar_track:Sprite;
		
		public function ImagemLoader(image:String = '', useMask:Boolean = false, width:int = 500, height:int = 100)
		{
			super();
		
			var bg_loader:Loader = new Loader();
			bg_loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, progressListener);
      bg_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, hideBar);
			bg_loader.load(new URLRequest(image));
			
			var container:MovieClip = new MovieClip();
			container.graphics.beginFill(0xFFFFFF, 1);
			container.graphics.drawRoundRect(0,0,width,height,10,10);
			container.graphics.endFill();
			
			if (useMask) {
				addChild(container)
				bg_loader.mask = container;
			}
			
			loadingbar = new Sprite();
			loadingbar.graphics.beginFill(0x000000, 0.8);
			loadingbar.graphics.drawRect(0,0,width/2,5);
			loadingbar.graphics.endFill();
			loadingbar.y = (height / 2)
			loadingbar.x = (width / 2) - (loadingbar.width / 2)
			
			loadingbar_track = new Sprite();
			loadingbar_track.graphics.beginFill(0x000000, 0.2);
			loadingbar_track.graphics.drawRect(0,0,width/2,5);
			loadingbar_track.graphics.endFill();
			loadingbar_track.y  = loadingbar.y
			loadingbar_track.x  = loadingbar.x 
			
			addChild(loadingbar_track);
			addChild(loadingbar);
			addChild(bg_loader);
		}
		
		function progressListener (e:ProgressEvent):void{
			var total:Number = e.bytesTotal;
			var loaded:Number = e.bytesLoaded;
			loadingbar.scaleX = loaded/total;
		}
    
    function hideBar (e:Event):void {
      removeChild(loadingbar);
      removeChild(loadingbar_track);
    }
	}
}