package com.itsmylife.starling.demo.main.view
{
	import feathers.controls.Button;
	import feathers.controls.TextCallout;
	import feathers.themes.MetalWorksDesktopTheme;
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author ismail şimşek
	 */
	public class StarlingRootSprite extends Sprite implements IStarlingRootSprite
	{
		private var _button:Button;
		public function get button():Button  { return _button; }
		public function set button(value:Button):void  { _button = value; }
		
		public function initApp(app:Class = null):void
		{
			new MetalWorksDesktopTheme();
			
			if (app != null) addChild(new app());
			
			this.button = new Button();
			this.button.label = "Click Me";
			this.button.addEventListener(Event.TRIGGERED, button_triggeredHandler);
			this.addChild(this.button);
			this.button.validate();
			
			this.button.x = Math.round((Starling.current.stage.stageWidth - this.button.width) / 2);
			this.button.y = Math.round((Starling.current.stage.stageHeight - this.button.height) / 2);
		}
		
		private function button_triggeredHandler(event:Event):void
		{
			TextCallout.show("Hi, I'm Feathers!\nHave a nice day.", this.button);
		}
		
		
	}

}