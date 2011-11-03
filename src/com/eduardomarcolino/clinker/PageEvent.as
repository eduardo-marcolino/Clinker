package com.eduardomarcolino.clinker
{
	import flash.events.Event;
	
	public class PageEvent extends Event 
	{
		public static const DEFAULT_NAME:String = "com.eduardomarcolino.flash.PageEvent";
    public static const OPEN:String 		    = "open";
    public var params:Object;		
		
 		public function PageEvent($type:String, $params:Object, $bubbles:Boolean = false, $cancelable:Boolean = false)
    {
      super($type, $bubbles, $cancelable);
      this.params = $params;
    }
    public override function clone():Event
    {
      return new PageEvent(type, this.params, bubbles, cancelable);
    }
       
    public override function toString():String
    {
      return formatToString("PageEvent", "params", "type", "bubbles", "cancelable");
    }
	}
}