package com.itsmylife.starling.demo.main.view
{
	import feathers.controls.Button;
	
	/**
	 * ...
	 * @author ismail şimşek
	 */
	public interface IStarlingRootSprite
	{
		function initApp(app:Class = null):void;
		function get button():Button;
		function set button(value:Button):void;
	}

}