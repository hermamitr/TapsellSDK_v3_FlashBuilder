package ir.tapsell.TapsellAirSample
{
	
	import ir.tapsell.sdk.air.Tapsell;
	import ir.tapsell.sdk.air.TapsellAdRequestListener;
	import ir.tapsell.sdk.air.TapsellAdShowFinishedListener;

	public class TapsellImpl implements TapsellAdRequestListener, TapsellAdShowFinishedListener
	{
		
		private static var tapsell:Tapsell = Tapsell.getInstance();
		
		private static var tapsellAdId:String = null;
		
		public function TapsellImpl(appKey:String)
		{
			tapsell.initialize(appKey);
			tapsell.setDebugMode(true);
			//tapsell.setPermissionHandlingMode(Tapsell.PERMISSION_HANDLER_AUTO);
			tapsell.setAdRequestListener(this);
			tapsell.setAdShowFinishedListener(this);
		}
		
		public function requestAd(zoneId:String, isCached:Boolean):void{
			tapsell.requestAd(zoneId,isCached);
		}
		
		public function showAd(adId:String, backDisabled:Boolean, immersiveMode:Boolean, rotationMode:Number, showDialog:Boolean ):void{
			tapsell.showAd(adId,backDisabled,immersiveMode,rotationMode,showDialog);
		}
		
		public function onAdAvailable(zoneId:String,adId:String):void{
			trace("Ad is now available!");
			tapsellAdId = adId;
			trace("Calling showAd");
			showAd(tapsellAdId,false,true,Tapsell.ORIENTATION_UNLOCKED,true);
		}
		
		public function onNoAdAvailable(zoneId:String):void{
			trace("No ad available.");
			tapsellAdId = null;
		}
		
		public function onNoNetwork(zoneId:String):void{
			trace("No Network.");
			tapsellAdId = null;
		}
		
		public function onExpiring(zoneId:String,adId:String):void{
			trace("Expiring, I should retry? :-?.");
			tapsellAdId = null;
		}
		
		public function onOpened(zoneId:String,adId:String):void{
			trace("Ad is opened");
		}
		
		public function onClosed(zoneId:String,adId:String):void{
			trace("Ad is closed");
		}
		
		public function onError(zoneId:String,error:String):void{
			trace("Error...");
		}
		
		public function onAdShowFinished(zoneId:String,adId:String,completed:Boolean,rewarded:Boolean):void{
			trace("Ad show was finished, zoneId: "+zoneId+", completed? "+(completed)+", rewarded? "+(rewarded));
		}
		
		public function getVersion():String{
			return tapsell.getVersion();
		}
		
	}
	
}

