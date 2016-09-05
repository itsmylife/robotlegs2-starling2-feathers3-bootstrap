package com.itsmylife.starling.demo.main.view 
{
	import com.itsmylife.starling.demo.main.StarlingDemoGlobals;
	import robotlegs.extensions.starlingViewMap.impl.StarlingMediator;
	
	/**
	 * ...
	 * @author ismail şimşek
	 */
	public class StarlingRootSpriteMediator extends StarlingMediator 
	{
		
		[Inject]
		public var view:IStarlingRootSprite;
		
		
		override public function initialize():void
		{
			view.initApp();
		}
		
	}

}