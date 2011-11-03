package com.eduardomarcolino.clinker
{
	import flash.display.Stage;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	import com.eduardomarcolino.clinker.views.*;
	
	public class Clinker
	{
		var route:Route;
		var eventHandler:EventHandler;
		var stageHandler:StageHandler;
		var stage:Stage;
		
		//TODO: Turn Rount into singleton
		public function Clinker(config:Object) 
		{
			route 			= new Route();
			stage 			= config.stage;
			stageHandler 	= StageHandler.getInstance(config.stage, config.layout);
			eventHandler 	= new EventHandler(config.stage, route);
		}
		
		public function register(url:String, view:View):void { route.add(url, view); }
		public function run():void { eventHandler.start(); }
	}
}