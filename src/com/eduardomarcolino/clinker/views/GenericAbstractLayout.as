package com.eduardomarcolino.clinker.views
{
	import flash.events.Event;
	import flash.display.MovieClip;
	
	public class GenericAbstractLayout extends MovieClip implements Layout
	{
		var target:MovieClip;
		
		public function GenericAbstractLayout()
		{
			target 		= new MovieClip();
			target.name = 'target';
			
			this.addChild(target);
		}
		public function onResize(event:Event) : void {}
		public function onViewChange() : void {}
	}
}