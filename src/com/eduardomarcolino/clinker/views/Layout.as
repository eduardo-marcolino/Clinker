package com.eduardomarcolino.clinker.views
{
	import flash.events.Event;
	import flash.display.MovieClip;
	
	public interface Layout
	{
		function onViewChange() : void;
		function onResize(event:Event) : void;
	}
}