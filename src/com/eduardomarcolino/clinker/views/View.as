package com.eduardomarcolino.clinker.views
{
	import flash.events.Event;
	import flash.display.MovieClip;
	
	public interface View
	{
		function onEnter() : void;
		function onLeave() : void;
		function onResize(event:Event) : void;
	}
}