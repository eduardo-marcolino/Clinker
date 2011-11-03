package com.eduardomarcolino.clinker
{
	import flash.display.MovieClip;
	import flash.utils.getQualifiedClassName;
	import flash.display.Stage;
	
	import com.eduardomarcolino.clinker.views.*;
	
	public class StageHandler extends MovieClip
	{
		private static var instance:StageHandler;
		private static var allowInstantiation:Boolean;
		public  static var layout:MovieClip; 
		
		public function StageHandler()
		{			
			if (!allowInstantiation) {
				throw new Error("Use getInstance() instead of new");
			}
		}
		
		public function render(view:View) : View 
		{
			var target = layout.getChildByName("target");
			var loadedView = getLoadedView(view);
			
			target.addChild(loadedView);

			return loadedView;
		}
		
		public function getLoadedView(view:View):View {
			var target = layout.getChildByName("target");
			if(target.numChildren!=0)
			{
        		var k:int = target.numChildren;
        		while(k--) {
					if(getQualifiedClassName(view) == getQualifiedClassName(target.getChildAt(k))) {
						view = target.getChildAt(k);
					}
        		}
    		}
			return view;
		}
		
		public static function getInstance(mainStage:Stage = null, mainLayout:MovieClip = null):StageHandler 
		{
			if (instance == null) 
			{
				allowInstantiation = true;
				instance = new StageHandler();
				
				if (mainLayout is Layout)
				{
					if (mainLayout.getChildByName("target") == null) {
						throw new Error("Layout must have a movie clip instance named target");
					}
				} else {
					throw new Error("Layout must implement the Layout interface");
				}
				
				layout = mainLayout;
				mainStage.addChild(mainLayout);
				allowInstantiation = false;
			}
			return instance;
		}
	}
}