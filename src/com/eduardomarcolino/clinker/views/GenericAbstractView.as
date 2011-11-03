package com.eduardomarcolino.clinker.views
{
	import flash.events.Event;
	import flash.display.MovieClip;
	
	public class GenericAbstractView extends MovieClip implements View
	{
		public function onEnter() : void { alignToCenter(); this.visible = true; }
		public function onLeave() : void { this.visible = false; }
		public function onResize(event:Event) : void { alignToCenter(); }
		
		public function alignToCenter() 
		{
			this.y = (stage.stageHeight/2) - (this.height/2);
			this.x = (stage.stageWidth/2)  - (this.width/2);
		}
	}
}