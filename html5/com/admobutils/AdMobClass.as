package com.admobutils 
{
	import com.milkmangames.nativeextensions.*;
    import com.milkmangames.nativeextensions.events.*;
	    
	import flash.text.TextField;
    import flash.display.Sprite;
	
	/**
	 * ...
	 * @author zulad
	 */
	public class AdMobClass 
	{
		
		/** Status admob utils*/ 
		public var txtStatus:TextField;
		/** Buttons */
		public var buttonContainer:Sprite;
		/** Visibility */
		public var adIsVisible:Boolean;
		
		public function AdMobClass() 
		{
			//
			if (!AdMob.isSupported)
			{
				log("AdMob is not supported on this platform.");
				return;
			}
			
			log("initializing AdMob...");		
			
			// for the AdMob for Android or AdMob for iOS Extension:
			AdMob.init("ca-app-pub-8253757391035781~6128505520");
			
			// for the AdMob for Android AND iOS Extension:
			// AdMob.init("your_android_p_id","your_ios_id");
			
			log("AdMob v"+AdMob.VERSION+" Initialized!");
			
			// during TESTING, activate test IDs.  You want to REMOVE this before publishing your final application.
			AdMob.enableTestDeviceIDs(AdMob.getCurrentTestDeviceIDs());
			
			AdMob.addEventListener(AdMobErrorEvent.FAILED_TO_RECEIVE_AD,onFailedReceiveAd);
			AdMob.addEventListener(AdMobEvent.RECEIVED_AD,onReceiveAd);
			AdMob.addEventListener(AdMobEvent.SCREEN_PRESENTED,onScreenPresented);
			AdMob.addEventListener(AdMobEvent.SCREEN_DISMISSED,onScreenDismissed);
			AdMob.addEventListener(AdMobEvent.LEAVE_APPLICATION,onLeaveApplication);
			
			AdMob.addEventListener(AdMobEvent.REWARDED_VIDEO_CLOSED, onRewardedVideoClosed);
			AdMob.addEventListener(AdMobEvent.REWARDED_VIDEO_OPENED, onRewardedVideoOpened);
			AdMob.addEventListener(AdMobEvent.REWARDED_VIDEO_STARTED, onRewardedVideoStarted);
			AdMob.addEventListener(AdMobEvent.REWARDED_VIDEO_REWARDED, onRewardedVideoRewarded);
		}
		
		// adMob
			
		/** Destroy Banner Ad */
		public function destroyAd():void
		{
			log("Destroying ad.");
			AdMob.destroyAd();
			log("->ad destroyed");
		}
		
		/** Show Smart Banner Ad */
		public function showSmartBanner():void
		{
			log("->display smart banner.");
			AdMob.showAd(AdMobAdType.SMART_BANNER, AdMobAlignment.LEFT, AdMobAlignment.BOTTOM);
			log("Requested show smart banner.");
		}
		
		/** Show Ad */
		public function showAdTopLeft():void
		{
			log("->display ad top left...");
			AdMob.showAd(AdMobAdType.BANNER, AdMobAlignment.LEFT, AdMobAlignment.TOP);
			log("Requested show ad top left.");
		}
		
		/** Show Ad */
		public function showAdTopRight():void
		{
			log("->display ad top right...");
			AdMob.showAd(AdMobAdType.BANNER, AdMobAlignment.RIGHT, AdMobAlignment.TOP);
			log("Requested show ad top right.");
		}
		
		/** Show Ad */
		public function showAdBottomCenter():void
		{
			log("->display ad bottom center...");
			AdMob.showAd(AdMobAdType.BANNER, AdMobAlignment.CENTER, AdMobAlignment.BOTTOM);
			log("Requested show ad bottom center.");
		}
		
		/** Refresh Ad */
		public function refreshAd():void
		{
			log("Refreshing banner ad.");
			AdMob.refreshAd();
		}
		
		/** Toggle Ad Visibility */
		public function toggleAdVisibility():void
		{
			adIsVisible=!adIsVisible;
			log("Toggle visibility.");
			try
			{
				AdMob.setVisibility(adIsVisible);
			}
			catch (e:Error)
			{
				log("cant change visibility - do you have an ad loaded?");
				adIsVisible=!adIsVisible;
			}
		}
		
		/** Load Interstitial Ad, with automatic display */
		public function showInterstitialAd():void
		{
			log("Loading interstitial..");
			
			// you can't load an interstitial until the last interstitial is gone- if you try
			// there will be an error thrown.  if you want to load them in succession,
			// wait for either SCREEN_DISMISSED or FAILED_TO_RECEIVE_AD (with isInterstitial=true)
			// before loading the next one.		
			try
			{
				AdMob.loadInterstitial("ca-app-pub-8253757391035781/7617068433", true);
			}
			catch (e:Error)
			{
				log("Can't load right now- did you wait for the old interstitial to finish?");
				return;
			}
			
			// if you are targeting ios and android with the same code, and have an ad unit id
			// for each platform, put the ios one last
			//AdMob.loadInterstitial("android interstitial ad unit id here", true, "ios interstitial ad unit id here");
			
			log("Waiting for interstitial to auto-show.");		
		}
		
		/** Preload an interstitial ad */
		public function preloadInterstitialAd():void
		{
			log("Preoading interstitial..");
			
			// you can't preload an interstitial until the last interstitial is gone- if you try
			// there will be an error thrown.  if you want to load them in succession,
			// wait for either SCREEN_DISMISSED or FAILED_TO_RECEIVE_AD (with isInterstitial=true)
			// before loading the next one.
			
			try
			{
				AdMob.loadInterstitial("interstitial ad unit id here", false);
			} 
			catch (e:Error)
			{
				log("Can't load right now- did you wait for the old interstitial to finish?");
				return;
			}
			// if you are targeting ios and android with the same code, and have an ad unit id
			// for each platform, put the ios one last
			//AdMob.loadInterstitial("android interstitial ad unit id here", false, "ios interstitial ad unit id here");
			
			log("Waiting for interstitial to preload.");		
		}	
		
		/** Show Pending Interstitial */
		public function showPendingInterstitial():void
		{
			var isInterstitialReady:Boolean=AdMob.isInterstitialReady();
			if (!isInterstitialReady)
			{
				log("The interstitial is not yet preloaded!");
				return;
			}
			
			log("Showing preloaded interstitial.");
			AdMob.showPendingInterstitial();
		}
		
		/** Load Rewarded Video Ad, with automatic display */
		public function showRewardedVideoAd():void
		{
			log("Loading rewarded video..");

			try
			{
				AdMob.loadRewardedVideo("your rewarded video ad unit id here", true);
			} 
			catch (e:Error)
			{
				log("Can't load right now- did you wait for the old rewarded video to finish?");
				return;
			}
			

			log("Waiting for rewarded video to auto-show");		
		}
		
		/** Preload a rewarded video ad */
		public function preloadRewardedVideoAd():void
		{
			log("Preloading rewarded video..");

			try
			{
				AdMob.loadRewardedVideo("your rewarded video ad unit id here", false);
			} 
			catch (e:Error)
			{
				log("Can't load right now- did you wait for the old rewarded video to finish?");
				return;
			}
			
			
			log("Waiting for rewarded video to preload.");		
		}
		
		/** Show Pending Rewarded Video */
		public function showPendingRewardedVideo():void
		{
			var isRewardedVideoReady:Boolean=AdMob.isRewardedVideoReady();
			if (!isRewardedVideoReady)
			{
				log("The rewarded video is not yet preloaded!");
				return;
			}
			
			log("Showing preloaded rewarded video.");
			AdMob.showPendingRewardedVideo();
			log("Waiting for rewarded video display...");
		}
		
		//
		// Events
		//
		
		/** On Failed Receive Ad */
		public function onFailedReceiveAd(e:AdMobErrorEvent):void
		{
			log("ERROR receiving ad, reason: '"+e.text+"'");
		}
		
		/** On Receive Ad */
		public function onReceiveAd(e:AdMobEvent):void
		{
			log("Received ad:"+e.isInterstitial+":"+e.dimensions);
		}
		
		/** On Screen Presented */
		public function onScreenPresented(e:AdMobEvent):void
		{
			log("Screen Presented.");
		}
		
		/** On Screen Dismissed */
		public function onScreenDismissed(e:AdMobEvent):void
		{
			log("Screen Dismissed.");
		}
		
		/** On Leave Application */
		public function onLeaveApplication(e:AdMobEvent):void
		{
			log("Leave Application.");
		}
		
		/** On Rewarded Video Opened */
		public function onRewardedVideoOpened(e:AdMobEvent):void
		{
			log("Rewarded video opened.");
		}
		
		/** On Rewarded Video Closed */
		public function onRewardedVideoClosed(e:AdMobEvent):void
		{
			log("Rewarded video closed.");
		}
		
		/** On Rewarded Video Started */
		public function onRewardedVideoStarted(e:AdMobEvent):void
		{
			log("Rewarded video started.");
		}
		
		/** On Rewarded Video Reward */
		public function onRewardedVideoRewarded(e:AdMobEvent):void
		{
			log("Reward amount "+e.rewardAmount+" won for type "+e.rewardType);
		}
		
		
		//
		// Impelementation
		//
		
		/** Log */
		public function log(msg:String):void
		{
//trace("[AdMobExample] "+msg);
			Global.debug_this(msg);
		}
	}

}