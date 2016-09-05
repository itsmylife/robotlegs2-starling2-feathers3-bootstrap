package com.itsmylife.starling.demo
{
	import com.itsmylife.starling.demo.main.StarlingDemoConfig;
	import com.itsmylife.starling.demo.main.controller.StartUpSignal;
	import com.itsmylife.starling.demo.main.view.StarlingRootSprite;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.signalCommandMap.SignalCommandMapExtension;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;
	import robotlegs.extensions.starlingViewMap.StarlingViewMapExtension;
	
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author ismail şimşek
	 */
	[SWF(width = "400", height = "300", frameRate = "60", backgroundColor = "#ffffff")]
	public class StarlingDemo extends Sprite
	{
		public var context:IContext;
		public var starling:Starling;
		
		public function StarlingDemo():void
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			initStage();
			initStarling();
		}
		
		private function initStage():void
		{
			if (stage)
			{
				stage.scaleMode = StageScaleMode.NO_SCALE;
				stage.align = StageAlign.TOP_LEFT;
				stage.frameRate = 60;
			}
			
			mouseEnabled = mouseChildren = false;
		}
		
		private function initStarling():void
		{
			starling = new Starling(StarlingRootSprite, stage);
			starling.addEventListener("context3DCreate", onStarlingRootCreated);
			starling.enableErrorChecking = true;
			starling.showStats = true;
			starling.start();
		}
		
		private function onStarlingRootCreated(e:Object):void
		{
			initRobotlegs();
		}
		
		private function initRobotlegs():void
		{
			context = new Context()
					.afterInitializing(init)
					.install(MVCSBundle, StarlingViewMapExtension, SignalCommandMapExtension)
					.configure(StarlingDemoConfig, this, starling);
			
			context.configure(new ContextView(this));
		}
		
		public function init():void
		{
			var startUpSignal:StartUpSignal = context.injector.getInstance(StartUpSignal) as StartUpSignal;
			startUpSignal.dispatch();
		}
	}

}