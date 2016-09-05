package com.itsmylife.starling.demo.main
{
	import com.itsmylife.starling.demo.main.controller.StartUpCommand;
	import com.itsmylife.starling.demo.main.controller.StartUpSignal;
	import com.itsmylife.starling.demo.main.view.IStarlingRootSprite;
	import com.itsmylife.starling.demo.main.view.StarlingRootSpriteMediator;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	
	/**
	 * ...
	 * @author ismail şimşek
	 */
	public class StarlingDemoConfig implements IConfig
	{
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		[Inject]
		public var signalCommandMap:ISignalCommandMap;
		
		public function StarlingDemoConfig()
		{
		
		}
		
		/* INTERFACE robotlegs.bender.framework.api.IConfig */
		
		public function configure():void
		{
			mediatorMap.map(IStarlingRootSprite).toMediator(StarlingRootSpriteMediator);
			
			signalCommandMap.map(StartUpSignal).toCommand(StartUpCommand);
		}
	
	}

}