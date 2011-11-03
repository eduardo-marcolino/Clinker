package com.eduardomarcolino.clinker
{
	import flash.utils.Dictionary;
	import com.eduardomarcolino.clinker.views.View;
	import com.eduardomarcolino.clinker.views.impl.*;
	
	public class Route
	{
		var routes:Dictionary;
		
		public function Route() 
		{
			routes 			= new Dictionary();
			routes['404'] 	= new NotFoundView();
			routes['index'] = new IndexView();
		}
		
		public function add(url:String, view:View) : void { routes[url] = view; }
		
		public function get(url:String) : View 
    	{
			if (routes.hasOwnProperty(url) == true) {
				return routes[url];
			} else {
				return routes['404'];
			}
		}
		

	}
}