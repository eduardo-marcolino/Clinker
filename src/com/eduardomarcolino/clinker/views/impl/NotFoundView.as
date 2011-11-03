package com.eduardomarcolino.clinker.views.impl
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Stage
  
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	
	import com.eduardomarcolino.clinker.views.GenericAbstractView;
	
	public class NotFoundView extends GenericAbstractView
	{
		public function NotFoundView() 
		{
			var format:TextFormat = new TextFormat();
	    	format.size = 20;
			format.letterSpacing = 1;
			
			var label:TextField = new TextField();
			label.text = "Page not found";
			label.textColor = 0xFFFFFF;
			label.selectable = false;
      		label.autoSize=TextFieldAutoSize.LEFT;
			label.setTextFormat(format);
      
			var box = new MovieClip();
			box.graphics.beginFill(0xE01B1B, 1);
			box.graphics.drawRect(0,0,500,100);
			box.graphics.endFill();
			
			label.x = (box.width/2)  - (label.width /2);
			label.y = (box.height/2) - (label.height /2);
      
      		box.addChild(label);
				
			this.addChild(box);
		}
	}
}