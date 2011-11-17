package com.eduardomarcolino.clinker
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;
	
	import com.eduardomarcolino.clinker.views.*;
	
	public class EventHandler
	{
		private var route:Route;
		private var stage:Stage;
		private var stageHandler:StageHandler;
		private var currentView:View;
		
		public function EventHandler(mainStage:Stage, mainRoute:Route)
		{
			route 		 = mainRoute;
			stage 		 = mainStage;
			stageHandler = StageHandler.getInstance();
			
			stage.addEventListener(PageEvent.OPEN, function(e:PageEvent):void { call(e.params.url);}, true);
			stage.addEventListener(Event.RESIZE, stageResize);
		}
		
		public function stageResize(e:Event) 
		{
			var view = currentView as View

      StageHandler.layout.onResize(e);
			view.onResize(e);
		}
		
		public function start() { call('index'); }

		public function call(url:String) 
		{
			var view = stageHandler.render(route.get(url)) as View;
			if (currentView != null) { currentView.onLeave(); }
      
			StageHandler.layout.onViewChange();
			view.onEnter();
			currentView = view;
		}
	}
}