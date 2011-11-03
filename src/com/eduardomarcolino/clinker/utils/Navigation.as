package com.eduardomarcolino.clinker.utils
{
	import flash.display.Stage;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	import com.eduardomarcolino.clinker.PageEvent;
	
	public class Navigation 
	{
		public static function to(url:String, mc:MovieClip, mouseEvent:String = 'click'):void 
		{
			mc.addEventListener(mouseEvent,function():void {
				mc.dispatchEvent(new PageEvent(PageEvent.OPEN,{ url: url }));
			});
		}
	}
}